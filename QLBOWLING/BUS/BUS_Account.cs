using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using QLBOWLING.DAO;
using QLBOWLING.DTO;

namespace QLBOWLING.BUS
{
    public class BUS_Account
    {

        public void GhiThongTinKhachHang (Customer customer)
        {
            DAO_Account dao = new DAO_Account ();
            dao.GhiThongTinKhachHang(customer);
        }

        public int TrungTenDangNhap (string Username)

        {
            DAO_Account dao = new DAO_Account();
            return dao.TrungTenDangNhap(Username);
        }


        public int TrungSoDienThoai (string Phone)

        {
            DAO_Account dao = new DAO_Account();
            return dao.TrungSoDienThoai(Phone);
        }


        public int TrungEmail (string Email)
        {
            DAO_Account dao = new DAO_Account();
            return dao.TrungEmail(Email);
        }
        public int DangNhapThanhCong(string Username, string Password)
        {
            DAO_Account dao = new DAO_Account();
            return dao.DangNhapThanhCong(Username, Password);
        }

    }
}