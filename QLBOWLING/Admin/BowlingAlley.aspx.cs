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
            BUS_Lane laneBus = new BUS_Lane();
            List<LaneDTO> lanes = laneBus.GetLanes();

            // Gán dữ liệu vào Repeater để hiển thị trên giao diện
            rptLane.DataSource = lanes;
            rptLane.DataBind();
        }

    }
}