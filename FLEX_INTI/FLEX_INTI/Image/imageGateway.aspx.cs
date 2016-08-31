using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLEX_INTI
{
    public partial class imageGateway : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Sample link to use this gateway : [linktoasp.net]/Image/imageGateway?type=[png/jpeg]&source=[localimagelink]
            string source = Request.QueryString["source"];
            string type = Request.QueryString["type"];

            if ( type == "png" ) {
                Response.ContentType = "image/png";
            }
            else if( type=="gif" ) {
                Response.ContentType = "image/gif";
            } else if (type == "jpeg" || type =="jpg") {
                Response.ContentType = "image/jpeg";
            }
            
            string physicalFileName = source;
            try
            {
                Response.WriteFile(physicalFileName);
            }
            catch
            {
                Response.WriteFile("missingimage.png");
            }
        }
    }
}