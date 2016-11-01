using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace DAO
{
    public class DataProvider
    {
        public static SqlConnection KetNoi()
        {
            string sChuoi = @"Data Source=DESKTOP-L8JMH5Q\SQLEXPRESS;Initial Catalog=QuanLyKho;Integrated Security=True";
            SqlConnection con = new SqlConnection(sChuoi);
            con.Open();
            return con;
        }
        public static void DongKetNoi(SqlConnection con)
        {
            con.Close();
        }
        public static DataTable LayDataTable(string sTruyVan, SqlConnection con)
        {
            SqlDataAdapter sda = new SqlDataAdapter(sTruyVan, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;
        }
        public static void ThucThiTruyVan(string sTruyVan, SqlConnection con)
        {
            SqlCommand com = new SqlCommand(sTruyVan, con);
            com.ExecuteNonQuery();
        }
    }
}
