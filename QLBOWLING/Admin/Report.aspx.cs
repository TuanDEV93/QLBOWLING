using QLBOWLING.BUS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBOWLING.Admin
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void LoadTopKhachHang()
        {
            BUS_Booking busBooking = new BUS_Booking();
            DataTable dt = new DataTable();
            dt = busBooking.LoadTopKhachHang();

            gvTop.DataSource = dt.DefaultView;
            gvTop.DataBind();
        }

        protected void btnDuyet_Click(object sender, EventArgs e)
        {
            LoadTopKhachHang();
        }


        public void LoadTopSan()
        {
            BUS_Booking busBooking = new BUS_Booking();
            DataTable dt = new DataTable();
            dt = busBooking.LoadTopSan();

            gvKH.DataSource = dt.DefaultView;
            gvKH.DataBind();
        }
        protected void btnDuyetSan_Click(object sender, EventArgs e)
        {
            LoadTopSan();
        }

        public void LoadDoanhThuTheoThang()
        {
            int selectedMonth = int.Parse(ddlThang.SelectedValue);
            int selectedYear = int.Parse(ddlNam.SelectedValue);

            BUS_Bill busBill = new BUS_Bill();
            DataTable dt = busBill.LoadDoanhThuTheoThang(selectedMonth, selectedYear);

            if (dt != null)
            {
                GridViewRevenue.DataSource = dt;
                GridViewRevenue.DataBind();
            }
            else
            {
                // Hiển thị thông báo không có dữ liệu
                GridViewRevenue.DataSource = null;
                GridViewRevenue.DataBind();
                lblMessage.Text = "Không có dữ liệu doanh thu.";
            }
        }

        protected void btnDoanhThu_Click(object sender, EventArgs e)
        {
            LoadDoanhThuTheoThang();
        }

        public void LoadTopCanceller()
        {
            BUS_Bill busBill = new BUS_Bill();
            DataTable dt = new DataTable();
            dt = busBill.LoadTopCanceller();

            gvHuySan.DataSource = dt;
            gvHuySan.DataBind();
        }

        protected void btnDuyetHuy_Click(object sender, EventArgs e)
        {
            LoadTopCanceller();
        }
    }
}