using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using QLBOWLING.DTO;
using System.Data.Common;

namespace QLBOWLING.DAO
{
    public class DAO_Account : DbConnection
    {
        public void GhiThongTinKhachHang(Account account)
        {
            DAO_Account dao = new DAO_Account();
            dao.Open();
            string query = "INSERT INTO Account (UserName,DisplayName,PassWord,Type,Address,Phone) values ('" + account.Username + "','" + account.displayName + "','" + account.passWord + "','3','" + account.ADDRESS + "','" + account.PHONE + "') ";
            SqlCommand cmd = new SqlCommand(query, dao.cnn);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            dao.Close();
        }

        public int TrungTenDangNhap(string Username)
        {
            DAO_Account dao = new DAO_Account();
            dao.Open();
            string query = "SELECT * FROM Account WHERE Username = '" + Username + "'";
            SqlCommand cmd = new SqlCommand(query, dao.cnn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                return 1;
            }
            return 0;

        }

        public int TrungSoDienThoai(string Phone)
        {
            DAO_Account dao = new DAO_Account();
            dao.Open();
            string query = "SELECT * FROM Account WHERE PHONE = '" + Phone + "'";
            SqlCommand cmd = new SqlCommand(query, dao.cnn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                return 1;
            }
            return 0;
        }

        public int DangNhapThanhCong(string Username, string Password)
        {
            int role = -1;
            DAO_Account dao = new DAO_Account();
            dao.Open();
            string query = "SELECT * FROM Account WHERE Username = '" + Username + "' AND passWord = '" + Password + "'";
            SqlCommand cmd = new SqlCommand(query, dao.cnn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                role = reader.GetInt32(4);
            }
            cmd.Dispose();
            reader.Dispose();
            dao.Close();
            return role;
        }
    
}
}