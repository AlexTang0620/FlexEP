using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FLEX_INTI.Part_maintenance
{
    public class Material
    {
        public int materialID { get; set; }
        public string materialName { get; set; }
    }

    public class MaterialDataAccessLayer
    {
        public static List<Material> GetAllMaterial()
        {
            List<Material> listMaterial = new List<Material>();

            string CS = ConfigurationManager.ConnectionStrings["flexDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM materialMstr", con);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Material mat = new Material();
                    mat.materialID = Convert.ToInt32(reader["materialID"]);
                    mat.materialName = reader["materialName"].ToString();

                    listMaterial.Add(mat);
                }

                }

            return listMaterial;
            }
    }
}