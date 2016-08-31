using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace FLEX_INTI.Part_maintenance
{
    public class Part_model
    {
        public int partID { get; set;}
        public string partNumber { get; set; }
        public int revision { get; set; }
        public int materialID { get; set; }
        public string partName { get; set;}
        public string partDescription { get; set; }
        public bool isReleased { get; set; }
        public string createdBy { get; set; }
        public string createdDate { get; set; }
    }

    public class PartDataAccessLayer
    {
        public static List<Part_model> GetAllParts()
        {
            List<Part_model> listParts = new List<Part_model>();

            string CS = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM partMstr", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Part_model part = new Part_model();
                    part.partID = Convert.ToInt32(reader["partID"]);
                    part.partNumber = reader["partNumber"].ToString();
                    part.revision = Convert.ToInt32(reader["Revision"]);
                    part.materialID = Convert.ToInt32(reader["materialID"]);
                    part.partName = reader["partName"].ToString();
                    part.partDescription = reader["partDescription"].ToString();
                    part.isReleased = (bool)reader["isReleased"];
                    part.createdBy = reader["createdBy"].ToString();
                    part.createdDate = reader["createdDate"].ToString();

                    listParts.Add(part);
                }
            }

            return listParts;
        }
    }
}