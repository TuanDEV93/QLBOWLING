using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Policy;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Microsoft.Ajax.Utilities;
using QLBOWLING.BUS;
using QLBOWLING.DTO;

namespace QLBOWLING.Admin
{
    public partial class Booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowSchedule();
                BindDDLane();
            }
        }

        protected void ShowSchedule()
        {
            BUS_Booking bookingBUS = new BUS_Booking();
            List<DTO_Booking> ds = bookingBUS.LoadSchedule();
            List<Schedule> schedules = ds.Select(item => new Schedule
            {
                ScheduleID = item.BookingID,
                title = "Sân " + item.LaneID,
                name = item.UserBooking,
                email = item.Email,
                phone = item.Phone,
                date = item.BookingDate.ToString("yyyy-MM-dd"),
                count = item.PlayerCount,
                lane = item.LaneID,
            }).ToList();
            for(int k = 0, i = 0; i< schedules.Count(); i++)
            {
                string[] timeSlots = ds[i].TimeSlot.Split(',');
                for(int j = 0; j < timeSlots.Length; j++)
                    timeSlots[j] = timeSlots[j].TrimStart();
                schedules[i].timeSlots = timeSlots;
                string startTime = timeSlots[0].Split('-')[0].Trim();
                DateTime.TryParse(startTime, out DateTime parsedStartTime);
                schedules[i].start = ds[i].BookingDate.AddDays(1).AddHours(parsedStartTime.Hour - 17).AddMinutes(parsedStartTime.Minute);
                foreach (string timeSlot in timeSlots)
                {
                    string endTime = timeSlot.Split('-')[1].Trim();
                    DateTime.TryParse(endTime, out DateTime parsedEndTime);
                    schedules[i].end = ds[i].BookingDate.AddDays(1).AddHours(parsedEndTime.Hour - 17).AddMinutes(parsedEndTime.Minute);
                }
                switch (k)
                {
                    case 0:
                        schedules[i].className = "bg-danger";
                        k++;
                        break;
                    case 1:
                        schedules[i].className = "bg-success";
                        k++;
                        break;
                    case 2:
                        schedules[i].className = "bg-purple";
                        k++;
                        break;
                    case 3:
                        schedules[i].className = "bg-pink";
                        k++;
                        break;
                    case 4:
                        schedules[i].className = "bg-info";
                        k++;
                        break;
                    case 5:
                        schedules[i].className = "bg-inverse";
                        k++;
                        break;
                    case 6:
                        schedules[i].className = "bg-orange";
                        k=0;
                        break;
                }
            }
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            string jsonData = serializer.Serialize(schedules);
            hiddenData.Value = jsonData;
        }

        private class Schedule
        {
            public int ScheduleID { get; set; }
            public string title { get; set; }
            public string name { get; set; }
            public string email { get; set; }
            public string phone { get; set; }
            public DateTime start { get; set; }
            public string date { get; set; }
            public DateTime end { get; set; }
            public int count { get; set; }
            public int lane { get; set; }
            public string[] timeSlots { get; set; }
            public string className { get; set; }
            public string test {  get; set; }
        }

        protected void BindDDLane()
        {
            BUS_Lane laneBUS = new BUS_Lane();
            List<LaneDTO> ds = laneBUS.GetLanes();
            ddLaneID.DataSource = ds;
            ddLaneID.DataTextField = "LaneName";
            ddLaneID.DataValueField = "LaneID";
            ddLaneID.DataBind();
            ddLane.DataSource = ds;
            ddLane.DataTextField = "LaneName";
            ddLane.DataValueField = "LaneID";
            ddLane.DataBind();
        }
        protected void ClearMsg()

        {
            SuccMsg.Text = null;
            ErrMsg.Text = null;
            ErrMsgName.Text = null;
            ErrMsgEmail.Text = null;
            ErrMsgPhone.Text = null;
            ErrMsgLane.Text = null;
            ErrMsgCount.Text = null;
            ErrMsgDate.Text = null;
            ErrMsgTime.Text = null;
        }
        protected void ClearFeild()
        {
            txtName.Text = null;
            txtEmail.Text = null;
            txtPhone.Text = null;
            ddlCountPlayer.SelectedIndex = 0;
            cblTimeSlot.Text = null;
        }
        protected void OpenModal(object sender, EventArgs e)

        {
            SuccMsg.Text = null;
            ErrMsg.Text = null;
            ErrMsgName.Text = null;
            ErrMsgEmail.Text = null;
            ErrMsgPhone.Text = null;
            ErrMsgLane.Text = null;
            ErrMsgCount.Text = null;
            ErrMsgDate.Text = null;
            ErrMsgTime.Text = null;
        }
        protected void AddSchedule(object sender, EventArgs e)
        {
            ClearMsg();
            if (string.IsNullOrWhiteSpace(txtName.Text))
            {
                ErrMsgName.Text = "Vui lòng nhập tên";
                return;
            }
            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                ErrMsgEmail.Text = "Vui lòng nhập Email";
                return;
            }
            if (!Regex.IsMatch(txtEmail.Text, @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"))
            {
                ErrMsgEmail.Text = "Email không hợp lệ. Vui lòng nhập email đúng định dạng.";
                return;
            }
            if (string.IsNullOrWhiteSpace(txtPhone.Text))
            {
                ErrMsgPhone.Text = "Vui lòng nhập SDT";
                return;
            }
            if (!Regex.IsMatch(txtPhone.Text, @"^0\d{9,10}$"))
            {
                ErrMsgPhone.Text = "Số điện thoại không hợp lệ. Vui lòng nhập số điện thoại có 10-11 chữ số và bắt đầu bằng số 0.";
                return;
            }
            if (ddLaneID.SelectedIndex == -1)
            {
                ErrMsgLane.Text = "Vui lòng chọn sân";
                return;
            }
            if (ddlCountPlayer.SelectedIndex == 0)
            {
                ErrMsgCount.Text = "Vui lòng chọn số người chơi";
                return;
            }
            if (string.IsNullOrWhiteSpace(txtDate.Text))
            {
                ErrMsgDate.Text = "Vui lòng chọn ngày";
                return;
            }
            if (string.IsNullOrWhiteSpace(cblTimeSlot.Text))
            {
                ErrMsgTime.Text = "Vui lòng chọn ít nhất một khung giờ";
                return;
            }
            DTO_Booking booking = new DTO_Booking
            {
                UserBooking = txtName.Text,
                Email = txtEmail.Text,
                Phone = txtPhone.Text,
                BookingDate = DateTime.Parse(txtDate.Text),
                TimeSlot = string.Join(", ", cblTimeSlot.Items.Cast<ListItem>().Where(item => item.Selected).Select(item => item.Value).ToList()),
                PlayerCount = int.Parse(ddlCountPlayer.SelectedValue),
                LaneID = int.Parse(ddLaneID.SelectedValue),
                CustomerID = 0
            };
            BUS_Booking busBooking = new BUS_Booking();

            bool isSuccess = busBooking.AddNewBooking(booking);

            if (isSuccess)
            {
                SuccAddMsg.Text = "Đặt sân thành công!";
                ClearFeild();
            }
            else
            {
                ErrAddMsg.Text = "Có lỗi xảy ra. Vui lòng thử lại.";
            }
        }
        protected void UpdateSchedule(object sender, EventArgs e)
        {
            ClearMsg();
            if (string.IsNullOrWhiteSpace(cName.Value))
            {
                ErrMsg.Text = "Vui lòng nhập tên";
                return;
            }
            if (string.IsNullOrWhiteSpace(cEmail.Value))
            {
                ErrMsg.Text = "Vui lòng nhập Email";
                return;
            }
            if (!Regex.IsMatch(cEmail.Value, @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"))
            {
                ErrMsg.Text = "Email không hợp lệ. Vui lòng nhập email đúng định dạng.";
                return;
            }
            if (string.IsNullOrWhiteSpace(cPhone.Value))
            {
                ErrMsg.Text = "Vui lòng nhập SDT";
                return;
            }
            if (!Regex.IsMatch(cPhone.Value, @"^0\d{9,10}$"))
            {
                ErrMsg.Text = "Số điện thoại không hợp lệ. Vui lòng nhập số điện thoại có 10-11 chữ số và bắt đầu bằng số 0.";
                return;
            }
            if (ddLane.SelectedIndex == -1)
            {
                ErrMsg.Text = "Vui lòng chọn sân";
                return;
            }
            if (player.SelectedIndex == 0)
            {
                ErrMsg.Text = "Vui lòng chọn số người chơi";
                return;
            }
            if (string.IsNullOrWhiteSpace(date.Text))
            {
                ErrMsg.Text = "Vui lòng chọn ngày";
                return;
            }
            if (string.IsNullOrWhiteSpace(timeSlot.Text))
            {
                ErrMsg.Text = "Vui lòng chọn ít nhất một khung giờ";
                return;
            }
            DTO_Booking booking = new DTO_Booking
            {
                BookingID = int.Parse(sID.Value),
                UserBooking = cName.Value,
                Email = cEmail.Value,
                Phone = cPhone.Value,
                BookingDate = DateTime.Parse(date.Text),
                TimeSlot = string.Join(", ", timeSlot.Items.Cast<ListItem>().Where(item => item.Selected).Select(item => item.Value)),
                PlayerCount = int.Parse(player.SelectedValue),
                LaneID = int.Parse(ddLane.SelectedValue)
            };
            BUS_Booking busBooking = new BUS_Booking();

            bool result = busBooking.UpdateSchedule(booking);
            if (result)
            {
                SuccMsg.Text = "Cập nhật thành công";
                return;
            }
            else
            {
                ErrMsg.Text = "Có lỗi xảy ra. Vui lòng thử lại.";
                return;
            }
        }

    }
}