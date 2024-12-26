using QLBOWLING.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.Remoting.Messaging;
using System.Web;

namespace QLBOWLING.DAO
{
    public class DAO_Booking
    {
        private DbConnection dbConnection;

        public DAO_Booking()
        {
            dbConnection = new DbConnection();
            dbConnection.Open();
        }
        //Hàm lấy các timeslot đã được đặt trong ngày
        public List<string> GetBookedTimeSlots(int laneID, DateTime bookingDate)
        {
            List<string> bookedSlots = new List<string>();


                string query = "SELECT TimeSlot FROM Booking WHERE LaneID = @LaneID AND BookingDate = @BookingDate";
                using (SqlCommand command = new SqlCommand(query, dbConnection.cnn))
                {
                    command.Parameters.AddWithValue("@LaneID", laneID);
                    command.Parameters.AddWithValue("@BookingDate", bookingDate);

                using (SqlDataReader reader = command.ExecuteReader())
                {
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
               
                SqlTransaction transaction = dbConnection.cnn.BeginTransaction();

                try
                {
                    // Lấy CustomerID từ CustomerName
                    string customerName = HttpContext.Current.Session["Username"]?.ToString();
                    if (string.IsNullOrEmpty(customerName))
                    {
                        throw new Exception("Không tìm thấy thông tin khách hàng trong Session.");
                    }

                    string getCustomerIdQuery = "SELECT CustomerID FROM dbo.Customer WHERE CustomerName = @CustomerName";
                    int customerId;

                    try
                    {
                        using (SqlCommand getCommand = new SqlCommand(getCustomerIdQuery, connection, transaction))
                        {
                            // Thêm tham số truy vấn
                            getCommand.Parameters.AddWithValue("@CustomerName", customerName);

                            // Thực thi lệnh và lấy kết quả
                            object result = getCommand.ExecuteScalar();

                            if (result == null || !int.TryParse(result.ToString(), out customerId))
                            {
                                throw new Exception($"Không tìm thấy CustomerID hoặc dữ liệu không hợp lệ cho CustomerName: {customerName}");
                            }
                        }
                    }
                    catch (SqlException sqlEx)
                    {
                        // Ghi log lỗi truy vấn SQL
                        throw new Exception("Lỗi truy vấn cơ sở dữ liệu: " + sqlEx.Message, sqlEx);
                    }

                    // Thực hiện INSERT
                    string query = "INSERT INTO dbo.Booking (UserBooking, Email, Phone, BookingDate, TimeSlot, PlayerCount, LaneID, CustomerID, TotalPrice) " +
                                   "VALUES (@UserBooking, @Email, @Phone, @BookingDate, @TimeSlot, @PlayerCount, @LaneID, @CustomerID, @TotalPrice)";
                    using (SqlCommand command = new SqlCommand(query, connection, transaction))
                    {
                        command.Parameters.Add(new SqlParameter("@UserBooking", booking.UserBooking));
                        command.Parameters.Add(new SqlParameter("@Email", booking.Email));
                        command.Parameters.Add(new SqlParameter("@Phone", booking.Phone));
                        command.Parameters.Add(new SqlParameter("@BookingDate", booking.BookingDate));
                        command.Parameters.Add(new SqlParameter("@TimeSlot", booking.TimeSlot));
                        command.Parameters.Add(new SqlParameter("@PlayerCount", booking.PlayerCount));
                        command.Parameters.Add(new SqlParameter("@LaneID", booking.LaneID));
                        command.Parameters.Add(new SqlParameter("@CustomerID", customerId));
                        command.Parameters.Add(new SqlParameter("@TotalPrice", booking.TotalPrice));
                        command.ExecuteNonQuery();
                    }

                    // Cập nhật trạng thái lane
                    string updateQuery = "UPDATE dbo.Lane SET Status = @Status WHERE LaneID = @LaneID";
                    using (SqlCommand updateCommand = new SqlCommand(updateQuery, connection, transaction))
                    {
                        updateCommand.Parameters.Add(new SqlParameter("@Status", false));
                        updateCommand.Parameters.Add(new SqlParameter("@LaneID", booking.LaneID));
                        updateCommand.ExecuteNonQuery();
                    }

                    transaction.Commit();
                    return true;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    Console.WriteLine($"Error: {ex.Message}");
                    return false;
                }
            }
        }

        public List<DTO_Booking> LoadSchedule()
        {
            SqlConnection connection = dbConnection.cnn;
            List<DTO_Booking> ds = new List<DTO_Booking>();
            string query = "SELECT * from Booking left join Lane on Lane.LaneID = Booking.LaneID";
            SqlCommand sqlCmd = new SqlCommand(query, connection);
            SqlDataReader reader = sqlCmd.ExecuteReader();
            while (reader.Read())
            {
                int scheduleID = reader.GetInt32(0);
                string nameUser = reader.GetString(1);
                string emailUser = reader.GetString(2);
                string phoneUser = reader.GetInt32(3).ToString();
                DateTime bookingDate = reader.GetDateTime(4);
                string timeSlot = reader.GetString(5);
                int playerCount = reader.GetInt32(6);
                int laneID = reader.GetInt32(7);
                //string laneName = reader.GetString(10);

                DTO_Booking schedule = new DTO_Booking();
                schedule.BookingID = scheduleID;
                schedule.UserBooking = nameUser;
                schedule.Email = emailUser;
                schedule.Phone = phoneUser;
                schedule.BookingDate = bookingDate;
                schedule.TimeSlot = timeSlot;
                schedule.PlayerCount = playerCount;
                schedule.LaneID = laneID;

                ds.Add(schedule);
            }
            connection.Close();
            return ds;
        }
       
        //Bao cao 
        public DataTable LoadTopSan()
        {
            using (SqlConnection connection = dbConnection.cnn)
            {
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
        public bool UpdateSchedule(DTO_Booking booking)
        {
            SqlConnection connection = dbConnection.cnn;
            string query = "Update Booking set UserBooking = @Name, Email = @Email, phone = @Phone, BookingDate = @Date, TimeSlot = @Time, PlayerCount = @Count, LaneID = @Lane where BookingID = @ID";
            SqlCommand sqlCommand = new SqlCommand(query, connection);
            sqlCommand.Parameters.AddWithValue("@Name", booking.UserBooking);
            sqlCommand.Parameters.AddWithValue("@Email", booking.Email);
            sqlCommand.Parameters.AddWithValue("@Phone", booking.Phone);
            sqlCommand.Parameters.AddWithValue("@Date", booking.BookingDate);
            sqlCommand.Parameters.AddWithValue("@Time", booking.TimeSlot);
            sqlCommand.Parameters.AddWithValue("@Count", booking.PlayerCount);
            sqlCommand.Parameters.AddWithValue("@Lane", booking.LaneID);
            sqlCommand.Parameters.AddWithValue("@ID", booking.BookingID);
            int result = sqlCommand.ExecuteNonQuery();
            if (result > 0)
            {
                connection.Close();
                return true;
            }
            else
            {
                connection.Close();
                return false;
            }
        }
    }
}

