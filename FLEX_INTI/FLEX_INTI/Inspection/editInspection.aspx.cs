using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace FLEX_INTI.Inspection
{
    public partial class editInspection : System.Web.UI.Page
    {
        // Pass variable to this page
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated) // if the user is not logged in
            {
                Response.Redirect("~/Default.aspx");
            }
            string HTML;

            HTML = "<p>Part Number : Case-A-1001</p>"; // part number
            HTML += "<p>Process Number : 1</p>"; // Process number

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

            int nextId = 1;
            // Loop nextId = how many inspection


            HTML = "<div class=\"panel-group\">";
            HTML += "<div class=\"panel panel-default\">";
            HTML += "<div class=\"panel-heading\">";
            HTML += "<a href = \"#colap" + nextId + "\" class=\"panel-title pull-left\" data-toggle=\"collapse\" data-target=\"#colap" + nextId + "\">Process " + nextId + "</a>";
            // If position lower dont show edit button
            //HTML += "<button type = \"button\" id=\"inspection" + nextId + "\" runat=\"server\" onclick=\"enableEdit\" class=\"btn btn-info pull-right\">Edit Inspection &raquo;</button>";
            this.group.Controls.Add(new LiteralControl(HTML));

            //Button btn = new Button();
            //btn.CssClass = "btn btn-info pull-right";
            //btn.ID = "inspection" + nextId;
            //btn.Text = "Enable Edit";
            //btn.Click += new EventHandler(enableEdit);
            //this.group.Controls.Add(btn);

            //HTML = "<asp:Button runat=\"server\" ID=\"inspection" + nextId + "\" onclick=\"enableEdit\" CssClass=\"btn btn-default\" Text=\"Edit Inspection &raquo;\" />";
            HTML = "<div class=\"clearfix\"></div></div>";
            HTML += "<div id = \"colap" + nextId + "\" class=\"panel-collapse collapse\">";
            HTML += "<div class=\"panel-body\"><div class = \"form-group\" style=\"padding-left:50px;\">";

            this.group.Controls.Add(new LiteralControl(HTML));
            DataAccess DA = new DataAccess();
            string sql;
            int processID = 1;

            Label LB4 = new Label();
            LB4.Text = "Checkpoint";
            LB4.CssClass = "entryLabel";

            Label LB5 = new Label();
            LB5.Text = "Format";
            LB5.CssClass = "entryLabel";

            Label LB6 = new Label();
            LB6.Text = "Range";
            LB6.CssClass = "entryLabel";

            Label LB7 = new Label();
            LB7.Text = "Result";
            LB7.CssClass = "entryLabel";
            group.Controls.Add(LB4);
            group.Controls.Add(LB5);
            group.Controls.Add(LB6);
            group.Controls.Add(LB7);
            group.Controls.Add(new LiteralControl("<br><br>"));

            sql = "SELECT * FROM specificationMstr WHERE processID = " + processID + " ORDER BY specificationNumber";
            DataTable dt = DA.GetData(sql);

            sql = "SELECT * FROM specificationEntry WHERE batchID = 2 ORDER BY specificationID";
            DataTable dt1 = DA.GetData(sql);

            // Select all checkpoint from database and generate textbox
            for (int x = 0; x < dt.Rows.Count -1 ; x++)
            {
                Label LB = new Label();
                LB.Text = "&emsp;&emsp;" + (x+1);
                LB.CssClass = "entryLabel";

                Label LB2 = new Label();
                LB2.Text = Convert.ToString(dt.Rows[x]["specificationName"]);
                LB2.CssClass = "entryLabel";

                Label LB3 = new Label();
                LB3.Text = Convert.ToString(dt.Rows[x]["specificationRange"]);
                LB3.CssClass = "entryLabel";

                TextBox tx = new TextBox();
                tx.CssClass = "form-control";
                tx.ID = "Checkpoint" + x;
                foreach (DataRow rw in dt1.Rows)
                {
                    if (Convert.ToString(rw["specificationID"]) == Convert.ToString(dt.Rows[x]["specificationID"]))
                    {
                        tx.Text = Convert.ToString(dt1.Rows[x]["Value"]);
                    }
                }

                group.Controls.Add(LB);
                group.Controls.Add(LB2);
                group.Controls.Add(LB3);
                group.Controls.Add(tx);

                group.Controls.Add(new LiteralControl("<br>"));
            }

            Button btn = new Button();
            btn.ID = "editSave_" + processID;
            btn.CssClass = "btn btn-default";
            btn.Text = "Save";
            btn.Click += new EventHandler(saveEdit);
            group.Controls.Add(btn);

            HTML = "</div></div></div></div>";
            this.group.Controls.Add(new LiteralControl(HTML));
        }

        protected void goBack(object sender, EventArgs e)
        {
            // get the variables passed to this page
            Response.Redirect("~/Inspection/partSelect.aspx");
        }

        protected void saveEdit(object sender, EventArgs e)
        {
            Response.Redirect("~/Inspection/partSelect.aspx");
        }

    }
}