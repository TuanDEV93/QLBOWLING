using QLBOWLING.BUS;
using QLBOWLING.DAO;
using QLBOWLING.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBOWLING
{
    public partial class BookingConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {          
                    
                    LoadBookingConfirmation();
                
            }
        }
        private void LoadBookingConfirmation()
        {
            try
            {
                // Lấy Username từ Session
                string username = Session["Username"] as string;
                if (string.IsNullOrEmpty(username))
                {
                    Response.Write("Không tìm thấy Username trong Session.");
                    return;
                }

                // Sử dụng DAO trực tiếp để lấy dữ liệu
                DAO_BookingConfirmation daoBooking = new DAO_BookingConfirmation();

                // Lấy CustomerID từ Username
                int customerID = daoBooking.GetCustomerIDByUsername(username);
                if (customerID == 0)
                {
                    Response.Write("Không tìm thấy CustomerID tương ứng với Username: " + username);
                    return;
                }

                // Lấy danh sách booking dựa trên CustomerID
                List<BookingConfirmationDTO> bookingList = daoBooking.GetBookingByCustomerID(customerID);

                foreach (var booking in bookingList)
                {
                    if (booking.Status == "0")
                        booking.Status = "Đã thanh toán";
                    else if (booking.Status == "1")
                        booking.Status = "Đã đặt cọc";
                    else if (booking.Status == "2")
                        booking.Status = "Đang chờ đặt cọc";
                    else if (booking.Status == "3")
                        booking.Status = "Đã huỷ";
                    else if (booking.Status == "4")
                        booking.Status = "Đang chơi";
                    else
                        booking.Status = "Không xác định";
                }
                // Bind dữ liệu vào GridView
                if (bookingList.Count == 0)
                {
                    Response.Write("Không có lịch sử đặt sân.");
                }
                else
                {
                    GridView1.DataSource = bookingList;
                    GridView1.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Lỗi: " + ex.Message);
            }
        }
    }
}