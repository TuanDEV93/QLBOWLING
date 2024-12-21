using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLBOWLING.DTO
{
    public class Bill
    {
        private int billID;
        
        public int BillID
        {
            get { return billID; }
            set { billID = value; }
        }

        private DateTime checkIn;
        public DateTime CheckIn
        {
            get { return checkIn; }
            set { checkIn = value; }
        }

        private DateTime checkOut;
        public DateTime CheckOut
        {
            get { return checkOut; }
            set { checkOut = value; }
        }

        private int staTus;
        public int Staus
        {
            get { return staTus; }
            set { staTus = value; }
        }

        private int laneID;
        public int LaneID
        {
            get { return laneID; }
            set { laneID = value; }
        }

        private int bookingID;
        public int BookingID
        {
            get { return bookingID; }
            set { bookingID = value; }
        }

        private int depositPrice;
        public int DepositPrice
        {
            get { return depositPrice; }
            set { depositPrice = value; }
        }

        private int totalPrice;
        public int TotalPrice
        {
            get { return totalPrice; }
            set { totalPrice = value; }
        }

        private int payAble;
        public int PayAble
        {
            get { return payAble; }
            set { payAble = value; }
        }
    }
}