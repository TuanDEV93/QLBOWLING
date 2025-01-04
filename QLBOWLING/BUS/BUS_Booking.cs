using QLBOWLING.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QLBOWLING.DAO;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

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
        public List<string> GetBookedTimeSlots(int laneID, DateTime bookingDate)
        {
            return bookingDAO.GetBookedTimeSlots(laneID, bookingDate); // Gọi phương thức qua đối tượng
        }

        // Lấy trạng thái các khung giờ (Đã đặt hay còn trống)
        public List<DTO_Booking> GetAllTimeSlots(int laneID, DateTime bookingDate)
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

            // Lấy danh sách các khung giờ đã đặt
            List<string> bookedSlots = bookingDAO.GetBookedTimeSlots(laneID, bookingDate)
            .SelectMany(slot => slot.Split(',').Select(s => s.Trim())).ToList(); // Phân tách từng khung giờ trong chuỗi

            // Tạo danh sách đối tượng DTO_Booking
            List<DTO_Booking> timeSlotStatus = new List<DTO_Booking>();

            foreach (var timeSlot in allTimeSlots)
            {
                bool isBooked = bookedSlots.Any(bookedSlot =>
                    string.Equals(bookedSlot.Trim(), timeSlot.Trim(), StringComparison.OrdinalIgnoreCase));

                timeSlotStatus.Add(new DTO_Booking
                {
                    TimeSlot = timeSlot,
                    IsBooked = isBooked
                });
            }

            return timeSlotStatus;
        }
        //Hàm hiện tổng tiền tại phiếu booking
        public int CalculateTotalPrice(int laneID, string selectedTimes)
        {
            BUS_Lane busLane = new BUS_Lane();
            // Lấy giá mỗi khung giờ từ BUS_Lane
            int pricePerSlot = busLane.GetLanePrice(laneID);

            // Tách các khung giờ đã chọn
            string[] timeSlots = selectedTimes.Split(',');

            // Tính tổng số khung giờ đã chọn
            int totalSlots = timeSlots.Length;

            // Tính tổng giá tiền
            int totalPrice = totalSlots * pricePerSlot;

            return totalPrice;
        }
        public bool AddNewBooking(DTO_Booking booking)
        {
           return bookingDAO.AddNewBooking(booking); // Gọi phương thức DAO thông qua đối tượng
        }
        public DataTable LoadTopSan(int month, int year)
        {
            DAO_Booking daoBooking = new DAO_Booking();
            return daoBooking.LoadTopSan(month, year);
        }

        public DataTable LoadTopKhachHang(int month, int year)
        {
            DAO_Booking daoBooking = new DAO_Booking();
            return daoBooking.LoadTopKhachHang(month, year);
        }
        public List<DTO_Booking> LoadSchedule()
        {
            return bookingDAO.LoadSchedule();
        }
        public bool UpdateSchedule(DTO_Booking booking)
        {
            return bookingDAO.UpdateSchedule(booking);
        }
    }

}
