using QLBOWLING.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace QLBOWLING.DAO
{
    public class DAO_Booking
    {
        private DbConnection dbConnection;

        public DAO_Booking()
        {
            dbConnection = new DbConnection();
        }
        //Hàm lấy các timeslot đã được đặt trong ngày
        public List<string> GetBookedTimeSlots(int laneID, DateTime date)
        {
            List<string> bookedSlots = new List<string>();
            using (SqlConnection connection = dbConnection.cnn)
            {
                connection.Open();

                string query = "SELECT TimeSlot FROM Booking WHERE LaneID = @LaneID AND BookingDate = @BookingDate";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@LaneID", laneID);
                    command.Parameters.AddWithValue("@BookingDate", date);

                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        bookedSlots.Add(reader.GetString(0));
                    }
                }
            }
            return bookedSlots;
        }

        public bool AddNewBooking(DTO_Booking booking)
        {
            using (SqlConnection connection = dbConnection.cnn)
            {
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();

                try
                {
                    // Insert query
                    string query = "INSERT INTO dbo.Booking (UserBooking, Email, Phone, BookingDate, TimeSlot, PlayerCount, LaneID, CustomerID) " +
                                   "VALUES (@UserBooking, @Email, @Phone, @BookingDate, @TimeSlot, @PlayerCount, @LaneID, @CustomerID)";

                    using (SqlCommand command = new SqlCommand(query, connection, transaction))
                    {
                        command.Parameters.Add(new SqlParameter("@UserBooking", booking.UserBooking));
                        command.Parameters.Add(new SqlParameter("@Email", booking.Email));
                        command.Parameters.Add(new SqlParameter("@Phone", booking.Phone));
                        command.Parameters.Add(new SqlParameter("@BookingDate", booking.BookingDate));
                        command.Parameters.Add(new SqlParameter("@TimeSlot", booking.TimeSlot));
                        command.Parameters.Add(new SqlParameter("@PlayerCount", booking.PlayerCount));
                        command.Parameters.Add(new SqlParameter("@LaneID", booking.LaneID));
                        command.Parameters.Add(new SqlParameter("@CustomerID", 1  /*booking.CustomerID*/));
                        command.ExecuteNonQuery();
                    }

                    // Update lane status query
                    string updateQuery = "UPDATE dbo.Lane SET Status = @Status WHERE LaneID = @LaneID";

                    using (SqlCommand updateCommand = new SqlCommand(updateQuery, connection, transaction))
                    {
                        updateCommand.Parameters.Add(new SqlParameter("@Status", false));
                        updateCommand.Parameters.Add(new SqlParameter("@LaneID", booking.LaneID));
                        updateCommand.ExecuteNonQuery();
                    }

                    // Commit transaction
                    transaction.Commit();
                    return true; // Return true on success
                }
                catch (Exception ex)
                {
                    // Rollback transaction on error
                    transaction.Rollback();
                    Console.WriteLine($"Error: {ex.Message}");
                    return false;
                }
            }
        }

        public DataTable LoadTopSan()
        {
            using (SqlConnection connection = dbConnection.cnn)
            {
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();

                try
                {
                    // Câu truy vấn lấy sân có lượt đặt nhiều nhất
                    string query = @"
                    SELECT TOP 1 WITH TIES LaneID, COUNT(*) AS TotalBookings
                    FROM Booking
                    GROUP BY LaneID
                    ORDER BY COUNT(*) DESC;";

                    // Tạo SqlCommand
                    using (SqlCommand command = new SqlCommand(query, connection, transaction))
                    {
                        // Thực hiện truy vấn và lưu kết quả vào DataReader
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            // Tạo DataTable để chứa kết quả
                            DataTable dt = new DataTable();
                            dt.Load(reader); // Load dữ liệu từ DataReader vào DataTable

                            // Commit transaction sau khi thành công
                            transaction.Commit();

                            return dt; // Trả về DataTable chứa thông tin sân được đặt nhiều nhất
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Rollback transaction nếu có lỗi
                    transaction.Rollback();
                    Console.WriteLine($"Error: {ex.Message}");
                    return null; // Trả về null nếu có lỗi
                }
            }
        }

        public DataTable LoadTopKhachHang()
        {
            using (SqlConnection connection = dbConnection.cnn)
            {
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();

                try
                {
                    // Câu truy vấn lấy sân có lượt đặt nhiều nhất
                    string query = @"
                    SELECT TOP 1
                    UserBooking, Email, Phone, CustomerID, 
                    COUNT(UserBooking) AS TotalBookings
                    FROM Booking
                    GROUP BY UserBooking, Email, Phone, CustomerID
                    ORDER BY TotalBookings DESC;";

                    // Tạo SqlCommand
                    using (SqlCommand command = new SqlCommand(query, connection, transaction))
                    {
                        // Thực hiện truy vấn và lưu kết quả vào DataReader
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            // Tạo DataTable để chứa kết quả
                            DataTable dt = new DataTable();
                            dt.Load(reader); // Load dữ liệu từ DataReader vào DataTable

                            // Commit transaction sau khi thành công
                            transaction.Commit();

                            return dt; // Trả về DataTable chứa thông tin sân được đặt nhiều nhất
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Rollback transaction nếu có lỗi
                    transaction.Rollback();
                    Console.WriteLine($"Error: {ex.Message}");
                    return null; // Trả về null nếu có lỗi
                }
            }
        }




    }
}

