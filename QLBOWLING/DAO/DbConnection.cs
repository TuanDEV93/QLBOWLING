﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace QLBOWLING.DAO
{
    public class DbConnection
    {
        public SqlConnection cnn;
        public DbConnection()
        {
            string strcnn = "Data Source=.\\SQLEXPRESS;Initial Catalog=ShopQuanAo;Trusted_Connection=True;";
            cnn = new SqlConnection(strcnn);
        }
        public void Open()
        {
            cnn.Open();
        }
        public void Close()
        {
            cnn.Close();
        }
    }
}