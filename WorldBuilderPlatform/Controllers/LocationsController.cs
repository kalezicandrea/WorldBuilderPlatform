using System;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WorldBuilderPlatform.Controllers
{
    public class LocationsController : Controller
    {
        private WorldBuilderPlatformDBEntities db = new WorldBuilderPlatformDBEntities();

        // GET: Locations/Create?universeId=1
        public ActionResult Create(int universeId)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var universe = db.Universes.FirstOrDefault(u => u.universe_id == universeId);

            if (universe == null)
            {
                return HttpNotFound();
            }

            int currentUserId = (int)Session["user_id"];
            bool isOwner = universe.owner_id == currentUserId;
            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            if (!isOwner && !isAdmin)
            {
                return RedirectToAction("Details", "Universes", new { id = universeId });
            }

            ViewBag.UniverseId = universeId;
            ViewBag.UniverseName = universe.name;

            return View();
        }

        // POST: Locations/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(int universeId, string name, string description, HttpPostedFileBase mainImage)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var universe = db.Universes.FirstOrDefault(u => u.universe_id == universeId);

            if (universe == null)
            {
                return HttpNotFound();
            }

            int currentUserId = (int)Session["user_id"];
            bool isOwner = universe.owner_id == currentUserId;
            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            if (!isOwner && !isAdmin)
            {
                return RedirectToAction("Details", "Universes", new { id = universeId });
            }

            if (string.IsNullOrWhiteSpace(name))
            {
                ViewBag.Error = "Location name is required.";
                ViewBag.UniverseId = universeId;
                ViewBag.UniverseName = universe.name;

                return View();
            }

            string mainImgUrl = null;

            if (mainImage != null && mainImage.ContentLength > 0)
            {
                string extension = Path.GetExtension(mainImage.FileName).ToLower();

                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".webp" };

                if (!allowedExtensions.Contains(extension))
                {
                    ViewBag.Error = "Only JPG, JPEG, PNG and WEBP images are allowed.";
                    ViewBag.UniverseId = universeId;
                    ViewBag.UniverseName = universe.name;

                    return View();
                }

                int maxFileSize = 5 * 1024 * 1024;

                if (mainImage.ContentLength > maxFileSize)
                {
                    ViewBag.Error = "Image size must be less than 5 MB.";
                    ViewBag.UniverseId = universeId;
                    ViewBag.UniverseName = universe.name;

                    return View();
                }

                string fileName = Guid.NewGuid().ToString() + extension;

                string folderPath = Server.MapPath("~/Content/Uploaded/Locations/");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string filePath = Path.Combine(folderPath, fileName);

                mainImage.SaveAs(filePath);

                mainImgUrl = "/Content/Uploaded/Locations/" + fileName;
            }

            var location = new Location
            {
                name = name,
                description = description,
                main_img_url = mainImgUrl,
                created_at = DateTime.Now,
                universe_id = universeId
            };

            db.Locations.Add(location);
            db.SaveChanges();

            return RedirectToAction("Details", "Universes", new { id = universeId });
        }

        public ActionResult Edit(int id)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var location = db.Locations.FirstOrDefault(l => l.location_id == id);

            if (location == null)
            {
                return HttpNotFound();
            }

            var universe = db.Universes.FirstOrDefault(u => u.universe_id == location.universe_id);

            int currentUserId = (int)Session["user_id"];
            bool isOwner = universe.owner_id == currentUserId;
            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            if (!isOwner && !isAdmin)
            {
                return RedirectToAction("Details", "Universes", new { id = location.universe_id });
            }

            return View(location);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, string name, string description, HttpPostedFileBase mainImage)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var location = db.Locations.FirstOrDefault(l => l.location_id == id);

            if (location == null)
            {
                return HttpNotFound();
            }

            var universe = db.Universes.FirstOrDefault(u => u.universe_id == location.universe_id);

            int currentUserId = (int)Session["user_id"];
            bool isOwner = universe.owner_id == currentUserId;
            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            if (!isOwner && !isAdmin)
            {
                return RedirectToAction("Details", "Universes", new { id = location.universe_id });
            }

            if (string.IsNullOrWhiteSpace(name))
            {
                ViewBag.Error = "Location name is required.";
                return View(location);
            }

            if (mainImage != null && mainImage.ContentLength > 0)
            {
                string extension = Path.GetExtension(mainImage.FileName).ToLower();
                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".webp" };

                if (!allowedExtensions.Contains(extension))
                {
                    ViewBag.Error = "Only JPG, JPEG, PNG and WEBP images are allowed.";
                    return View(location);
                }

                int maxFileSize = 5 * 1024 * 1024;

                if (mainImage.ContentLength > maxFileSize)
                {
                    ViewBag.Error = "Image size must be less than 5 MB.";
                    return View(location);
                }

                string fileName = Guid.NewGuid().ToString() + extension;
                string folderPath = Server.MapPath("~/Content/Uploaded/Locations/");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string filePath = Path.Combine(folderPath, fileName);
                mainImage.SaveAs(filePath);

                location.main_img_url = "/Content/Uploaded/Locations/" + fileName;
            }

            location.name = name;
            location.description = description;

            db.SaveChanges();

            return RedirectToAction("Details", "Universes", new { id = location.universe_id });
        }

        public ActionResult Delete(int id)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var location = db.Locations.FirstOrDefault(l => l.location_id == id);

            if (location == null)
            {
                return HttpNotFound();
            }

            var universe = db.Universes.FirstOrDefault(u => u.universe_id == location.universe_id);

            int currentUserId = (int)Session["user_id"];
            bool isOwner = universe.owner_id == currentUserId;
            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            if (!isOwner && !isAdmin)
            {
                return RedirectToAction("Details", "Universes", new { id = location.universe_id });
            }

            return View(location);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            var location = db.Locations.FirstOrDefault(l => l.location_id == id);

            if (location == null)
            {
                return HttpNotFound();
            }

            int universeId = location.universe_id;

            var universe = db.Universes.FirstOrDefault(u => u.universe_id == universeId);

            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            int currentUserId = (int)Session["user_id"];
            bool isOwner = universe.owner_id == currentUserId;
            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            if (!isOwner && !isAdmin)
            {
                return RedirectToAction("Details", "Universes", new { id = universeId });
            }

            db.Database.ExecuteSqlCommand(
                "DELETE FROM StorySegmentLocation WHERE location_id = @location_id",
                new SqlParameter("@location_id", id)
            );

            db.Locations.Remove(location);
            db.SaveChanges();

            return RedirectToAction("Details", "Universes", new { id = universeId });
        }

    }
}