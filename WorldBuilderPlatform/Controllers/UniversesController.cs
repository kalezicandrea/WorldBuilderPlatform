using System.Linq;
using System.Web.Mvc;

namespace WorldBuilderPlatform.Controllers
{
    public class UniversesController : Controller
    {
        private WorldBuilderPlatformDBEntities db = new WorldBuilderPlatformDBEntities();

        public ActionResult Details(int id)
        {
            var universe = db.Universes.FirstOrDefault(u => u.universe_id == id);

            if (universe == null)
            {
                return HttpNotFound();
            }

            bool isOwner = false;
            bool isAdmin = false;

            if (Session["user_id"] != null)
            {
                int currentUserId = (int)Session["user_id"];

                isOwner = universe.owner_id == currentUserId;
                isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;
            }

            ViewBag.IsOwner = isOwner;
            ViewBag.IsAdmin = isAdmin;

            return View(universe);
        }
    }
}