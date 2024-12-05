using System;
using System.Collections.Generic;
using System.Data;
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
            string strcnn = "Data Source=DESKTOP-H3558DE\\SQLEXPRESS;Initial Catalog=QLBowling;Trusted_Connection=True;";

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
        // Phương thức thực thi truy vấn trả về DataTable
        public DataTable ExecuteQuery(string query, SqlParameter[] parameters = null)
        {
            try
            {
                Open();
                using (SqlCommand cmd = new SqlCommand(query, cnn))
                {
                    if (parameters != null)
                        cmd.Parameters.AddRange(parameters);

                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);
                        return dataTable;
                    }
                }
            }
            finally
            {
                Close();
            }
        }

        // Phương thức thực thi lệnh trả về số dòng bị ảnh hưởng
        public int ExecuteNonQuery(string query, SqlParameter[] parameters = null)
        {
            try
            {
                Open();
                using (SqlCommand cmd = new SqlCommand(query, cnn))
                {
                    if (parameters != null)
                        cmd.Parameters.AddRange(parameters);

                    return cmd.ExecuteNonQuery();
                }
            }
            finally
            {
                Close();
            }
        }

        // Phương thức thực thi lệnh trả về giá trị đơn lẻ
        public object ExecuteScalar(string query, SqlParameter[] parameters = null)
        {
            try
            {
                Open();
                using (SqlCommand cmd = new SqlCommand(query, cnn))
                {
                    if (parameters != null)
                        cmd.Parameters.AddRange(parameters);

                    return cmd.ExecuteScalar();
                }
            }
            finally
            {
                Close();
            }
        }

    }

}