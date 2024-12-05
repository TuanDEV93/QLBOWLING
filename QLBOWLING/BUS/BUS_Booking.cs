using QLBOWLING.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QLBOWLING.DAO;
using System.Data.SqlClient;

namespace QLBOWLING.BUS
{
    public class BUS_Booking
    {
        private DAO_Booking bookingDAO;

        public BUS_Booking()
        {
            bookingDAO = new DAO_Booking();
        }

        // Lấy danh sách các khung giờ đã đặt
        public List<string> GetBookedTimeSlots(int laneID, DateTime date)
        {
            DAO_Booking daoBooking = new DAO_Booking(); // Tạo đối tượng DAO_Booking
            return daoBooking.GetBookedTimeSlots(laneID, date); // Gọi phương thức qua đối tượng
        }

        // Lấy trạng thái các khung giờ (Đã đặt hay còn trống)
        public List<DTO_Booking> GetAllTimeSlots(int laneID, DateTime date)
        {
            // Danh sách tất cả khung giờ tĩnh
            List<string> allTimeSlots = new List<string>
            {
                "10:00 AM - 11:00 AM",
                "11:30 AM - 12:30 PM",
                "1:00 PM - 2:00 PM",
                "2:30 PM - 3:30 PM",
                "4:00 PM - 5:00 PM",
                "5:30 PM - 6:30 PM",
                "7:00 PM - 8:00 PM",
                "8:30 PM - 9:30 PM"
            };

            // Lấy danh sách các khung giờ đã đặt từ DAO
            DAO_Booking daoBooking = new DAO_Booking(); // Tạo đối tượng DAO_Booking
            List<string> bookedSlots = daoBooking.GetBookedTimeSlots(laneID, date);

            // Tạo danh sách đối tượng DTO_Booking
            List<DTO_Booking> timeSlotStatus = new List<DTO_Booking>();

            foreach (var timeSlot in allTimeSlots)
            {
                timeSlotStatus.Add(new DTO_Booking
                {
                    TimeSlot = timeSlot,
                    IsBooked = bookedSlots.Contains(timeSlot) // True nếu khung giờ đã đặt
                });
            }

            return timeSlotStatus;
        }

        public string LastErrorMessage { get; private set; }

       
            DbConnection db = new DbConnection();

            public bool AddNewBooking(DTO_Booking booking)
            {
                string query = "INSERT INTO Booking (UserBooking, Email, Phone, Date, TimeSlot, CountPlayer, IdLane) " +
                               "VALUES (@UserBooking, @Email, @Phone, @Date, @TimeSlot, @CountPlayer, @idLane)";
                SqlParameter[] parameters = new SqlParameter[]
                {
            new SqlParameter("@UserBooking", booking.UserBooking),
            new SqlParameter("@Email", booking.Email),
            new SqlParameter("@Phone", booking.Phone),
            new SqlParameter("@Date", booking.Date),
            new SqlParameter("@TimeSlot", booking.TimeSlot),
            new SqlParameter("@CountPlayer", booking.CountPlayer),
            new SqlParameter("@idLane", booking.IdLane)
                };

                return db.ExecuteNonQuery(query, parameters) > 0;
            }
        }

    }
