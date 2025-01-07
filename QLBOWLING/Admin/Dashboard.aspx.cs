using QLBOWLING.BUS;
using QLBOWLING.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBOWLING.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["Role"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            int role = Convert.ToInt32(Session["Role"]);

            if (role != 0 && role != 1)
            {

                Response.Redirect("~/Home.aspx");
                
            }
            GetData();

        }
        protected void GetData()
        {
            BUS_Customer busCustomer = new BUS_Customer();
            userTotal.Text = busCustomer.GetCustomer().Count.ToString();

            DateTime today = DateTime.Now;
            DateTime firstDayOfMonth = new DateTime(today.Year, today.Month, 1);
            DateTime firstDayOfPreviousMonth = new DateTime(today.Year, today.Month, 1).AddMonths(-1);
            int daysInMonth = DateTime.DaysInMonth(today.Year, today.Month);
            DateTime lastDayOfMonth = new DateTime(today.Year, today.Month, daysInMonth);
            DateTime lastDayOfPreviousMonth = firstDayOfMonth.AddDays(-1);
            BUS_Bill busBill = new BUS_Bill();
            DataTable dt = busBill.LoadDoanhThuTheoKhoangThoiGian(firstDayOfMonth, lastDayOfMonth);
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    sales.Text = dr[2].ToString();
                }
                dt = busBill.LoadDoanhThuTheoKhoangThoiGian(firstDayOfPreviousMonth, lastDayOfPreviousMonth);
                foreach (DataRow dr in dt.Rows)
                {
                    salesMonth.Text = dr[2].ToString();
                }
            }

            BUS_Booking bookingBUS = new BUS_Booking();
            List<DTO_Booking> ds = bookingBUS.LoadSchedule();
            bookingTotal.Text = ds.Count.ToString();
        }
    }
}