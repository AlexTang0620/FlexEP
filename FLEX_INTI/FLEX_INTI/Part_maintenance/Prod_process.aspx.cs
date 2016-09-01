using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

//namespace Flex
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
        Label lblName,lblDesc;

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Part.aspx");
        }

        TextBox txtName,txtDesc;
        FileUpload uploader;

        protected void generateHTML(int nextId)
        {
            string HTML;

            HTML = "<div class=\"panel-group\">";
            HTML += "<div class=\"panel panel-default\">";
            HTML += "<div class=\"panel-heading clearfix\">";
            HTML += "<a href = \"#colap" + nextId + "\" class=\"panel-title pull-left\" data-toggle=\"collapse\" data-target=\"#colap" + nextId + "\">Process " + nextId + "</a>";

            addSpec = new Button();
            addSpec.ID = "addSpec" + nextId.ToString();
            addSpec.CssClass = "btn btn-info pull-right";
            addSpec.Text = "Add Checkpoint \u00BB";
            addSpec.Click += new EventHandler(invisible_Click);

            group.Controls.Add(new LiteralControl(HTML));
            group.Controls.Add(addSpec);

            HTML = "</div><div id = \"colap" + nextId + "\" class=\"panel-collapse collapse\">";
            HTML += "<div class=\"panel-body\"><input type=\"hidden\" id=\"processToAddSpec\" value = \""+nextId+"\">";
            HTML += "<div class=\"form-group\">";

            lblName = new Label();
            lblName.ID = "lblname" + nextId.ToString();
            lblName.Text = "Process Name: ";
            lblName.CssClass = "col-md-2 control-label";

            txtName = new TextBox();
            txtName.ID = "txtName" + nextId.ToString();
            txtName.CssClass = "form-control";

            group.Controls.Add(new LiteralControl(HTML));
            group.Controls.Add(lblName);
            group.Controls.Add(txtName);

            HTML = "</div><div class =\"form-group\">";
            HTML = "</div><div class = \"form-group\">";

            lblDesc = new Label();
            lblDesc.ID = "lblDesc" + nextId.ToString();
            lblDesc.Text = "Process Description: ";
            lblDesc.CssClass = "col-md-2 control-label";

            txtDesc = new TextBox();
            txtDesc.ID = "txtDesc" + nextId.ToString();
            txtDesc.CssClass = "form-control";
       
            group.Controls.Add(new LiteralControl(HTML));
            group.Controls.Add(lblDesc);
            group.Controls.Add(txtDesc);

            HTML = "</div><div class = \"form-group\">";

            uploader = new FileUpload();
            uploader.ID = "imgUploader" + nextId.ToString();
            uploader.AllowMultiple = true;
            uploader.CssClass = "col-md-3";

            Button upload = new Button();
            upload.ID = "upload" + nextId.ToString();
            upload.CssClass = "btn btn-default";
            upload.Text = "Upload";
            upload.Click += new EventHandler(Upload_Click);

            group.Controls.Add(new LiteralControl(HTML));
            group.Controls.Add(uploader);
            group.Controls.Add(upload);

            HTML = "</div></div></div></div>";
            group.Controls.Add(new LiteralControl(HTML));
        }

        protected void Upload_Click(object sender, EventArgs e)
        {
            if (uploader.HasFile)
            {
                string ext = System.IO.Path.GetExtension(uploader.FileName);
                if (ext.ToLower() != ".gif" && ext.ToLower() != ".png" && ext.ToLower() != ".jpg" && ext.ToLower() != ".jpeg")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Invalid image format');", true);
                }
                else
                {
                    //specify the server folder path
                    string pathName = "IMG/" + Path.GetFileName(uploader.PostedFile.FileName);

                    string CS = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                            SqlCommand cmd = new SqlCommand("INSERT INTO materialMstr(materialName) VALUES ('" + pathName + "')", con);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            uploader.SaveAs(Server.MapPath("~/IMG/" + uploader.FileName));
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Image uploaded');", true);
                    }
                }
            }
            //else
            //{
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('No image present -.-');", true);
            //}
        }
    }
}