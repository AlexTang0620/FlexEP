 using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//namespace Flex.Part_maintenance
namespace FLEX_INTI.Part_maintenance
{
    public partial class Process_Edit : System.Web.UI.Page
    {
        FLEX_INTI.DataAccess da = new FLEX_INTI.DataAccess();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //GridView1.DataSource = PartDataAccessLayer.GetAllParts();

                //GridView1.DataBind();

            }
        }

        protected string getMaterial(object id)
        {
            FLEX_INTI.DataAccess da = new FLEX_INTI.DataAccess();
            string materialID = id.ToString();

            string sql = @"SELECT materialName FROM materialMstr WHERE materialID = '"+materialID+"'";
            DataTable dt = da.GetData(sql);
            
            return dt.Rows[0]["materialName"].ToString();
        }

        //protected void getImage(object id)
        //{
        //    FLEX_INTI.DataAccess da = new FLEX_INTI.DataAccess();
        //    int partID = Convert.ToInt32((GridView1.SelectedRow.FindControl("lblpartID") as Label).Text);
        //    string processID = id.ToString();
        //    Panel imgpnl = GridView1.SelectedRow.FindControl("imgPnl") as Panel;

        //    string sql = @"SELECT processImage FROM processMstr WHERE partID = '" + partID + "', processID='"+processID+"'";
        //    DataTable dt = da.GetData(sql);

        //    int totalimg = dt.Rows.Count;
        //    string HTML;

        //    for (int i = 0; i < totalimg; i++) {
        //        HTML = "<a href = \"" + dt.Rows[i]["processImage"].ToString() +"\">" + dt.Rows[i]["processImage"].ToString() + "</a>";
        //        imgpnl.Controls.Add(new LiteralControl(HTML));
        //    }
        //}

        public String MyNewRow(object Id)
        {
            /* 
                * 1. Close current cell in our example phone </TD>
                * 2. Close Current Row </TR>
                * 3. Cretae new Row with ID and class <TR id='...' style='...'>
                * 4. Create blank cell <TD></TD>
                * 5. Create new cell to contain the grid <TD>
                * 6. Finall grid will close its own row
                ************************************************************/
            return String.Format(@"</td></tr><tr id ='tr{0}'>
               <td></td><td colspan='100' style='padding:0px; margin:0px;'>", Id);
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {			
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //int processID = Convert.ToInt32(GridView1.DataKeys[e.Row.RowIndex].Value.ToString());
                Label ptID = (Label)e.Row.FindControl("lblpartID");
                int partID = Convert.ToInt32(ptID.Text);
                var gv2 = (GridView)e.Row.FindControl("GridView2");

                string sql = @"SELECT * FROM processMstr WHERE partID = '" + partID + "'";
                DataTable dt = da.GetData(sql);

                //gv2.DataSource = ProcessDataAccessLayer.GetAllProcess(partID);
                gv2.DataSource = dt;

                gv2.DataBind();
            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label procIDlbl = (Label)e.Row.FindControl("procID_lbl");
                //int specID = Convert.ToInt32(gv2.DataKeys[e.Row.RowIndex].Value.ToString());
                var gv3 = (GridView)e.Row.FindControl("GridView3");
                int procID = Convert.ToInt32(procIDlbl.Text);

                gv3.DataSource = SpecificationDataAccessLayer.GetAllSpec(procID);
                gv3.DataBind();
            }

        }

        protected void save_Click(object sender, EventArgs e)
        {

        }

        protected void btnRetrieve_Click(object sender, EventArgs e)
        {
            string sql;
            FLEX_INTI.DataAccess da = new FLEX_INTI.DataAccess();
            DataTable dt;

            switch (Convert.ToInt32(filterBy.SelectedValue))
            {
                case 0:
                    sql = @"SELECT * FROM partMstr WHERE partNumber = '"+ txtboxFilter.Text+ "'";
                    dt = da.GetData(sql);
                    GridView1.DataSource = dt;
                    ViewState["filterGV"] = dt;
                    break;

            }

            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView gv1 = sender as GridView;
            GridViewRow row = gv1.Rows[e.NewEditIndex];
            int partID = Convert.ToInt32((row.Cells[1].FindControl("lblpartID") as Label).Text);
            GridView1.EditIndex = e.NewEditIndex;

            //GridView1.DataSource = ViewState["filterGV"];
            //GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var partID = GridView1.DataKeys[e.RowIndex].Value;
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            TextBox txtPartNum = (TextBox)row.FindControl("editPartNum");
            TextBox txtPartName = (TextBox)row.FindControl("editPartName");
            TextBox txtMaterial = (TextBox)row.FindControl("editMaterial");
            FLEX_INTI.DataAccess da = new FLEX_INTI.DataAccess();


            string sql = @"UPDATE partMstr SET partNumber = '"+txtPartNum.Text+"', partName = '"+txtPartName.Text+"' WHERE partID = '"+partID+"'";
            da.SaveData(sql);

            GridView1.EditIndex = -1;
            //GridView1.DataSource = da.GetData(@"SELECT * FROM partMstr WHERE partNumber = '" + txtPartNum.Text + "'");
            //GridView1.DataBind();
        }

        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //GridView gv2 = sender as GridView;
            //GridViewRow row = gv2.Rows[e.NewEditIndex];
            GridViewRow row = (GridViewRow)GridView1.Rows[e.NewEditIndex];
            var gv2 = (GridView)row.FindControl("GridView2");

            //int partID = Convert.ToInt32((row.Cells[1].FindControl("lblpartID") as Label).Text);
            GridView1.EditIndex = e.NewEditIndex;

        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            var gv2 = (GridView)row.FindControl("GridView2");

            gv2.EditIndex = -1;

        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
        }
    }
}