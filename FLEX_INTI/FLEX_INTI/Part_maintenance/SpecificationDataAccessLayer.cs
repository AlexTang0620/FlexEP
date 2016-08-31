using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FLEX_INTI.Part_maintenance
{
    public class Specification
    {
        public int specificationID { get; set; }
        public int processID { get; set; }
        public string specificationNumber { get; set; }
        public string specificationName { get; set; }
        public string specificationRange { get; set; }
    }

    public class SpecificationDataAccessLayer
    {
        public static List<Specification> GetAllSpec(int processID)
        {
            List<Specification> listSpec = new List<Specification>();

            string CS = ConfigurationManager.ConnectionStrings["flexDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM specificationMstr WHERE processID = @processID", con);
                SqlParameter parameter = new SqlParameter();
                parameter.ParameterName = "@processID";
                parameter.Value = processID;
                cmd.Parameters.Add(parameter);

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Specification spec = new Specification();
                    spec.specificationID = Convert.ToInt32(reader["specificationID"]);
                    spec.processID = Convert.ToInt32(reader["processID"]);
                    spec.specificationNumber = reader["specificationNumber"].ToString();
                    spec.specificationName = reader["specificationName"].ToString();
                    spec.specificationRange = reader["specificationRange"].ToString();

                    listSpec.Add(spec);
                }
            }

            return listSpec;
        }
    }
}