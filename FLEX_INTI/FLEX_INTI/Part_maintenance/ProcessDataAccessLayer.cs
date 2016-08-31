using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FLEX_INTI.Part_maintenance
{
    public class Process
    {
        public int processID { get; set; }
        public int partID { get; set; }
        public string processName { get; set; }
        public string processNumber { get; set; }
        public string processDescription { get; set; }
    }

    public class ProcessDataAccessLayer
    {
        public static List<Process> GetAllProcess(int partID)
        {
            List<Process> listProcess = new List<Process>();

            string CS = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM processMstr WHERE partID = @partID", con);
                SqlParameter parameter = new SqlParameter();
                parameter.ParameterName = "@partID";
                parameter.Value = partID;
                cmd.Parameters.Add(parameter);

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Process process = new Process();
                    process.processID = Convert.ToInt32(reader["processID"]);
                    process.partID = Convert.ToInt32(reader["partID"]);
                    process.processName = reader["processName"].ToString();
                    process.processNumber = reader["processNumber"].ToString();
                    process.processDescription = reader["processDescription"].ToString();

                    listProcess.Add(process);
                }
            }

            return listProcess;
        }
    }
}