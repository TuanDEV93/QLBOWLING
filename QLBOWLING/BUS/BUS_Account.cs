using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using QLBOWLING.DAO;

namespace QLBOWLING.BUS
{
    public class BUS_Account
    {
        public int DangNhapThanhCong(string Username, string Password)
        {
            DAO_Account dao = new DAO_Account();
            return dao.DangNhapThanhCong(Username, Password);
        }
    }
}