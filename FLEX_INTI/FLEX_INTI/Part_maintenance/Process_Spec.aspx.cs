using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//namespace Flex.Part_maintenance
namespace FLEX_INTI.Part_maintenance
{
    public partial class Process_Spec : System.Web.UI.Page
    {
        //getter and setter for NumberOfProcess variable
        protected int NumberOfCheckpt
        {
            get { return (int)ViewState["count"]; }
            set { ViewState["count"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //string passed = (string)(Session["passVal"]);
            //int id = int.Parse(passed);

            //int alrPassed = (int)(Session["process"]);

            //test to see if value is passed from Prod_process
            //lbl1.Text = alrPassed.ToString();

            if (!Page.IsPostBack)
                this.NumberOfCheckpt = 1;
            else
                this.retainHTML();

        }

        //method to re-generate previsouly created html code
        protected void retainHTML()
        {
            int count = this.NumberOfCheckpt;

            for (int i = 1; i < count; i++)
                generateHTML(i);
        }

        Label lblName, lblRange;
        TextBox txtName, txtRange;

        protected void generateHTML(int nextId)
        {
            string HTML;

            HTML = "<div class=\"panel-group\">";
            HTML += "<div class=\"panel panel-default\">";
            HTML += "<div class=\"panel-heading clearfix\">";
            HTML += "<a href = \"#colap" + nextId + "\" class=\"panel-title pull-left\" data-toggle=\"collapse\" data-target=\"#colap" + nextId + "\">Checkpoint " + nextId + "</a>";
            HTML += "</div><div id = \"colap" + nextId + "\" class=\"panel-collapse collapse\">";
            HTML += "<div class=\"panel-body\"><input type=\"hidden\" id=\"processToAddSpec\" value = \"" + nextId + "\">";
            HTML += "<div class=\"form-group\">";

            lblName = new Label();
            lblName.ID = "lblname" + nextId.ToString();
            lblName.Text = "Characteristic: ";
            lblName.CssClass = "col-md-2 control-label";

            txtName = new TextBox();
            txtName.ID = "txtName" + nextId.ToString();
            txtName.CssClass = "form-control";

            group.Controls.Add(new LiteralControl(HTML));
            group.Controls.Add(lblName);
            group.Controls.Add(txtName);

            HTML = "</div><div class =\"form-group\">";

            lblRange = new Label();
            lblRange.ID = "lblRange" + nextId.ToString();
            lblRange.Text = "Specification: ";
            lblRange.CssClass = "col-md-2 control-label";

            txtRange = new TextBox();
            txtRange.ID = "txtRange" + nextId.ToString();
            txtRange.CssClass = "form-control";

            group.Controls.Add(new LiteralControl(HTML));
            group.Controls.Add(lblRange);
            group.Controls.Add(txtRange);

            HTML = "</div></div></div></div>";
            group.Controls.Add(new LiteralControl(HTML));
        }


        protected void Save_Click(object sender, EventArgs e)
        {

        }

        protected void Back_Click(object sender, EventArgs e)
        {

        }

        protected void addCheckpt_Click(object sender, EventArgs e)
        {
            int nextId = this.NumberOfCheckpt;

            generateHTML(nextId);

            this.NumberOfCheckpt++;
        }
    }
}