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
    }
}
