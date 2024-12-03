using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using static QLBOWLING.DTO.Lane;

namespace QLBOWLING.DAO
{
    public class DAO_Lane : DbConnection
    {
        public DataTable LoadLane()
        {
            DataTable ds = new DataTable();
            DAO_Lane daoLane = new DAO_Lane();
            daoLane.Open();
            string qry = "select * from Lane";
            SqlCommand cmd = new SqlCommand(qry, daoLane.cnn);
            SqlDataReader reader = cmd.ExecuteReader();
            ds.Load(reader);
            daoLane.Close();
            return ds;
        }
    }
}