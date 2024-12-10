using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLBOWLING.BUS;

namespace QLBOWLING
{
    public partial class Lane : System.Web.UI.Page
    {
        private readonly BUS_Lane busLane = new BUS_Lane();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadLane();
            }
        }

        private void LoadLane()
        {
            // Lấy dữ liệu từ BUS_Lane
            int LaneID = 0; // Hoặc giá trị lấy từ giao diện
            string LaneName = ""; // Giá trị tìm kiếm theo tên
            int Status = -1; // -1 để bỏ qua, 0 hoặc 1 cho trạng thái cụ thể

            DataTable dt = busLane.LoadLane();

            // Thêm cột CssClass
            dt.Columns.Add("CssClass", typeof(string));
            foreach (DataRow row in dt.Rows)
            {
                bool statusLane = Convert.ToBoolean(row["Status"]);
                row["CssClass"] = statusLane ? "btn btn-success" : "btn btn-danger";
            }

            // Gán dữ liệu cho Repeater hoặc các control khác
            rptLanes.DataSource = dt;
            rptLanes.DataBind();
        }
    

    protected void btnLane_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string laneID = btn.CommandArgument;
            bool StatusLane = btn.CssClass.Contains("");

            if (StatusLane)
            {
                Response.Redirect("Booking.aspx?laneID=" + laneID);
            }
        }
    }
}