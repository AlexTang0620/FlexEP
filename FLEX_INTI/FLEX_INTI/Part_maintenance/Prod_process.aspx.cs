using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLEX_INTI.Part_maintenance
{
    public partial class Prod_process : System.Web.UI.Page
    {
        //getter and setter for NumberOfProcess variable
        protected int NumberOfProcess
        {
            get { return (int)ViewState["count"]; }
            set { ViewState["count"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                this.NumberOfProcess = 1;
            else 
                this.retainHTML();
        }

        //method to re-generate previsouly created html code
        protected void retainHTML() {
            int count = this.NumberOfProcess;

            for (int i = 1; i < count; i++) 
                generateHTML(i);
        }

        protected void Save_Click(object sender, EventArgs e)
        {
 
        }

        protected void invisible_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string btnid = btn.ID;
            int get = 0;

            for (int i = 1; i < NumberOfProcess; i++) {
                if (btnid.Equals("addSpec"+i.ToString())) {
                    get = i;
                }
            }

            //to get javascript value
            //string val = (Hidden1.Value).ToString();

            //pass that javascript value to specification page.
            //Session["passVal"] = val;

            //int passProcess = Convert.ToInt32(hidden.Value);

            if (get > 0) {
                Session["process"] = get;

                Response.Redirect("Process_Spec.aspx");
            }
        }

        protected void addProcess_Click(object sender, EventArgs e)
        {
            int nextId = this.NumberOfProcess;

            generateHTML(nextId);

            this.NumberOfProcess++;
        }

        Button addSpec;
        Label lblName, lblNum, lblDesc;
        TextBox txtName, txtNum, txtDesc;

        protected void generateHTML(int nextId)
        {
            string HTML, HTML2, HTML3, HTML4, HTML5;

            HTML = "<div class=\"panel-group\">";
            HTML += "<div class=\"panel panel-default\">";
            HTML += "<div class=\"panel-heading clearfix\">";
            HTML += "<a href = \"#colap" + nextId + "\" class=\"panel-title pull-left\" data-toggle=\"collapse\" data-target=\"#colap" + nextId + "\">Process " + nextId + "</a>";

            addSpec = new Button();
            addSpec.ID = "addSpec" + nextId.ToString();
            addSpec.CssClass = "btn btn-info pull-right";
            addSpec.Text = "Add Specification \u00BB";
            addSpec.Click += new EventHandler(invisible_Click);

            group.Controls.Add(new LiteralControl(HTML));
            group.Controls.Add(addSpec);

            //first </div> is for <div class = btn-toolbar>
            HTML2 = "</div><div id = \"colap" + nextId + "\" class=\"panel-collapse collapse\">";
            HTML2 += "<div class=\"panel-body\"><input type=\"hidden\" id=\"processToAddSpec\" value = \""+nextId+"\">";
            HTML2 += "<div class=\"form-group\">";

            lblName = new Label();
            lblName.ID = "lblname" + nextId.ToString();
            lblName.Text = "Process Name: ";
            lblName.CssClass = "col-md-2 control-label";

            txtName = new TextBox();
            txtName.ID = "txtName" + nextId.ToString();
            txtName.CssClass = "form-control";

            group.Controls.Add(new LiteralControl(HTML2));
            group.Controls.Add(lblName);
            group.Controls.Add(txtName);

            HTML3 = "</div><div class =\"form-group\">";

            lblNum = new Label();
            lblNum.ID = "lblnum" + nextId.ToString();
            lblNum.Text = "Process Number: ";
            lblNum.CssClass = "col-md-2 control-label";

            txtNum = new TextBox();
            txtNum.ID = "txtNum" + nextId.ToString();
            txtNum.CssClass = "form-control";

            group.Controls.Add(new LiteralControl(HTML3));
            group.Controls.Add(lblNum);
            group.Controls.Add(txtNum);

            HTML4 = "</div><div class = \"form-group\">";

            lblDesc = new Label();
            lblDesc.ID = "lblDesc" + nextId.ToString();
            lblDesc.Text = "Process Description: ";
            lblDesc.CssClass = "col-md-2 control-label";

            txtDesc = new TextBox();
            txtDesc.ID = "txtDesc" + nextId.ToString();
            txtDesc.CssClass = "form-control";

            group.Controls.Add(new LiteralControl(HTML4));
            group.Controls.Add(lblDesc);
            group.Controls.Add(txtDesc);

            HTML5 = "</div></div></div></div>";
            group.Controls.Add(new LiteralControl(HTML5));
        }
    }
}