using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Optimization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLBOWLING.Admin;
using QLBOWLING.BUS;
using QLBOWLING.DAO;
using QLBOWLING.DTO;

namespace QLBOWLING
{
    public partial class QRCode : Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                QRcode contentQR = new QRcode();
                // Lấy thông tin từ QueryString
                string userBooking = Request.QueryString["UserBooking"];
                string phone = Request.QueryString["Phone"];
                string email = Request.QueryString["Email"];
                string bookingDate = Request.QueryString["BookingDate"];
                string timeSlot = Request.QueryString["TimeSlot"];
                string totalPrice = Request.QueryString["TotalPrice"];
                string depositPrice = Request.QueryString["DepositPrice"];
                string guid = Guid.NewGuid().ToString().Replace("-","");
                // Hiển thị thông tin
                litUserBooking.Text = userBooking;
                litPhone.Text = phone;
                
                litBookingDate.Text = bookingDate;
                litTimeSlot.Text = timeSlot;
               
                LitDepositPrice.Text = !string.IsNullOrEmpty(depositPrice) ? $"{depositPrice} VND" : "N/A";
                LitGuid.Text = guid;

                contentQR.CTK = ConfigurationManager.AppSettings["CTK"].ToString();
                contentQR.content = guid;
                contentQR.ID_Bank = ConfigurationManager.AppSettings["ID_Bank"].ToString();
                contentQR.STK = ConfigurationManager.AppSettings["STK"].ToString();
                contentQR.Template = ConfigurationManager.AppSettings["Template"].ToString();
                contentQR.DepositPrice = depositPrice;

                setContent(contentQR);

            }

        }
        private void setContent(QRcode contentQR)
        {
            string url_qr_bank = $"https://img.vietqr.io/image/{contentQR.ID_Bank}-{contentQR.STK}-{contentQR.Template}?amount={contentQR.DepositPrice}&addInfo={contentQR.content}&accountName={contentQR.CTK}";
            img_qr_bank.Src = url_qr_bank;

            LitBank.Text = contentQR.CTK;
            LitSTK.Text = contentQR.STK;
            LitGuid.Text = contentQR.content.ToString();
            LitDepositPrice.Text = contentQR.DepositPrice;
        }

        private static bool checkPayment( int status, string contentPayment, string totalMoney)
        {
            List<QRcode> list = new List<QRcode>();
            string urlAppScriptCheckPayment = $"https://script.google.com/macros/s/AKfycby7-FooKyZ9DEPjMj9DbbcpXX8V2KOyWgh9lVd6tGgfmnnulB-aFf_mZRW-NI-Ks1C9rw/exec?description={contentPayment}&value={totalMoney}";
            bool statusPayment = GetGoogleAppsScriptCheckPayment(urlAppScriptCheckPayment);

            if (statusPayment)
            {
                // tạo biến cục bộ và truy cập HttpContext.Current.Session để lấy username từ Session
                string username = HttpContext.Current.Session["Username"] as string;
                BUS_Bill billBus = new BUS_Bill();
                DAO_Bill daoBill = new DAO_Bill();
                int customerID = daoBill.GetCustomerIDByUsername(username);
                int bookingId = daoBill.GetLatestBookingIDByCustomerID(customerID);

                billBus.UpdateBillStatus(bookingId, status);
            }
            else return false;

            return true;
        }
        private static bool GetGoogleAppsScriptCheckPayment(string urlGoogleAppsScript)
        {
            bool statusPayment = false;

            using (WebClient client = new WebClient())
            {
                    string response = client.DownloadString(urlGoogleAppsScript);

                    if (response.Trim().Equals("true", StringComparison.OrdinalIgnoreCase)) statusPayment = true;
                
            }

            return statusPayment;
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            string contentPayment = LitGuid.Text.Trim();
            string totalPayment = LitDepositPrice.Text.Trim();
            int status = 2;

            if (checkPayment(status, contentPayment,totalPayment))
            {
                string alert = "aler(\"Thanh toan thanh cong\")";
                ClientScript.RegisterStartupScript(this.GetType(), "PaymentSuccess", alert, true);
                
                Response.Redirect("BookingConfirmation.aspx");
            }
            
        }
    }
}