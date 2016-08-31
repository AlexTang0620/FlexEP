using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLEX_INTI.Part_maintenance
{
    public partial class Process_Spec : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string passed = (string)(Session["passVal"]);
            //int id = int.Parse(passed);

            int alrPassed = (int)(Session["process"]);

            //test to see if value is passed from Prod_process
            lbl1.Text = alrPassed.ToString();
        }

        protected void Save_Click(object sender, EventArgs e)
        {

        }

        protected void Back_Click(object sender, EventArgs e)
        {

        }
    }
}