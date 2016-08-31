using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FLEX_INTI.Models; //applicationDbContext
using Microsoft.AspNet.Identity;  //rolestore, identity result, user manager
using Microsoft.AspNet.Identity.EntityFramework; //identity role

namespace FLEX_INTI.Maintenance
{
    public partial class User : System.Web.UI.Page
    {
      

        protected void Page_Load(object sender, EventArgs e)
        {
            extra_UserGroup.Visible = false;

            //extra_UserGroup2.Visible = false;
            //  radio_extra.Visible = false;

        }

        protected void CreateUser(object sender, EventArgs e)
        {
            // Access the application context and create result variables.
            ApplicationDbContext context = new ApplicationDbContext();
            //IdentityResult IdRoleResult;
            IdentityResult IdUserResults;

            // Create a RoleStore object by using the ApplicationDbContext object. 
            // The RoleStore is only allowed to contain IdentityRole objects.
            //var roleStore = new RoleStore<IdentityRole>(context);

            // Create a RoleManager object that is only allowed to contain IdentityRole objects.
            // When creating the RoleManager object, you pass in (as a parameter) a new RoleStore object. 
            //var roleMgr = new RoleManager<IdentityRole>(roleStore);

            //if (!roleMgr.RoleExists("Super Admin"))
            //{
            //    IdRoleResult = roleMgr.Create(new IdentityRole { Name = "Super Admin" });
            //}
            //if (!roleMgr.RoleExists("Supervisor"))
            //{
            //    IdRoleResult = roleMgr.Create(new IdentityRole { Name = "Supervisor" });
            //}
            //if (!roleMgr.RoleExists("QC Operator"))
            //{
            //    IdRoleResult = roleMgr.Create(new IdentityRole { Name = "QC Operator" });
            //}
            //if (!roleMgr.RoleExists("Technician"))
            //{
            //    IdRoleResult = roleMgr.Create(new IdentityRole { Name = "Technician" });
            //}

            // Create a UserManager object based on the UserStore object and the ApplicationDbContext  
            // object. 

            if (radio_Technician.Checked || radio_qcOperator.Checked || radio_Supervisor.Checked || radio_Admin.Checked)
            {

                var userMgr = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
                var appUser = new ApplicationUser
                {
                    UserName = Email.Text,
                    Email = Email.Text
                };
                IdUserResults = userMgr.Create(appUser, Password.Text);


                if (radio_Technician.Checked)
                {
                    // If the new user was successfully created, 


                    if (!userMgr.IsInRole(userMgr.FindByEmail(Email.Text).Id, "Technician"))
                    {
                        // add the user to the role. 
                        IdUserResults = userMgr.AddToRole(userMgr.FindByEmail(Email.Text).Id, "Technician");
                    }
                }
                else if (radio_qcOperator.Checked)
                {
                    if (!userMgr.IsInRole(userMgr.FindByEmail(Email.Text).Id, "QC Operator"))
                    {
                        IdUserResults = userMgr.AddToRole(userMgr.FindByEmail(Email.Text).Id, "QC Operator");
                    }
                }
                else if (radio_Supervisor.Checked)
                {
                    if (!userMgr.IsInRole(userMgr.FindByEmail(Email.Text).Id, "Supervisor"))
                    {
                        IdUserResults = userMgr.AddToRole(userMgr.FindByEmail(Email.Text).Id, "Supervisor");
                    }
                }
                else if (radio_Admin.Checked)
                {
                    if (!userMgr.IsInRole(userMgr.FindByEmail(Email.Text).Id, "Super Admin"))
                    {
                        IdUserResults = userMgr.AddToRole(userMgr.FindByEmail(Email.Text).Id, "Super Admin");
                    }
                }
            }
            else if(!radio_Technician.Checked && !radio_qcOperator.Checked && !radio_Supervisor.Checked && !radio_Admin.Checked)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please chooose one of the the User Group Options');", true);
            }
        }
        
    }
}