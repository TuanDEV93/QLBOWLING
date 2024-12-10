using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace QLBOWLING
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    lblUserName.Text = "Xin chào, " + Session["Username"].ToString();
                    lblUserName.Visible = true;
                    btnLogout.Visible = true;
                    btnLogin.Visible = false;
                }
                else
                {
                    lblUserName.Visible = false;
                    btnLogout.Visible = false;
                    btnLogin.Visible = true;
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Home.aspx");
        }
    }
}
