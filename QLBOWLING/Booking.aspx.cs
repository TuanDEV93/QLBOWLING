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
              
            }

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           
            string name = txtName.Text;
            string email = txtEmail.Text;
            string phone = txtPhone.Text;
            DateTime date;
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


            if (string.IsNullOrWhiteSpace(txtDate.Text))
            {
                lblMessage1.Text = "Vui lòng nhập ngày.";
                lblMessage1.ForeColor = System.Drawing.Color.Red;
                lblMessage1.Visible = true;
                return;
            }
            if (ddlTimeSlot.SelectedIndex == 0)
            {
                lblMessage2.Text = "Vui lòng chọn time slot.";
                lblMessage2.ForeColor = System.Drawing.Color.Red;
                lblMessage2.Visible = true;
                return;
            }

            if (ddlCountPlayer.SelectedIndex == 0)
            {
                lblMessage5.Text = "Vui lòng chọn số người chơi.";
                lblMessage5.ForeColor = System.Drawing.Color.Red;
                lblMessage5.Visible = true;
                return;
            }


            if (!DateTime.TryParse(txtDate.Text, out date))
            {
                // Nếu ngày nhập không hợp lệ
                lblMessage1.Text = "vui lòng nhập ngày hợp lệ.";
                lblMessage1.ForeColor = System.Drawing.Color.Red;
                lblMessage1.Visible = true;
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

            if (!DateTime.TryParse(txtDate.Text, out date))
            {
                // Nếu ngày nhập không hợp lệ
                lblMessage1.Text = "vui lòng nhập ngày hợp lệ.";
                lblMessage1.ForeColor = System.Drawing.Color.Red;
                lblMessage1.Visible = true;
                return;
            }
            int timeSlotValue;
           
            if (!int.TryParse(ddlTimeSlot.SelectedValue, out timeSlotValue))
            {
                // Nếu không thể parse được, xử lý lỗi ở đây
                lblMessage2.Text = "Vui lòng chọn time slot hợp lệ.";
                lblMessage2.ForeColor = System.Drawing.Color.Red;
                lblMessage2.Visible = true;
                return;
            }

            string timeSlotDisplay = ddlTimeSlot.SelectedItem.Text.ToString();

            // Lấy ngày và giờ hiện tại
            DateTime currentDateTime = DateTime.Today.AddHours(timeSlotValue);

            // Lấy giờ từ timeSlotValue (giờ bắt đầu timeslot)
            TimeSpan selectedTime = new TimeSpan(timeSlotValue, 0, 0); // timeSlotValue là giờ (0-23)
            // Kết hợp ngày và giờ từ người dùng
            DateTime selectedDateTime = new DateTime(date.Year, date.Month, date.Day).Add(selectedTime);

            if (selectedDateTime < currentDateTime)
            {
                // Nếu ngày và giờ nhập vào nhỏ hơn ngày và giờ hiện tại
                lblMessage2.Text = "Vui lòng nhập lại Timeslot. Timeslot bạn chọn đã trôi qua";
                lblMessage2.ForeColor = System.Drawing.Color.Red;
                lblMessage2.Visible = true;
                return;
            }


            int countPlayer = int.Parse(ddlCountPlayer.Text);

            int laneID = int.Parse(Request.QueryString["laneID"]);


            DTO_Booking booking = new DTO_Booking
            {
                UserBooking= name,
                Email = email,
                Phone = phone,

                BookingDate = DateTime.Parse(txtDate.Text),
                TimeSlot = ddlTimeSlot.SelectedValue,
                PlayerCount= int.Parse(ddlCountPlayer.SelectedValue),
                LaneID = int.Parse(Request.QueryString["laneID"])
                

            };

            // Gọi BUS_Booking để thêm mới
            BUS_Booking busBooking = new BUS_Booking();

            bool isSuccess = busBooking.AddNewBooking(booking);

            if (isSuccess)
            {

                string script = "alert('Đặt sân thành công!');";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessAlert", script, true);
            }
            else
            {
                string script = "alert('Có lỗi xảy ra. Vui lòng thử lại.');";
                ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", script, true);

            }
        }
        protected void btnLoadTimeSlot_Click(object sender, EventArgs e)
        {
            try
            {
                // Lấy giá trị LaneID từ   QueryString nếu cần
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

                // Gán dữ liệu vào Repeater
                rptTimeSlots.DataSource = slotStatuses;
                rptTimeSlots.DataBind();
            }
            catch (Exception ex)
            {
                // Xử lý lỗi khác

                string script = "alert('Đã xảy ra lỗi khi tải khung giờ. Chi tiết: " + ex.Message.Replace("'", "\\'") + "');";

                ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", script, true);
            }
        }
    }
}