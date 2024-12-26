using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLBOWLING.DTO
{
    public class BookingConfirmationDTO
    {
        public string UserBooking{ get; set; }
        public DateTime BookingDate { get; set; }
        public string TimeSlot { get; set; }
        public string LaneName { get; set; }
        public int PlayerCount { get; set; }
        public int LaneID { get; set; }
        public int CustomerID { get; set; }
        public int TotalPrice { get; set; }
        public string Status { get; set; }
        public decimal  DepositPrice { get; set; }
    }
}