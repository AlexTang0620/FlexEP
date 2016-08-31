using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLEX_INTI.Part_maintenance
{
    public partial class Process_Edit : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataSource = PartDataAccessLayer.GetAllParts();
                GridView1.DataBind();
                pnlPart.Visible = false;
                pnlMaterial.Visible = false;

                pnlEditPart.Visible = false;
                pnlEditMaterial.Visible = false;
                pnlEditProcess.Visible = false;
                pnlEditSpec.Visible = false;
            }
        }

        protected void editWhat_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (editWhat.SelectedValue == "part")
            {
                pnlMaterial.Visible = false;
                pnlPart.Visible = true;

                pnlEditPart.Visible = false;
                pnlEditMaterial.Visible = false;
                pnlEditProcess.Visible = false;
                pnlEditSpec.Visible = false;

            }
            else if (editWhat.SelectedValue == "material")
            {
                pnlPart.Visible = false;
                pnlMaterial.Visible = true;

                pnlEditPart.Visible = false;
                pnlEditMaterial.Visible = false;
                pnlEditProcess.Visible = false;
                pnlEditSpec.Visible = false;

            }
            else
            {
                pnlPart.Visible = false;
                pnlMaterial.Visible = false;

                pnlEditPart.Visible = false;
                pnlEditMaterial.Visible = false;
                pnlEditProcess.Visible = false;
                pnlEditSpec.Visible = false;
            }
        }

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
                int processID = Convert.ToInt32(GridView1.DataKeys[e.Row.RowIndex].Value.ToString());

                var gv2 = (GridView)e.Row.FindControl("GridView2");

                gv2.DataSource = ProcessDataAccessLayer.GetAllProcess(processID);
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
                int specID = Convert.ToInt32(procIDlbl.Text);

                gv3.DataSource = SpecificationDataAccessLayer.GetAllSpec(specID);
                gv3.DataBind();
            }

        }

        protected void editPart_Click(object sender, EventArgs e)
        {
            pnlEditPart.Visible = true;
            pnlEditMaterial.Visible = false;
            pnlEditProcess.Visible = false;
            pnlEditSpec.Visible = false;

        }


        protected void editProcess_Click(object sender, EventArgs e)
        {
            pnlEditPart.Visible = false;
            pnlEditMaterial.Visible = false;
            pnlEditProcess.Visible = true;
            pnlEditSpec.Visible = false;

        }

        protected void editSpec_Click(object sender, EventArgs e)
        {
            pnlEditPart.Visible = false;
            pnlEditMaterial.Visible = false;
            pnlEditProcess.Visible = false;
            pnlEditSpec.Visible = true;

        }

        protected void editMaterial_Click(object sender, EventArgs e)
        {
            //int rowIndex = GridView4.SelectedRow.RowIndex;

            pnlEditPart.Visible = false;
            pnlEditMaterial.Visible = true;
            pnlEditProcess.Visible = false;
            pnlEditSpec.Visible = false;
        }

        protected void save_Click(object sender, EventArgs e)
        {

        }

    }
}