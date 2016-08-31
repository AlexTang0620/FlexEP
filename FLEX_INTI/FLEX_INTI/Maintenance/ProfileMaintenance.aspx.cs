using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace FLEX_INTI.Maintenance
{
    public partial class ProfileMaintenance : System.Web.UI.Page
    {
        private void fill_gvProfileMaintenance()
        {
            //DataReader is limited to being read-only and forward-only.
            SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            SqlCommand getUserDetails = new SqlCommand("SELECT A.UserName, C.Name FROM aspnetUsers A LEFT JOIN AspNetUserRoles B ON A.Id = B.UserId LEFT JOIN ASPNETROLES C ON B.ROLEID = C.Id");
            SqlDataAdapter da = new SqlDataAdapter(getUserDetails);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gv_ProfileMaintenance.DataSource = dt;
            gv_ProfileMaintenance.DataBind();
            sqlConn.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //   fill_gvProfileMaintenance();

             //   gv_ProfileMaintenance.Columns[0].HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
            }
        }
    }
}