using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web.UI;
using QLBOWLING.BUS;
using QLBOWLING.DAO;
using QLBOWLING.DTO;

namespace QLBOWLING
{
    public partial class Booking : Page
    {
        private BUS_Booking busBooking = new BUS_Booking(); // Tạo đối tượng BUS_Booking
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string laneID = Request.QueryString["laneID"];
                if (!string.IsNullOrEmpty(laneID))
                {
                    //txtLaneID.Text = laneID;
                    litTitle.Text = $"<h3>Thêm phiếu đặt sân {laneID}</h3>";
                }
                txtSelectedTimes.Text = hfSelectedTimes.Value;
                
            }

        }
        

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           
            string name = txtName.Text;
            string email = txtEmail.Text;
            string phone = txtPhone.Text;
            
            DateTime bookingDate;
            lblMessage0.Visible = false;
            lblMessage1.Visible = false;
            lblMessage2.Visible = false;
            lblMessage3.Visible = false;
            if (string.IsNullOrWhiteSpace(txtName.Text))
            {
                lblMessage4.Text = "Vui lòng nhập tên.";
                lblMessage4.ForeColor = System.Drawing.Color.Red;
                lblMessage4.Visible = true;
                return;
            }

            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                lblMessage3.Text = "Vui lòng nhập email.";
                lblMessage3.ForeColor = System.Drawing.Color.Red;
                lblMessage3.Visible = true;
                return;
            }

            if (string.IsNullOrWhiteSpace(txtPhone.Text))
            {
                lblMessage0.Text = "Vui lòng nhập số điện thoại.";
                lblMessage0.ForeColor = System.Drawing.Color.Red;
                lblMessage0.Visible = true;
                return;
            }
            string selectedTimes = hfSelectedTimes.Value; // Giá trị khung giờ đã chọn
            if (string.IsNullOrWhiteSpace(selectedTimes))
            {
                lblMessage2.Text = "Vui lòng chọn ít nhất một khung giờ.";
                lblMessage2.ForeColor = System.Drawing.Color.Red;
                lblMessage2.Visible = true;
                return;
            }
            if (ddlPlayerCount.SelectedIndex == 0)
            {
                lblMessage5.Text = "Vui lòng chọn số người chơi.";
                lblMessage5.ForeColor = System.Drawing.Color.Red;
                lblMessage5.Visible = true;
                return;
            }

            //^: Đánh dấu bắt đầu của chuỗi.
            //0: Ký tự 0 phải xuất hiện ở đầu chuỗi.
            //\d: Đại diện cho một chữ số từ 0 đến 9.
            //{ 9,10}: Xác định số lượng chữ số tiếp theo là từ 9 đến 10.Như vậy, tổng cộng sẽ có từ 10 đến 11 chữ số bao gồm chữ số 0 ở đầu.
            //$: Đánh dấu kết thúc của chuỗi.
            if (!Regex.IsMatch(phone, @"^0\d{9,10}$"))
            {
                lblMessage0.Text = "Số điện thoại không hợp lệ. Vui lòng nhập số điện thoại có 10-11 chữ số và bắt đầu bằng số 0.";
                lblMessage0.ForeColor = System.Drawing.Color.Red;
                lblMessage0.Visible = true;
                return;
            }

            if (!Regex.IsMatch(email, @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"))
            {
                lblMessage3.Text = "Email không hợp lệ. Vui lòng nhập email đúng định dạng.";
                lblMessage3.ForeColor = System.Drawing.Color.Red;
                lblMessage3.Visible = true; // Show the label with the message
                return;
            }

            if (!DateTime.TryParse(txtDate.Text, out bookingDate))
            {
                // Nếu ngày nhập không hợp lệ
                lblMessage1.Text = "vui lòng nhập ngày hợp lệ.";
                lblMessage1.ForeColor = System.Drawing.Color.Red;
                lblMessage1.Visible = true;
                return;
            }
            // Tách các khung giờ (giả sử chúng được phân cách bằng dấu phẩy)
            string[] timeSlots = selectedTimes.Split(',');

            foreach (string timeSlot in timeSlots)
            {
                // Tách giờ bắt đầu từ chuỗi, giả sử định dạng "10:00 AM - 11:00 AM"
                string startTime = timeSlot.Split('-')[0].Trim();

                // Chuyển đổi giờ bắt đầu thành DateTime
                if (!DateTime.TryParse(startTime, out DateTime parsedStartTime))
                {
                    lblMessage2.Text = $"Khung giờ không hợp lệ: {timeSlot}. Vui lòng kiểm tra lại.";
                    lblMessage2.ForeColor = System.Drawing.Color.Red;
                    lblMessage2.Visible = true;
                    return;
                }
  

                // Tạo DateTime đầy đủ từ ngày và giờ bắt đầu
                DateTime selectedDateTime = bookingDate.Date.Add(parsedStartTime.TimeOfDay);

                // So sánh với thời gian hiện tại
                if (selectedDateTime < DateTime.Now)
                {
                    lblMessage2.Text = $"Khung giờ bạn chọn đã trôi qua: {timeSlot}. Vui lòng chọn lại.";
                    lblMessage2.ForeColor = System.Drawing.Color.Red;
                    lblMessage2.Visible = true;
                    return;
                }
            }
            int countPlayer = int.Parse(ddlPlayerCount.Text);
            int laneID = int.Parse(Request.QueryString["laneID"]);
            BUS_Booking busBooking = new BUS_Booking();
            int totalPrice = busBooking.CalculateTotalPrice(laneID, selectedTimes);
            //**Tính tiền cọc**: tiền cọc là 20 % của tổng tiền
            int depositPrice = (int)(totalPrice * 0.2);
            txtPrice.Text = totalPrice.ToString();
            List<string> bookedSlots = busBooking.GetBookedTimeSlots(laneID, bookingDate);
            DTO_Booking booking = new DTO_Booking
            {
                UserBooking= name,
                Email = email,
                Phone = phone,
                BookingDate = DateTime.Parse(txtDate.Text),
                TimeSlot = selectedTimes,
                PlayerCount= int.Parse(ddlPlayerCount.SelectedValue),
                LaneID = int.Parse(Request.QueryString["laneID"]),
                TotalPrice = totalPrice

            };          

            bool isSuccess = busBooking.AddNewBooking(booking);

            if (isSuccess)
            {
                string redirectUrl = $"QRCode.aspx?UserBooking={name}&Phone={phone}&Email={email}&BookingDate={booking.BookingDate:yyyy-MM-dd}&TimeSlot={booking.TimeSlot}&LaneID={laneID}&TotalPrice={booking.TotalPrice}&DepositPrice={depositPrice}"; 
                Response.Redirect(redirectUrl);
            }
            else
            {
                // Hiển thị thông báo lỗi
                string script = "alert('Có lỗi xảy ra. Vui lòng thử lại.');";
                ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", script, true);
            }
            // Gọi lại hàm load time slot sau khi submit để đảm bảo danh sách khung giờ luôn được cập nhật
            btnLoadTimeSlot_Click(sender, e);
        }
        protected void btnLoadTimeSlot_Click(object sender, EventArgs e)
        {
            try
            {
                // Lấy giá trị LaneID từ   QueryString 
                int laneID = int.Parse(Request.QueryString["laneID"]);

                // Kiểm tra nếu TextBox ngày trống
                if (string.IsNullOrEmpty(txtDate.Text))
                {
                    // Thông báo lỗi nếu người dùng chưa chọn ngày
                    string script = "alert('Vui lòng chọn ngày.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "EmptyDate", script, true);
                    return;
                }

                // Sử dụng DateTime.TryParse để tránh lỗi nếu định dạng không hợp lệ
                DateTime selectedDate;
                if (!DateTime.TryParse(txtDate.Text, out selectedDate))
                {
                    // Thông báo lỗi nếu định dạng ngày không hợp lệ
                    string script = "alert('Định dạng ngày không hợp lệ. Vui lòng chọn ngày đúng.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "InvalidDateFormat", script, true);
                    return;
                }

                // Gọi BUS để lấy danh sách trạng thái khung giờ
                List<DTO_Booking> slotStatuses = busBooking.GetAllTimeSlots(laneID, selectedDate);

                // Gán dữ liệu vào Repeater và cập nhật giao diện
                rptTimeSlots.DataSource = slotStatuses;
                rptTimeSlots.DataBind();
            }
            catch (Exception ex)
            {
                // Xử lý lỗi khác
                string script = "alert('Đã xảy ra lỗi khi tải khung giờ.');";
                ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", script, true);
            }
        }

    }
}