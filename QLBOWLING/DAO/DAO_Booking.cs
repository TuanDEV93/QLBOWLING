using QLBOWLING.DTO;
using System;
using System.Collections.Generic;
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
    }
}

