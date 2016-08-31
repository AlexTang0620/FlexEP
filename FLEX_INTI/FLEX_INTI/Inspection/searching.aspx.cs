using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System.Threading.Tasks;
using FLEX_INTI.Models;
using System.Data;

namespace FLEX_INTI.Inspection
{
    public partial class searching : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void goBack(object sender, EventArgs e)
        {
            // get the variables passed to this page
            Response.Redirect("~/");
        }

        protected void search(object sender, EventArgs e)
        {
            DataAccess DA = new DataAccess();
            DataTable dt = DA.GetData("SELECT * FROM checkpointEntry");
            GridView1.DataSource = dt;
            GridView1.DataBind();

            GridView.Visible = true;
        }
    }
}