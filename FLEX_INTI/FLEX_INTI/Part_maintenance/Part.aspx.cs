using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLEX_INTI.Part_maintenance
{
    public partial class Part : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GoProcess_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Part_maintenance/Prod_process.aspx");
        }



        protected void DropDown_MaterialName_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}