using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLBOWLING.DTO
{
    public class DTO_Booking
    {

        private int bookingId;

        public int BookingID
        {
            get { return bookingId; }
            set { bookingId = value; }
        }

        private string userBooking;

        public string UserBooking
        {
            get { return userBooking; }
            set { userBooking = value; }
        }
        private string email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private string phone;

        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }


        private DateTime bookingDate;

        public DateTime BookingDate
        {
            get { return bookingDate; }
            set { bookingDate = value; }

        }

        private string timeSlot;
        public string TimeSlot
        {
            get { return timeSlot; }
            set { timeSlot = value; }
        }
        // Trạng thái: đã đặt hay chưa
        private bool isBooked;
        public bool IsBooked
        {
            get { return isBooked; }
            set { isBooked = value; }
        }
        private int playerCount;

        public int PlayerCount
        {
            get { return playerCount; }
            set { playerCount = value; }
        }
        private int laneId;

        public int LaneID
        {
            get { return laneId; }
            set { laneId = value; }
        }
        private int customerId;

        public int CustomerID
        {
            get { return customerId; }
            set { customerId = value; }
        }

    }
}