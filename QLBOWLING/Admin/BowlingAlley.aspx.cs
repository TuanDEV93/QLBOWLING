using QLBOWLING.BUS;
using QLBOWLING.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBOWLING.Admin
{
    public partial class BowlingAlley : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {    
            BUS_Lane laneBus = new BUS_Lane();
            List<LaneDTO> lanes = laneBus.GetLanes();

            // Gán dữ liệu vào Repeater để hiển thị trên giao diện
            rptLane.DataSource = lanes;
            rptLane.DataBind();
            }
        }
        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            BUS_Lane laneBus = new BUS_Lane();
            // Lấy ID sân từ CommandArgument
            Button btn = (Button)sender;
            int laneID = Convert.ToInt32(btn.CommandArgument);

            // Lấy trạng thái hiện tại 
            bool currentStatus = laneBus.GetLanes().First(l => l.LaneID == laneID).Status;

            // Đảo ngược trạng thái
            bool newStatus = !currentStatus;

            // Gọi phương thức cập nhật
            bool isUpdated = laneBus.UpdateLaneStatus(laneID, newStatus);

            if (isUpdated)
            {
                // Hiển thị thông báo thành công và tải lại dữ liệu
                string script = "alert('Cập nhật trạng thái thành công!'); location.reload();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showAlert", script, true);
                Response.Redirect(Request.RawUrl);  // Chuyển hướng lại trang hiện tại
            }
            else
            {
                string script = "alert('Cập nhật trạng thái thất bại!'); location.reload();";
                ScriptManager.RegisterStartupScript(this, GetType(), "showAlert", script, true);
            }
        }


    }
}