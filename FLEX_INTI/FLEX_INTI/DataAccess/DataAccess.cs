using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System;

namespace FLEX_INTI
{

    public class DataAccess : SQLConnection
    {
        public void SaveData(string sql)
        {
            try
            {
                command.CommandType = CommandType.Text;
                command.CommandText = sql;
                command.ExecuteNonQuery();
            }
            finally
            {
                connection.Close();
            }
        }

        public DataTable GetData(string Sql)
        {
            try
            {
                DataTable dt = new DataTable();
                command.CommandText = Sql;
                adapter.SelectCommand = command;
                adapter.Fill(dt);
                connection.Close();
                return dt;
            }
            catch
            {
                throw;
            }
            finally
            {
                connection.Close();
            }
        }
    }
}