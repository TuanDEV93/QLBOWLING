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
            return bookingDAO.GetBookedTimeSlots(laneID, date); // Gọi phương thức qua đối tượng
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
            List<string> bookedSlots = bookingDAO.GetBookedTimeSlots(laneID, date);

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
        public bool AddNewBooking(DTO_Booking booking)
        {
           return bookingDAO.AddNewBooking(booking); // Gọi phương thức DAO thông qua đối tượng
        }

        public List<DTO_Booking> LoadSchedule()
        {

            return bookingDAO.LoadSchedule();
        }
    }

}
