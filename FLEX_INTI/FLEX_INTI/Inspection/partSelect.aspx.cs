using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace FLEX_INTI.Inspection
{
    public partial class partSelect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated) // if the user is not logged in
            {
                Response.Redirect("~/Default.aspx");
            } 

            var items = partSelectDrop.Items;

            DataAccess DA = new DataAccess();
            string SQL = @"SELECT partID,partNumber from partMstr t1
                            WHERE t1.Revision = (SELECT max(Revision) FROM partMstr t2 WHERE t2.partNumber = t1.partNumber)
                            ORDER BY partID;";
            DataTable dt = DA.GetData(SQL);

            items.Add(new ListItem("-- Please Select Part --", "0"));
            for (int x = 0; x < dt.Rows.Count ; x++)
            {
                items.Add(new ListItem(Convert.ToString(dt.Rows[x][1]),Convert.ToString(dt.Rows[x][0])));
            }
        }

        protected void completeProcess(Object sender, EventArgs e)
        {
            string buttonID = (sender as Control).ClientID; // Hyperlink ID to track which process they selected
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                // Run complete process codes here
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked YES!')", true);
            }
            else
            {
                // cancel complete process
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked NO!')", true);
            }
        }

        protected void generateProcess(Object sender, EventArgs e)
        {
            // SELECT all process then generate all hyperlink for each process
            // Call this method when dropdown part is choose

            //"&emsp; &emsp; &emsp;<a class=\"MenuLink\" runat=\"server\" href=\"~/Inspection/inspectionEntry\">Inspection</a>"
            //        "&emsp;&emsp;<a class=\"MenuLink\" runat=\"server\" href=\"#\" id=\"completeProcess1\" onclick=\"Confirm()\" onserverclick=\"completeProcess\">Complete</a>"
            //        "&emsp;&emsp;<a class=\"MenuLink\" runat=\"server\" href=\"~/Inspection/viewInspection\">View</a>"
            //        "&emsp;&emsp;<a class=\"MenuLink\" runat=\"server\" href=\"~/Inspection/editInspection\">Edit</a></p>"


           
            //processDetailPanel.Controls.Add(new LiteralControl());


        }
    }
}