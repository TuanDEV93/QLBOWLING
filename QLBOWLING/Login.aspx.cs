using QLBOWLING.BUS;
using QLBOWLING.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBOWLING
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                Response.Redirect("Home.aspx");

            }    
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            BUS_Account bus = new BUS_Account();

            int role = bus.DangNhapThanhCong(username, password);

            if (role == 1)
            {
                Session["Username"] = username;

                ClientScript.RegisterStartupScript(this.GetType(), "showMessage",
                    "showSuccessMessage('Đăng nhập thành công!', 'success');", true);

                Response.AddHeader("REFRESH", "1;URL=Admin/Dashboard.aspx");
            }
            else if (role == 0)
            {
                Session["Username"] = username;

                ClientScript.RegisterStartupScript(this.GetType(), "showMessage",
                    "showSuccessMessage('Đăng nhập thành công!', 'success');", true);

                Response.AddHeader("REFRESH", "1;URL=Services.aspx");
            }
            else if (role == 2)
            {
                Session["Username"] = username;

                ClientScript.RegisterStartupScript(this.GetType(), "showMessage",
                    "showSuccessMessage('Đăng nhập thành công!', 'success');", true);

                Response.AddHeader("REFRESH", "1;URL=Home.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "showMessage",
                    "showSuccessMessage('Sai tên đăng nhập hoặc mật khẩu!', 'error');", true);
            }
        }

    }
}
