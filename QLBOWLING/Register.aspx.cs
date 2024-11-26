using QLBOWLING.BUS;
using QLBOWLING.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBOWLING
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BUS_Account bus = new BUS_Account();
                int verifyUsername = bus.TrungTenDangNhap (txtUsername.Text.Trim());
                int verifyPhone = bus.TrungSoDienThoai (txtPhone.Text.Trim());

                if (verifyUsername == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "showMessage",
                    "showNotificationMessage('Tên đăng nhập này đã có người sử dụng !', 'error');", true);
                }
                else if (verifyPhone == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "showMessage",
                    "showNotificationMessage('Số điện thoại này đã có người sử dụng !', 'error');", true);
                }
                else
                {
                    Account account = new Account();
                    account.Username = txtUsername.Text;
                    account.displayName = txtFullname.Text;
                    account.passWord = txtPassword.Text;
                    account.ADDRESS = txtAddress.Text;
                    account.PHONE = txtPhone.Text;
                    bus.GhiThongTinKhachHang (account);
                    ClientScript.RegisterStartupScript(this.GetType(), "showMessage",
                    "showNotificationMessage('Đăng kí thành công!', 'success');", true);
                    XoaThongTin();
                }
            }
        }

        public void XoaThongTin()
        {
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtFullname.Text = "";
            txtAddress.Text = "";
            txtPhone.Text = "";
        }
    }
}