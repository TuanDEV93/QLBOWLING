using QLBOWLING.DAO;
using QLBOWLING.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace QLBOWLING.BUS
{
    public class BUS_Bill
    {
        private DAO_Bill daoBill;
        public BUS_Bill()
        {
            daoBill = new DAO_Bill();
        }

        public DataTable LoadDoanhThuTheoThang(int month, int year)
        {
            DAO_Bill daoBill = new DAO_Bill();
            return daoBill.LoadDoanhThuTheoThang(month, year);
        }

        public DataTable LoadTopCanceller()
        {
            DAO_Bill daoBill = new DAO_Bill();
            return daoBill.LoadTopCanceller();
        }
        //Cập nhật trạng thái
        public void UpdateBillStatus(int bookingID, int status)
        {
            daoBill.UpdateBillStatus(bookingID,status);
        }
        public List<BillDTO> GetBills()
        {
            return daoBill.GetBills();
        }

        public bool SetDefaultStatus(int bookingID, DateTime bookingTime)
        {
            // Khi thêm hóa đơn mới, mặc định đặt trạng thái "Chờ thanh toán"
            return daoBill.UpdateBillStatus(bookingID, "Chờ thanh toán", bookingTime, null); // Gán CheckIn là thời gian khi đặt sân
        }

        public bool UpdateBillStatus(int bookingID, string status)
        {
            DateTime? checkOutDate = null;

            if (status == "0")  // Trạng thái "Đã thanh toán"
            {
                checkOutDate = DateTime.Now; // Gán CheckOut là thời gian hiện tại (ngày và giờ thanh toán)
            }

            return daoBill.UpdateBillStatus(bookingID, status, null, checkOutDate); // Không thay đổi CheckIn, chỉ thay đổi CheckOut
        }
    }
}