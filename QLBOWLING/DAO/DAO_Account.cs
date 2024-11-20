using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace QLBOWLING.DAO
{
    public class DAO_Account:DbConnection
    {
        public int DangNhapThanhCong (string Username, string Password)
        {
            int flag = -1;
            DAO_Account dao = new DAO_Account();
            dao.Open();
            string query = "SELECT * FROM Account WHERE Username = '" + Username + "' AND passWord = '" + Password + "'";
            SqlCommand cmd = new SqlCommand(query, dao.cnn);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows) 
            {
                reader.Read();
                bool isAdmin = Convert.ToBoolean(reader.GetInt32(3));



                if (isAdmin == true) 
                {
                    flag = 1;
                }
                else 
                { 
                    flag = 0; 
                }
            }
            cmd.Dispose();
            reader.Dispose();
            dao.Close();
            return flag;
        }
    }
}