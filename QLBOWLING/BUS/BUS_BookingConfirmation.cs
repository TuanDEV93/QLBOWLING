using QLBOWLING.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QLBOWLING.DTO;
using QLBOWLING.Admin;

namespace QLBOWLING.BUS
{
    public class BUS_BookingConfirmation
    {
        private DAO_BookingConfirmation daoBookingConfirmation;

        public BUS_BookingConfirmation()
        {
            // Khởi tạo đối tượng DAO
            daoBookingConfirmation = new DAO_BookingConfirmation();
        }

        public List<BookingConfirmationDTO> GetBookingConfirmation(int customerID)
        {
            return daoBookingConfirmation.GetBookingByCustomerID(customerID); // Gọi phương thức qua đối tượng
        }
    }
}