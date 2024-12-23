using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace QLBOWLING.DAO
{
    public class DAO_Bill
    {

        private DbConnection dbConnection;
        public DAO_Bill()
        {
            dbConnection = new DbConnection();
        }

        public DataTable LoadDoanhThuTheoThang(int month, int year)
        {
            using (SqlConnection connection = dbConnection.cnn)
            {
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();

                try
                {
                    // Câu truy vấn để tính doanh thu theo tháng và năm
                    string query = @"
                    SELECT 
                        YEAR(CheckOut) AS Year,
                        MONTH(CheckOut) AS Month,
                        SUM(CASE 
                        WHEN Status = 0 THEN TotalPrice  -- Đã thanh toán
                        WHEN Status = 1 OR Status = 3 THEN DepositPrice  -- Đã đặt cọc hoặc bị hủy
                        ELSE 0
                        END) AS TotalRevenue
                    FROM Bill
                    WHERE YEAR(CheckOut) = @Year AND MONTH(CheckOut) = @Month
                    GROUP BY YEAR(CheckOut), MONTH(CheckOut);";

                    // Tạo SqlCommand
                    using (SqlCommand command = new SqlCommand(query, connection, transaction))
                    {
                        // Thêm tham số vào truy vấn
                        command.Parameters.AddWithValue("@Year", year);
                        command.Parameters.AddWithValue("@Month", month);

                        // Thực thi truy vấn và lưu kết quả vào DataReader
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            // Tạo DataTable để chứa kết quả
                            DataTable dt = new DataTable();
                            dt.Load(reader); // Load dữ liệu từ DataReader vào DataTable

                            // Commit transaction sau khi thành công
                            transaction.Commit();

                            return dt; // Trả về DataTable chứa doanh thu
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Rollback transaction nếu xảy ra lỗi
                    transaction.Rollback();
                    Console.WriteLine($"Error: {ex.Message}");
                    return null; // Trả về null nếu có lỗi
                }
            }
        }

        public DataTable LoadTopCanceller()
        {
            using (SqlConnection connection = dbConnection.cnn)
            {
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();

                try
                {
                    // Câu truy vấn để lấy người hủy nhiều nhất và thông tin liên quan
                    string query = @"
                    SELECT TOP 1 
                        B.UserBooking, 
                        B.CustomerID,
                        B.Email, 
                        B.Phone, 
                    COUNT(A.BillID) AS CancelCount
                    FROM Bill A
                    INNER JOIN Booking B ON A.BookingID = B.BookingID
                    WHERE A.Status = 3
                    GROUP BY B.UserBooking, B.CustomerID, B.Email, B.Phone
                    ORDER BY CancelCount DESC;";

                    // Tạo SqlCommand
                    using (SqlCommand command = new SqlCommand(query, connection, transaction))
                    {
                        // Thực thi truy vấn và lưu kết quả vào DataReader
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            // Tạo DataTable để chứa kết quả
                            DataTable dt = new DataTable();
                            dt.Load(reader); // Load dữ liệu từ DataReader vào DataTable

                            // Commit transaction sau khi thành công
                            transaction.Commit();

                            return dt; // Trả về DataTable chứa thông tin người hủy nhiều nhất
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Rollback transaction nếu xảy ra lỗi
                    transaction.Rollback();
                    Console.WriteLine($"Error: {ex.Message}");
                    return null; // Trả về null nếu có lỗi
                }
            }
        }


    }
}