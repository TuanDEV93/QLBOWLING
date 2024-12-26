using QLBOWLING.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
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
                //Session.Abandon();
                //Response.Redirect("~/Login.aspx");
            }

        }

    }
}