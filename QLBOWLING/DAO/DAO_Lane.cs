using QLBOWLING.DTO;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using static QLBOWLING.DTO.LaneDTO;
namespace QLBOWLING.DAO
{
    public class DAO_Lane : DbConnection
    {
        private DbConnection dbConnection;
        public DAO_Lane()
        {
            dbConnection = new DbConnection();
            dbConnection.Open();
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
        public int GetLanePrice(int laneID)
        {
            int price = 0;

            string query = "SELECT PriceLane FROM Lane WHERE LaneID = @LaneID";
            using (SqlCommand command = new SqlCommand(query, dbConnection.cnn))
            {
                // Thêm tham số cho câu truy vấn
                command.Parameters.AddWithValue("@LaneID", laneID);

                // Thực hiện truy vấn và lấy giá trị trả về
                object result = command.ExecuteScalar();  // ExecuteScalar() chỉ trả về một giá trị đầu tiên của truy vấn

                if (result != null)
                {
                    price = Convert.ToInt32(result);  // Chuyển đổi kết quả từ object sang int
                }
            }

            return price;
        }
        public List<LaneDTO> GetLanes()
        {
            List<LaneDTO> lanes = new List<LaneDTO>();

            using (SqlConnection connection = new SqlConnection(dbConnection.cnn.ConnectionString))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("SELECT TOP 6 LaneId, LaneName, Status FROM Lane", connection);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    LaneDTO lane = new LaneDTO
                    {
                        LaneID = reader.GetInt32(0),
                        LaneName = reader.GetString(1),
                        Status = reader.GetBoolean(2)
                    };
                    lanes.Add(lane);
                }

                return lanes;
            }
        }
    }
}