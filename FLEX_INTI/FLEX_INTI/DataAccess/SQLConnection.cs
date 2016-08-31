using System.Configuration;
using System.Data.SqlClient;

namespace FLEX_INTI
{
    public class SQLConnection
    {
        protected SqlTransaction transaction = null;
        protected SqlConnection connection = null;
        protected SqlCommand command = null;
        protected SqlDataAdapter adapter = null;

        public SQLConnection()
        {
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
            connection.Open();
            command = connection.CreateCommand();
            command.CommandTimeout = 30;
            adapter = new SqlDataAdapter();
        }
    }
}
