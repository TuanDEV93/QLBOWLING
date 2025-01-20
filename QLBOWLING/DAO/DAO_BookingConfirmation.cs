using QLBOWLING.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace QLBOWLING.DAO
{
    public class DAO_BookingConfirmation
    {
        private DbConnection dbConnection;

        public DAO_BookingConfirmation()
        {
            dbConnection = new DbConnection();
        }

        // Lấy CustomerID từ Username
        public int GetCustomerIDByUsername(string username)
        {
            int customerID = 0;
            string query = "SELECT CustomerID FROM Customer WHERE CustomerName = @CustomerName";

            using (SqlConnection connection = new SqlConnection(dbConnection.cnn.ConnectionString)) 
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

        // Lấy danh sách booking dựa trên CustomerID
        public List<BookingConfirmationDTO> GetBookingByCustomerID(int customerID)
        {
            List<BookingConfirmationDTO> bookingList = new List<BookingConfirmationDTO>();

            //Câu truy vấn lấy thông tin từ bill và từ booking
            string query = @"SELECT B.*, L.LaneName, BL.DepositPrice, BL.Status 
                            FROM Booking B
                            INNER JOIN Lane L ON B.LaneID = L.LaneID 
                            LEFT JOIN Bill BL ON B.BookingID = BL.BookingID
                            WHERE B.CustomerID = @CustomerID
                            ORDER BY B.BookingID DESC";
            using (SqlConnection connection = new SqlConnection(dbConnection.cnn.ConnectionString))
            {
                connection.Open();
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.Add("@CustomerID", SqlDbType.Int).Value = customerID;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            // Đọc dữ liệu từ kết quả query
                            BookingConfirmationDTO booking = new BookingConfirmationDTO
                            {
                                UserBooking = reader["UserBooking"].ToString(),
                                BookingDate = (DateTime)reader["BookingDate"],
                                TimeSlot = reader["TimeSlot"].ToString(),
                                PlayerCount = Convert.ToInt32(reader["PlayerCount"]),
                                LaneName = reader["LaneName"].ToString(),
                                CustomerID = Convert.ToInt32(reader["CustomerID"]),
                                TotalPrice = Convert.ToInt32(reader["TotalPrice"]),

                                // Lấy thông tin tiền cọc (DepositPrice) từ bảng Bill
                                DepositPrice = reader["DepositPrice"] != DBNull.Value ? Convert.ToDecimal(reader["DepositPrice"]) : 0,
                                Status = reader["Status"].ToString()
                            };

                            bookingList.Add(booking);
                        }
                    }
                }
            }
            return bookingList;
        }
    }
}
