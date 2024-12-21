using QLBOWLING.DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace QLBOWLING.BUS
{
    public class BUS_Bill
    {
        private DAO_Bill daoBill;
        public BUS_Bill()
        {
            daoBill = new DAO_Bill();
        }

        public DataTable LoadDoanhThuTheoThang(int month, int year)
        {
            DAO_Bill daoBill = new DAO_Bill();
            return daoBill.LoadDoanhThuTheoThang(month, year);
        }

        public DataTable LoadTopCanceller()
        {
            DAO_Bill daoBill = new DAO_Bill();
            return daoBill.LoadTopCanceller();
        }
    }
}