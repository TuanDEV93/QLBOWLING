using QLBOWLING.BUS;
using QLBOWLING.DTO;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBOWLING.Admin
{
    public partial class Bill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBillData();
            }
        }

        private void LoadBillData()
        {
            BUS_Bill billBus = new BUS_Bill();
            gvBill.DataSource = billBus.GetBills(); // Lấy tất cả hóa đơn từ database
            gvBill.DataBind();
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlStatus = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlStatus.NamingContainer;

            int bookingID = Convert.ToInt32(gvBill.DataKeys[row.RowIndex].Value); // Lấy BookingID từ DataKey
            string selectedStatus = ddlStatus.SelectedValue; // Lấy trạng thái được chọn từ DropDownList

            BUS_Bill billBus = new BUS_Bill();
            bool result = billBus.UpdateBillStatus(bookingID, selectedStatus); // Cập nhật trạng thái

            if (result)
            {
                LoadBillData(); // Tải lại dữ liệu sau khi cập nhật
            }
            else
            {
                // Thông báo lỗi nếu cập nhật thất bại
                ScriptManager.RegisterStartupScript(this, GetType(), "UpdateError", "alert('Cập nhật trạng thái thất bại!');", true);
            }
        }
        protected void gvBill_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddlStatus = e.Row.FindControl("ddlStatus") as DropDownList;
                if (ddlStatus != null)
                {
                    string status = DataBinder.Eval(e.Row.DataItem, "Status").ToString();
                    ddlStatus.SelectedValue = status;
                }
            }
        }
        protected void btnToday_Click(object sender, EventArgs e)
        {
            BUS_Bill billBus = new BUS_Bill();
            DateTime today = DateTime.Today;
            gvBill.DataSource = billBus.GetBillsByDate(today);
            gvBill.DataBind();
        }
        protected void btnFilter_Click(object sender, EventArgs e)
        {
            int selectedMonth = int.Parse(ddlMonth.SelectedValue);
            int selectedYear = int.Parse(ddlYear.SelectedValue);

            BUS_Bill billBus = new BUS_Bill();

            gvBill.DataSource = billBus.GetBillsByMonthYear(selectedMonth, selectedYear);
            gvBill.DataBind();


            ToggleTodayButtonVisibility(false);

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            BUS_Bill billBus = new BUS_Bill();
            gvBill.DataSource = billBus.GetBills(); // Lấy lại toàn bộ danh sách hóa đơn
            gvBill.DataBind();

            ToggleTodayButtonVisibility(true);
        }
        private void ToggleTodayButtonVisibility(bool isVisible)
        {
            btnToday.Visible = isVisible;
        }
    }
}
