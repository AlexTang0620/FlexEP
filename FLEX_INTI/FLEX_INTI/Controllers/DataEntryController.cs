using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FLEX_INTI.Controllers
{
    public class DataEntryController : Controller
    {
        // GET: DataEntry
        public ActionResult Index()
        {
            if (Request.IsAuthenticated)
                Session["NotAuthorized"] = "False";
            else
            {
                Session["NotAuthorized"] = "True";
                return RedirectToAction("LogOn", "Account");
            }

            return View();
        }
    }
}