using System;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WorldBuilderPlatform.Controllers
{
    public class WorldImagesController : Controller
    {
        private WorldBuilderPlatformDBEntities db = new WorldBuilderPlatformDBEntities();

        // GET: WorldImages/Create?universeId=1
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

        // POST: WorldImages/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(
            int universeId,
            string albumName,
            string albumDescription,
            string imageDescription,
            HttpPostedFileBase imageFile)
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

            if (string.IsNullOrWhiteSpace(albumName))
            {
                albumName = "Main Album";
            }

            if (imageFile == null || imageFile.ContentLength == 0)
            {
                ViewBag.Error = "Image file is required.";
                ViewBag.UniverseId = universeId;
                ViewBag.UniverseName = universe.name;

                return View();
            }

            string extension = Path.GetExtension(imageFile.FileName).ToLower();

            string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".webp" };

            if (!allowedExtensions.Contains(extension))
            {
                ViewBag.Error = "Only JPG, JPEG, PNG and WEBP images are allowed.";
                ViewBag.UniverseId = universeId;
                ViewBag.UniverseName = universe.name;

                return View();
            }

            int maxFileSize = 5 * 1024 * 1024;

            if (imageFile.ContentLength > maxFileSize)
            {
                ViewBag.Error = "Image size must be less than 5 MB.";
                ViewBag.UniverseId = universeId;
                ViewBag.UniverseName = universe.name;

                return View();
            }

            var album = db.Albums.FirstOrDefault(a =>
                a.universe_id == universeId &&
                a.name == albumName);

            if (album == null)
            {
                album = new Album
                {
                    name = albumName,
                    description = albumDescription,
                    created_at = DateTime.Now,
                    universe_id = universeId
                };

                db.Albums.Add(album);
                db.SaveChanges();
            }

            string fileName = Guid.NewGuid().ToString() + extension;

            string folderPath = Server.MapPath("~/Content/Uploaded/Albums/");

            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            string filePath = Path.Combine(folderPath, fileName);

            imageFile.SaveAs(filePath);

            string imgUrl = "/Content/Uploaded/Albums/" + fileName;

            var image = new WorldImage
            {
                img_url = imgUrl,
                description = imageDescription,
                created_at = DateTime.Now,
                album_id = album.album_id
            };

            db.WorldImages.Add(image);
            db.SaveChanges();

            return RedirectToAction("Details", "Universes", new { id = universeId });
        }

        public ActionResult Edit(int id)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var image = db.WorldImages.FirstOrDefault(i => i.image_id == id);

            if (image == null)
            {
                return HttpNotFound();
            }

            var album = db.Albums.FirstOrDefault(a => a.album_id == image.album_id);
            var universe = db.Universes.FirstOrDefault(u => u.universe_id == album.universe_id);

            int currentUserId = (int)Session["user_id"];
            bool isOwner = universe.owner_id == currentUserId;
            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            if (!isOwner && !isAdmin)
            {
                return RedirectToAction("Details", "Universes", new { id = universe.universe_id });
            }

            ViewBag.UniverseId = universe.universe_id;
            ViewBag.UniverseName = universe.name;
            ViewBag.AlbumName = album.name;
            ViewBag.AlbumDescription = album.description;

            return View(image);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(
            int id,
            string albumName,
            string albumDescription,
            string imageDescription,
            HttpPostedFileBase imageFile)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var image = db.WorldImages.FirstOrDefault(i => i.image_id == id);

            if (image == null)
            {
                return HttpNotFound();
            }

            var oldAlbum = db.Albums.FirstOrDefault(a => a.album_id == image.album_id);
            var universe = db.Universes.FirstOrDefault(u => u.universe_id == oldAlbum.universe_id);

            int currentUserId = (int)Session["user_id"];
            bool isOwner = universe.owner_id == currentUserId;
            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            if (!isOwner && !isAdmin)
            {
                return RedirectToAction("Details", "Universes", new { id = universe.universe_id });
            }

            if (string.IsNullOrWhiteSpace(albumName))
            {
                albumName = "Main Album";
            }

            var album = db.Albums.FirstOrDefault(a =>
                a.universe_id == universe.universe_id &&
                a.name == albumName);

            if (album == null)
            {
                album = new Album
                {
                    name = albumName,
                    description = albumDescription,
                    created_at = DateTime.Now,
                    universe_id = universe.universe_id
                };

                db.Albums.Add(album);
                db.SaveChanges();
            }
            else
            {
                album.description = albumDescription;
            }

            if (imageFile != null && imageFile.ContentLength > 0)
            {
                string extension = Path.GetExtension(imageFile.FileName).ToLower();
                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".webp" };

                if (!allowedExtensions.Contains(extension))
                {
                    ViewBag.Error = "Only JPG, JPEG, PNG and WEBP images are allowed.";
                    ViewBag.UniverseId = universe.universe_id;
                    ViewBag.UniverseName = universe.name;
                    ViewBag.AlbumName = albumName;
                    ViewBag.AlbumDescription = albumDescription;

                    return View(image);
                }

                int maxFileSize = 5 * 1024 * 1024;

                if (imageFile.ContentLength > maxFileSize)
                {
                    ViewBag.Error = "Image size must be less than 5 MB.";
                    ViewBag.UniverseId = universe.universe_id;
                    ViewBag.UniverseName = universe.name;
                    ViewBag.AlbumName = albumName;
                    ViewBag.AlbumDescription = albumDescription;

                    return View(image);
                }

                string fileName = Guid.NewGuid().ToString() + extension;
                string folderPath = Server.MapPath("~/Content/Uploaded/Albums/");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string filePath = Path.Combine(folderPath, fileName);
                imageFile.SaveAs(filePath);

                image.img_url = "/Content/Uploaded/Albums/" + fileName;
            }

            image.description = imageDescription;
            image.album_id = album.album_id;

            db.SaveChanges();

            return RedirectToAction("Details", "Universes", new { id = universe.universe_id });
        }

        public ActionResult Delete(int id)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var image = db.WorldImages.FirstOrDefault(i => i.image_id == id);

            if (image == null)
            {
                return HttpNotFound();
            }

            var album = db.Albums.FirstOrDefault(a => a.album_id == image.album_id);
            var universe = db.Universes.FirstOrDefault(u => u.universe_id == album.universe_id);

            int currentUserId = (int)Session["user_id"];
            bool isOwner = universe.owner_id == currentUserId;
            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            if (!isOwner && !isAdmin)
            {
                return RedirectToAction("Details", "Universes", new { id = universe.universe_id });
            }

            ViewBag.UniverseId = universe.universe_id;

            return View(image);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            var image = db.WorldImages.FirstOrDefault(i => i.image_id == id);

            if (image == null)
            {
                return HttpNotFound();
            }

            var album = db.Albums.FirstOrDefault(a => a.album_id == image.album_id);
            int universeId = album.universe_id;

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
                "DELETE FROM StorySegmentWorldImage WHERE image_id = @image_id",
                new SqlParameter("@image_id", id)
            );

            db.WorldImages.Remove(image);
            db.SaveChanges();

            return RedirectToAction("Details", "Universes", new { id = universeId });
        }

    }
}