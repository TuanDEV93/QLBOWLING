using QLBOWLING.DTO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace QLBOWLING.DAO
{
    public class DAO_Lane : DbConnection
    {
        public DAO_Lane()
        {
            dbConnection = new DbConnection();
        }
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

        private DbConnection dbConnection;
        public List<LaneDTO> LoadLaneList()
        {
            SqlConnection connection = dbConnection.cnn;
            connection.Open();
            List<LaneDTO> ds = new List<LaneDTO>();
            string query = "SELECT * from Lane";
            SqlCommand sqlCmd = new SqlCommand(query, connection);
            SqlDataReader reader = sqlCmd.ExecuteReader();
            while (reader.Read())
            {
                int laneID = reader.GetInt32(0);
                string nameLane = reader.GetString(1);
                bool status = reader.GetBoolean(2);

                LaneDTO lane = new LaneDTO();
                lane.LaneID = laneID;
                lane.LaneName = nameLane;
                lane.Status = status;

                ds.Add(lane);
            }
            connection.Close();
            return ds;
        }
    }
}