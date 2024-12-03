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

                string query = "SELECT TimeSlot FROM Booking WHERE idLane = @LaneID AND Date = @Date";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@LaneID", laneID);
                    command.Parameters.AddWithValue("@Date", date);

                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        bookedSlots.Add(reader.GetString(0));
                    }
                }
            }
            return bookedSlots;
        }

        public void AddNewBooking(DTO_Booking booking)
        {
            using (SqlConnection connection = dbConnection.cnn)
            {
                connection.Open();
                SqlTransaction transaction = connection.BeginTransaction();

                try
                {
                    string query = "INSERT INTO dbo.Bookings (UserBooking, Email, Phone, Date, TimeSlot, CountPlayer, IdLane) " +
                                   "VALUES (@UserBooking, @Email, @Phone, @Date, @TimeSlot, @CountPlayer, @idLane)";

                    using (SqlCommand command = new SqlCommand(query, connection, transaction))
                    {
                        command.Parameters.AddWithValue("@UserBooking", booking.UserBooking);
                        command.Parameters.AddWithValue("@Email", booking.Email);
                        command.Parameters.AddWithValue("@Phone", booking.Phone);
                        command.Parameters.AddWithValue("@Date", booking.Date);
                        command.Parameters.AddWithValue("@TimeSlot", booking.TimeSlot);
                        command.Parameters.AddWithValue("@CountPlayer", booking.CountPlayer);
                        command.Parameters.AddWithValue("@LaneID", booking.IdLane);

                        command.ExecuteNonQuery();
                    }

                    string updateQuery = "UPDATE dbo.Lane SET StatusLane = @StatusLane WHERE LaneID = @LaneID";
                    using (SqlCommand updateCommand = new SqlCommand(updateQuery, connection, transaction))
                    {
                        updateCommand.Parameters.AddWithValue("@StatusLane", false);
                        updateCommand.Parameters.AddWithValue("@ID", booking.IdLane);
                        updateCommand.ExecuteNonQuery();
                    }

                    transaction.Commit();
                }
                catch (Exception)
                {
                    transaction.Rollback();
                    throw;
                }
            }
        }
    }
}
