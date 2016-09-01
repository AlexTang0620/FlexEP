using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;  //stringbuilder

namespace FLEX_INTI.Maintenance
{
    public partial class ProfileMaintenance : System.Web.UI.Page
    {
        //To show message after performing operations
        //void Popup(bool isDisplay)
        //{
        //    StringBuilder builder = new StringBuilder();
        //    if (isDisplay)
        //    {
        //        builder.Append("<script language=JavaScript> ShowPopup(); </script>\n");
        //        Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowPopup", builder.ToString());
        //    }
        //    else
        //    {
        //        builder.Append("<script language=JavaScript> HidePopup(); </script>\n");
        //        Page.ClientScript.RegisterStartupScript(this.GetType(), "HidePopup", builder.ToString());
        //    }
        //}
        private void fill_gvProfileMaintenance()
        {
            //DataReader is limited to being read-only and forward-only.
            //SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            //SqlCommand getUserDetails = new SqlCommand("SELECT A.UserName, C.Name FROM aspnetUsers A LEFT JOIN AspNetUserRoles B ON A.Id = B.UserId LEFT JOIN ASPNETROLES C ON B.ROLEID = C.Id");
            //SqlDataAdapter da = new SqlDataAdapter(getUserDetails);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            //gv_ProfileMaintenance.DataSource = dt;
            //gv_ProfileMaintenance.DataBind();
            //sqlConn.Close();

            DataAccess DA = new DataAccess();
            string SQL = "SELECT A.UserName, C.Name FROM aspnetUsers A LEFT JOIN AspNetUserRoles B ON A.Id = B.UserId LEFT JOIN ASPNETROLES C ON B.ROLEID = C.Id";

            DataTable dt = DA.GetData(SQL);

            gv_ProfileMaintenance.DataSource = dt;
            gv_ProfileMaintenance.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                //   fill_gvProfileMaintenance();

                //   gv_ProfileMaintenance.Columns[0].HeaderStyle.HorizontalAlign = HorizontalAlign.Center;


            }


        }
        private bool UpdateWasClicked = false;


        protected void Update_Click(object sender, EventArgs e)
        {
            UpdateWasClicked = false;


        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            UpdateWasClicked = true;
            string username = (sender as LinkButton).CommandArgument;  //getting username

            //if (UpdateWasClicked)
            //{
            if (radio_Technician.Checked || radio_qcOperator.Checked || radio_Supervisor.Checked || radio_Admin.Checked)
            {
                var role = (Control)sender;

                GridViewRow row = (GridViewRow)role.NamingContainer;
                string getrolecell = row.Cells[1].Text; // here we are

                DataAccess DA = new DataAccess();
                //DELETE ROLE!
                DA.SaveData("DELETE FROM AspNetUserRoles WHERE USERID IN(select id from AspNetUsers where username = '" + username + "') AND ROLEID IN(select id from AspNetRoles where name = '" + getrolecell + "')");

                if (radio_Technician.Checked)
                {
                    DA.SaveData("insert into AspNetUserRoles values((select id from AspNetUsers where username = '" + username + "'),(select id from AspNetRoles where name = 'Technician')");
                }
                else if (radio_qcOperator.Checked)
                {
                    DA.SaveData("insert into AspNetUserRoles values((select id from AspNetUsers where username = '" + username + "'),(select id from AspNetRoles where name = 'QC Operator')");

                }
                else if (radio_Supervisor.Checked)
                {
                    DA.SaveData("insert into AspNetUserRoles values((select id from AspNetUsers where username = '" + username + "'),(select id from AspNetRoles where name = 'Supervisor')");
                }
                else if (radio_Admin.Checked)
                {
                    DA.SaveData("insert into AspNetUserRoles values((select id from AspNetUsers where username = '" + username + "'),(select id from AspNetRoles where name = 'Super Admin')");
                }

                fill_gvProfileMaintenance();
            }
            else if (!radio_Technician.Checked && !radio_qcOperator.Checked && !radio_Supervisor.Checked && !radio_Admin.Checked)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please Select A Role');", true);
            }
                //}
            //}
        }

        

        protected void CreateUser(object sender, EventArgs e)
        {
            Response.Redirect("~/Maintenance/User.aspx");
        }



        //protected void gv_ProfileMaintenance_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    //if (e.CommandName.Equals("Edit"))
        //    //{
        //    //    string QueryString = "val";
        //    //    Page.ClientScript.RegisterStartupScript(GetType(), "", "window.open('User.aspx?QS=" + QueryString + "','','width=500,height=500');", true);
        //    //}
        //}

        //protected void btnRefresh_Click(object sender, EventArgs e)
        //{
        //    gv_ProfileMaintenance.DataBind();
        //}

        //protected void btnUpdate_Click(object sender, EventArgs e)
        //{

        //}

        //protected void gv_ProfileMaintenance_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    //if (e.CommandName == "sendInvite")
        //    //{
        //    //    int index = Convert.ToInt32(e.CommandArgument);
        //    //GridViewRow row = grdCreateGroup.Rows[index];

        //    //      Button b = (Button)row.FindControl("btnSendInvite");
        //    //       b.Text = row.Cells[0].Text;

        //    //}
        //}

        //protected void gv_ProfileMaintenance_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //if (e.CommandName == "Update")
        //{
        //    int index = Convert.ToInt32(e.CommandArgument);
        //    GridViewRow row = gv_ProfileMaintenance.Rows[index];

        //    Button b = (Button)row.FindControl("btnUpdate");
        //    b.Text = row.Cells[0].Text;

        //    // RadioButton rb = (RadioButton)sender;
        //    //  GridViewRow row = (GridViewRow)rb.NamingContainer;
        //    //if (((RadioButton)row.FindControl("RadioButton1")).Checked)
        //    // {

        //    // }

        //    //foreach (GridViewRow item in gv_ProfileMaintenance.)
        //    //{
        //    //    RadioButton radioButton = (RadioButton)item.FindControl("RadioButton1");
        //    //}

        //    for (int i = 0; i < gv_ProfileMaintenance.Rows.Count; i++)
        //    {

        //        //RadioButton rb = (gv_ProfileMaintenance.Rows[i].FindControl("MyRadioButton") as RadioButton);

        //        // it will create the object for the radiobutton in  that row index .. then u can access it like normal radiobutton.






        //    }

        //  }

        //}

    }
    
}