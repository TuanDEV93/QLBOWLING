﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using QLBOWLING.DTO;

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
        //Cập nhật trạng thái bill
        public int GetCustomerIDByUsername(string username)
        {
            int customerID = 0;
            string query = "SELECT CustomerID FROM Customer WHERE CustomerName = @CustomerName";

            using (SqlConnection connection = new SqlConnection(dbConnection.cnn.ConnectionString)) // Sử dụng SqlConnection mới cho mỗi truy vấn
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Sử dụng Add để chỉ định kiểu dữ liệu rõ ràng
                    command.Parameters.Add("@CustomerName", SqlDbType.NVarChar).Value = username;

                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        customerID = Convert.ToInt32(result);
                    }
                }
            }
            return customerID;
        }
        public int GetLatestBookingIDByCustomerID(int customerID)
        {
            int bookingID = 0;
            string query = @"
            SELECT TOP 1 BookingID
            FROM Booking
            WHERE CustomerID = @CustomerID
            ORDER BY BookingID DESC";

            using (SqlConnection connection = new SqlConnection(dbConnection.cnn.ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@CustomerID", SqlDbType.Int).Value = customerID;

                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        bookingID = Convert.ToInt32(result);
                    }
                }
            }
            return bookingID;
        }

        // Cập nhật trạng thái trong bảng Bill
        public int UpdateBillStatus(int bookingID, int status)
        {
            int rowsAffected = 0;
            string query = "UPDATE Bill SET Status = 1 WHERE BookingID = @BookingID";

            using (SqlConnection connection = new SqlConnection(dbConnection.cnn.ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@Status", SqlDbType.Int).Value = status;
                    command.Parameters.Add("@BookingID", SqlDbType.Int).Value = bookingID;

                    rowsAffected = command.ExecuteNonQuery();
                }
            }

            return rowsAffected;
        }
        //Thanh toán Admin
        public List<BillDTO> GetBills()
        {
            List<BillDTO> billList = new List<BillDTO>();
            string query = @"
            SELECT 
                b.CheckIn, 
                b.CheckOut, 
                b.Status, 
                b.DepositPrice, 
                b.TotalPrice, 
                b.BookingID, 
                bk.UserBooking
            FROM dbo.Bill b
            INNER JOIN dbo.Booking bk ON b.BookingID = bk.BookingID";

            using (SqlConnection connection = new SqlConnection(dbConnection.cnn.ConnectionString))
            {
                connection.Open();
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            BillDTO bill = new BillDTO
                            {
                                CheckIn = reader.IsDBNull(reader.GetOrdinal("CheckIn")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("CheckIn")),
                                CheckOut = reader.IsDBNull(reader.GetOrdinal("CheckOut")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("CheckOut")),
                                Status = reader.IsDBNull(reader.GetOrdinal("Status")) ? "Chờ thanh toán" : MapStatusToText(reader["Status"].ToString()),// Ánh xạ trạng thái
                                DepositPrice = reader.IsDBNull(reader.GetOrdinal("DepositPrice")) ? 0 : Convert.ToDecimal(reader["DepositPrice"]),
                                TotalPrice = reader.IsDBNull(reader.GetOrdinal("TotalPrice")) ? 0 : Convert.ToDecimal(reader["TotalPrice"]),
                                UserBooking = reader.IsDBNull(reader.GetOrdinal("UserBooking")) ? string.Empty : reader["UserBooking"].ToString(),
                                BookingID = reader.GetInt32(reader.GetOrdinal("BookingID"))
                            };
                            billList.Add(bill);
                        }
                    }
                }
            }

            return billList;
        }

        // Ánh xạ trạng thái
        private string MapStatusToText(string statusValue)
        {
            switch (statusValue)
            {
                case "1":
                    return "Đã đặt cọc";
                case "2":
                    return "Chờ thanh toán";
                case "3":
                    return "Bị Huỷ";
                case "4":
                    return "Đang chơi";
                default:
                    return "Đã thanh toán";
            }
        }
        public bool UpdateBillStatus(int bookingID, string status, DateTime? checkInDate, DateTime? checkOutDate)
        {
            string query = "UPDATE dbo.Bill SET Status = @Status, CheckOut = @CheckOut WHERE BookingID = @BookingID";

            using (SqlConnection connection = new SqlConnection(dbConnection.cnn.ConnectionString))
            {
                connection.Open();
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Status", status);
                    cmd.Parameters.AddWithValue("@BookingID", bookingID);

                    // Chỉ cập nhật CheckOut khi trạng thái là "Đã thanh toán"
                    cmd.Parameters.AddWithValue("@CheckOut", checkOutDate ?? (object)DBNull.Value); // Nếu CheckOut là null, để DBNull

                    int rowsAffected = cmd.ExecuteNonQuery();
                    return rowsAffected > 0;
                }
            }

        }
    }
}