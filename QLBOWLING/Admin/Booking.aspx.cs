using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
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

        private void ShowSchedule()
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
                start = item.BookingDate,
                date = item.BookingDate.ToString("yyyy-MM-dd"),
                count = item.PlayerCount,
                className = null,
            }).ToList();
            for(int k = 0, i = 0; i< schedules.Count(); i++)
            {
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

        public class Schedule
        {
            public int ScheduleID { get; set; }
            public string title { get; set; }
            public string name { get; set; }
            public string email { get; set; }
            public string phone { get; set; }
            public DateTime start { get; set; }
            public string date { get; set; }
            public int count { get; set; }
            public string className { get; set; }
        }

        public void BindDDLane()
        {
            BUS_Lane laneBUS = new BUS_Lane();
            List<LaneDTO> ds = laneBUS.LoadLaneList();
            ddLaneID.DataSource = ds;
            ddLaneID.DataTextField = "LaneName";
            ddLaneID.DataValueField = "LaneID";
            ddLaneID.DataBind();
        }
        private void addSchedule()
        {

        }
    }
}