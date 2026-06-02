using System;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WorldBuilderPlatform.Controllers
{
    public class UniversesController : Controller
    {
        private WorldBuilderPlatformDBEntities db = new WorldBuilderPlatformDBEntities();

        private bool CanEditUniverse(Universe universe)
        {
            if (Session["user_id"] == null || universe == null)
            {
                return false;
            }

            int currentUserId = (int)Session["user_id"];

            bool isOwner = universe.owner_id == currentUserId;
            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            return isOwner || isAdmin;
        }

        private void SaveUniverseTags(int universeId, string tagsText)
        {
            var universe = db.Universes.FirstOrDefault(u => u.universe_id == universeId);

            if (universe == null)
            {
                return;
            }

            if (string.IsNullOrWhiteSpace(tagsText))
            {
                return;
            }

            var tagNames = tagsText
                .Split(',')
                .Select(t => t.Trim())
                .Where(t => !string.IsNullOrWhiteSpace(t))
                .Distinct()
                .ToList();

            foreach (var tagName in tagNames)
            {
                var tag = db.Tags.FirstOrDefault(t => t.name == tagName);

                if (tag == null)
                {
                    tag = new Tag
                    {
                        name = tagName
                    };

                    db.Tags.Add(tag);
                    db.SaveChanges();
                }

                bool alreadyConnected = universe.Tags.Any(t => t.tag_id == tag.tag_id);

                if (!alreadyConnected)
                {
                    universe.Tags.Add(tag);
                    db.SaveChanges();
                }
            }
        }

        private string GetUniverseTagsText(int universeId)
        {
            var universe = db.Universes.FirstOrDefault(u => u.universe_id == universeId);

            if (universe == null)
            {
                return "";
            }

            var tags = universe.Tags
                .Select(t => t.name)
                .ToList();

            return string.Join(", ", tags);
        }

        public ActionResult Details(int id)
        {
            var universe = db.Universes.FirstOrDefault(u => u.universe_id == id);

            if (universe == null)
            {
                return HttpNotFound();
            }

            bool isOwner = false;
            bool isAdmin = false;
            bool isFavorite = false;
            bool canReview = false;
            bool alreadyReviewed = false;

            if (Session["user_id"] != null)
            {
                int currentUserId = (int)Session["user_id"];

                isOwner = universe.owner_id == currentUserId;
                isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

                isFavorite = db.FavoriteUniverses.Any(f =>
                    f.user_id == currentUserId &&
                    f.universe_id == id);

                alreadyReviewed = db.Reviews.Any(r =>
                    r.user_id == currentUserId &&
                    r.universe_id == id);

                canReview = !isOwner && !alreadyReviewed;
            }
            else
            {
                isAdmin = false;
                isOwner = false;
            }

            if (universe.visibility == "private" && !isOwner && !isAdmin)
            {
                return RedirectToAction("Index", "Home");
            }

            ViewBag.IsOwner = isOwner;
            ViewBag.IsAdmin = isAdmin;
            ViewBag.IsFavorite = isFavorite;
            ViewBag.CanReview = canReview;
            ViewBag.AlreadyReviewed = alreadyReviewed;

            ViewBag.StorySegments = db.StorySegments
                .Where(s => s.universe_id == id)
                .OrderBy(s => s.order_index)
                .ToList();

            ViewBag.Characters = db.Characters
                .Where(c => c.universe_id == id)
                .ToList();

            ViewBag.Locations = db.Locations
                .Where(l => l.universe_id == id)
                .ToList();

            ViewBag.Albums = db.Albums
                .Where(a => a.universe_id == id)
                .ToList();

            ViewBag.CharacterRelationships = db.CharacterRelationships
                .Where(r => r.Character.universe_id == id && r.Character1.universe_id == id)
                .ToList();

            ViewBag.Tags = GetUniverseTagsText(id);

            ViewBag.Reviews = db.Reviews
                .Where(r => r.universe_id == id)
                .OrderByDescending(r => r.created_at)
                .ToList();

            ViewBag.AverageRating = db.Database.SqlQuery<decimal>(
                "SELECT dbo.fn_GetAverageUniverseRating(@universe_id)",
                new System.Data.SqlClient.SqlParameter("@universe_id", id)
            ).FirstOrDefault();

            return View(universe);
        }

        public ActionResult Create()
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(string name, string description, string visibility, string tagsText, HttpPostedFileBase coverImage)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            if (string.IsNullOrWhiteSpace(name))
            {
                ViewBag.Error = "Universe name is required.";
                return View();
            }

            if (visibility != "public" && visibility != "private")
            {
                visibility = "private";
            }

            string coverImgUrl = null;

            if (coverImage != null && coverImage.ContentLength > 0)
            {
                string extension = Path.GetExtension(coverImage.FileName).ToLower();

                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".webp" };

                if (!allowedExtensions.Contains(extension))
                {
                    ViewBag.Error = "Only JPG, JPEG, PNG and WEBP images are allowed.";
                    return View();
                }

                int maxFileSize = 5 * 1024 * 1024;

                if (coverImage.ContentLength > maxFileSize)
                {
                    ViewBag.Error = "Image size must be less than 5 MB.";
                    return View();
                }

                string fileName = Guid.NewGuid().ToString() + extension;

                string folderPath = Server.MapPath("~/Content/Uploaded/Universes/");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string filePath = Path.Combine(folderPath, fileName);
                coverImage.SaveAs(filePath);

                coverImgUrl = "/Content/Uploaded/Universes/" + fileName;
            }

            int currentUserId = (int)Session["user_id"];

            var universe = new Universe
            {
                name = name,
                description = description,
                visibility = visibility,
                cover_img_url = coverImgUrl,
                created_at = DateTime.Now,
                owner_id = currentUserId
            };

            db.Universes.Add(universe);
            db.SaveChanges();

            SaveUniverseTags(universe.universe_id, tagsText);

            return RedirectToAction("Details", "Universes", new { id = universe.universe_id });
        }

        public ActionResult Edit(int id)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var universe = db.Universes.FirstOrDefault(u => u.universe_id == id);

            if (universe == null)
            {
                return HttpNotFound();
            }

            if (!CanEditUniverse(universe))
            {
                return RedirectToAction("Details", "Universes", new { id = id });
            }

            ViewBag.TagsText = GetUniverseTagsText(id);

            return View(universe);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, string name, string description, string visibility, string tagsText, HttpPostedFileBase coverImage)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var universe = db.Universes.FirstOrDefault(u => u.universe_id == id);

            if (universe == null)
            {
                return HttpNotFound();
            }

            if (!CanEditUniverse(universe))
            {
                return RedirectToAction("Details", "Universes", new { id = id });
            }

            if (string.IsNullOrWhiteSpace(name))
            {
                ViewBag.Error = "Universe name is required.";
                ViewBag.TagsText = tagsText;
                return View(universe);
            }

            if (visibility != "public" && visibility != "private")
            {
                visibility = "private";
            }

            if (coverImage != null && coverImage.ContentLength > 0)
            {
                string extension = Path.GetExtension(coverImage.FileName).ToLower();

                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".webp" };

                if (!allowedExtensions.Contains(extension))
                {
                    ViewBag.Error = "Only JPG, JPEG, PNG and WEBP images are allowed.";
                    ViewBag.TagsText = tagsText;
                    return View(universe);
                }

                int maxFileSize = 5 * 1024 * 1024;

                if (coverImage.ContentLength > maxFileSize)
                {
                    ViewBag.Error = "Image size must be less than 5 MB.";
                    ViewBag.TagsText = tagsText;
                    return View(universe);
                }

                string fileName = Guid.NewGuid().ToString() + extension;

                string folderPath = Server.MapPath("~/Content/Uploaded/Universes/");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string filePath = Path.Combine(folderPath, fileName);
                coverImage.SaveAs(filePath);

                universe.cover_img_url = "/Content/Uploaded/Universes/" + fileName;
            }

            universe.name = name;
            universe.description = description;
            universe.visibility = visibility;

            universe.Tags.Clear();
            db.SaveChanges();

            SaveUniverseTags(id, tagsText);

            db.SaveChanges();

            return RedirectToAction("Details", "Universes", new { id = universe.universe_id });
        }

        public ActionResult Delete(int id)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var universe = db.Universes.FirstOrDefault(u => u.universe_id == id);

            if (universe == null)
            {
                return HttpNotFound();
            }

            if (!CanEditUniverse(universe))
            {
                return RedirectToAction("Details", "Universes", new { id = id });
            }

            return View(universe);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var universe = db.Universes.FirstOrDefault(u => u.universe_id == id);

            if (universe == null)
            {
                return HttpNotFound();
            }

            if (!CanEditUniverse(universe))
            {
                return RedirectToAction("Details", "Universes", new { id = id });
            }

            db.Database.ExecuteSqlCommand(
                @"
                DELETE FROM StorySegmentWorldImage
                WHERE segment_id IN (
                    SELECT segment_id FROM StorySegment WHERE universe_id = @universe_id
                );

                DELETE FROM CharacterStorySegment
                WHERE segment_id IN (
                    SELECT segment_id FROM StorySegment WHERE universe_id = @universe_id
                );

                DELETE FROM CharacterStorySegment
                WHERE character_id IN (
                    SELECT character_id FROM Characters WHERE universe_id = @universe_id
                );

                DELETE FROM StorySegmentLocation
                WHERE segment_id IN (
                    SELECT segment_id FROM StorySegment WHERE universe_id = @universe_id
                );

                DELETE FROM StorySegmentLocation
                WHERE location_id IN (
                    SELECT location_id FROM Location WHERE universe_id = @universe_id
                );

                DELETE FROM CharacterRelationship
                WHERE character_id_1 IN (
                    SELECT character_id FROM Characters WHERE universe_id = @universe_id
                )
                OR character_id_2 IN (
                    SELECT character_id FROM Characters WHERE universe_id = @universe_id
                );

                DELETE FROM WorldImage
                WHERE album_id IN (
                    SELECT album_id FROM Album WHERE universe_id = @universe_id
                );

                DELETE FROM Album WHERE universe_id = @universe_id;
                DELETE FROM Review WHERE universe_id = @universe_id;
                DELETE FROM FavoriteUniverse WHERE universe_id = @universe_id;
                DELETE FROM UniverseTag WHERE universe_id = @universe_id;
                DELETE FROM StorySegment WHERE universe_id = @universe_id;
                DELETE FROM Characters WHERE universe_id = @universe_id;
                DELETE FROM Species WHERE universe_id = @universe_id;
                DELETE FROM Location WHERE universe_id = @universe_id;
                DELETE FROM Universe WHERE universe_id = @universe_id;
                ",
                new SqlParameter("@universe_id", id)
            );

            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddToFavorites(int id)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            int currentUserId = (int)Session["user_id"];

            db.Database.ExecuteSqlCommand(
                "EXEC sp_AddFavoriteUniverse @user_id, @universe_id",
                new SqlParameter("@user_id", currentUserId),
                new SqlParameter("@universe_id", id)
            );

            return RedirectToAction("Details", "Universes", new { id = id });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult RemoveFromFavorites(int id)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            int currentUserId = (int)Session["user_id"];

            var favorite = db.FavoriteUniverses.FirstOrDefault(f =>
                f.user_id == currentUserId &&
                f.universe_id == id);

            if (favorite != null)
            {
                db.FavoriteUniverses.Remove(favorite);
                db.SaveChanges();
            }

            return RedirectToAction("Details", "Universes", new { id = id });
        }
    }
}