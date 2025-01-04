using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLBOWLING.DTO
{
    public class BillDTO
    {
        public int BookingID { get; set; }
        public string UserBooking { get; set; }
        public DateTime? CheckIn { get; set; }  // Nullable DateTime
        public DateTime? CheckOut { get; set; }  // Nullable DateTime
        public string Status { get; set; }
        public decimal DepositPrice { get; set; }
        public decimal TotalPrice { get; set; }
        public decimal PayAble { get; set; }
        public int LaneID { get; set; }
        
    }
}