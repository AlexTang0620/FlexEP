using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLEX_INTI.Inspection
{
    public partial class DataEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated) // if the user is not logged in
            {
                Response.Redirect("~/Default.aspx");
            }
            DataAccess DataAccess = new DataAccess();
            string sql;
            string HTML;

            HTML = "<p>Part Number : Case-A-1001</p>"; // part number
            HTML += "<p>Process Number : 1</p>"; // Process number
            HTML += "<p>Inspection number : 3</p>";

            inspectionDetail.Controls.Add(new LiteralControl(HTML));

            Label lbWorkOrder = new Label();
            lbWorkOrder.Text = "Process Workorder : ";
            lbWorkOrder.CssClass = "entryLabel";
            TextBox txtWorkOrder = new TextBox();
            txtWorkOrder.CssClass = "form-control workorder";
            txtWorkOrder.ID = "workorder";
            txtWorkOrder.Text = "WO0001";

            inspectionDetail.Controls.Add(lbWorkOrder);
            inspectionDetail.Controls.Add(txtWorkOrder);
            inspectionDetail.Controls.Add(new LiteralControl("<br>"));


            // Select the image source from database
            Image im = new Image();
            string source = "";
            im.ImageUrl = "../Image/imagegateway.aspx?type=png&source=" + source;
            im.CssClass = "imageSlides";
            imagePanel.Controls.Add(im);

            source = "C:/Users/KhangSheong/Downloads/green_tick.png";
            Image im1 = new Image();
            im1.ImageUrl = "../Image/imagegateway.aspx?type=png&source=" + source;
            im1.CssClass = "imageSlides";
            imagePanel.Controls.Add(im1);

            int processID = 1;
            sql = "SELECT * FROM checkpointMstr WHERE processID = " + processID + " ORDER BY checkpointNumber";
            DataTable dt = DataAccess.GetData(sql);

            // Select all checkpoint from database and generate textbox
            for (int x = 0; x < dt.Rows.Count-1; x++)
            {
                Label LB = new Label();
                LB.Text = "&emsp;&emsp;" + (x+1);
                LB.CssClass = "control-label entryLabel";

                Label LB2 = new Label();
                LB2.Text = Convert.ToString(dt.Rows[x]["checkpointCharacteristic"]);
                LB2.CssClass = "control-label entryLabel";

                Label LB3 = new Label();
                LB3.Text = Convert.ToString(dt.Rows[x]["checkpointSpecification"]);
                LB3.CssClass = "control-label entryLabel";

                TextBox tx = new TextBox();
                tx.CssClass = "form-control";
                tx.ID = "Checkpoint" + x;

                dataEntry.Controls.Add(LB);
                dataEntry.Controls.Add(LB2);
                dataEntry.Controls.Add(LB3);
                dataEntry.Controls.Add(tx);
                dataEntry.Controls.Add(new LiteralControl("<br>"));
            }
        }

        protected void goBack(object sender, EventArgs e)
        {
            // get the variables passed to this page
            Response.Redirect("~/Inspection/partSelect.aspx");
        }

        protected void saveEntry(object sender, EventArgs e)
        {
            // Use this method to confirm and save to database

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

        protected void saveDraft(object sender, EventArgs e)
        {
            // Use this method to confirm and save to database

            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                // Run complete process codes here
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked YES! Save Draft')", true);
            }
            else
            {
                // cancel complete process
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You clicked NO! Save Draft')", true);
            }
        }
    }
}