using System;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Mvc;

namespace WorldBuilderPlatform.Controllers
{
    public class StorySegmentsController : Controller
    {
        private WorldBuilderPlatformDBEntities db = new WorldBuilderPlatformDBEntities();

        // GET: StorySegments/Create?universeId=1
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

        // POST: StorySegments/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(int universeId, string title, string content)
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

            if (string.IsNullOrWhiteSpace(title))
            {
                ViewBag.Error = "Story segment title is required.";
                ViewBag.UniverseId = universeId;
                ViewBag.UniverseName = universe.name;

                return View();
            }

            int nextOrderIndex = 1;

            var lastOrderIndex = db.StorySegments
                .Where(s => s.universe_id == universeId)
                .Select(s => (int?)s.order_index)
                .Max();

            if (lastOrderIndex != null)
            {
                nextOrderIndex = lastOrderIndex.Value + 1;
            }

            var storySegment = new StorySegment
            {
                title = title,
                content = content,
                created_at = DateTime.Now,
                order_index = nextOrderIndex,
                universe_id = universeId
            };

            db.StorySegments.Add(storySegment);
            db.SaveChanges();

            return RedirectToAction("Details", "Universes", new { id = universeId });
        }

        public ActionResult Edit(int id)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var segment = db.StorySegments.FirstOrDefault(s => s.segment_id == id);

            if (segment == null)
            {
                return HttpNotFound();
            }

            var universe = db.Universes.FirstOrDefault(u => u.universe_id == segment.universe_id);

            int currentUserId = (int)Session["user_id"];
            bool isOwner = universe.owner_id == currentUserId;
            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            if (!isOwner && !isAdmin)
            {
                return RedirectToAction("Details", "Universes", new { id = segment.universe_id });
            }

            ViewBag.UniverseId = segment.universe_id;
            ViewBag.UniverseName = universe.name;

            return View(segment);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, string title, string content)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var segment = db.StorySegments.FirstOrDefault(s => s.segment_id == id);

            if (segment == null)
            {
                return HttpNotFound();
            }

            var universe = db.Universes.FirstOrDefault(u => u.universe_id == segment.universe_id);

            int currentUserId = (int)Session["user_id"];
            bool isOwner = universe.owner_id == currentUserId;
            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            if (!isOwner && !isAdmin)
            {
                return RedirectToAction("Details", "Universes", new { id = segment.universe_id });
            }

            if (string.IsNullOrWhiteSpace(title))
            {
                ViewBag.Error = "Story segment title is required.";
                ViewBag.UniverseId = segment.universe_id;
                ViewBag.UniverseName = universe.name;
                return View(segment);
            }

            segment.title = title;
            segment.content = content;

            db.SaveChanges();

            return RedirectToAction("Details", "Universes", new { id = segment.universe_id });
        }

        public ActionResult Delete(int id)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var segment = db.StorySegments.FirstOrDefault(s => s.segment_id == id);

            if (segment == null)
            {
                return HttpNotFound();
            }

            var universe = db.Universes.FirstOrDefault(u => u.universe_id == segment.universe_id);

            int currentUserId = (int)Session["user_id"];
            bool isOwner = universe.owner_id == currentUserId;
            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            if (!isOwner && !isAdmin)
            {
                return RedirectToAction("Details", "Universes", new { id = segment.universe_id });
            }

            return View(segment);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            var segment = db.StorySegments.FirstOrDefault(s => s.segment_id == id);

            if (segment == null)
            {
                return HttpNotFound();
            }

            int universeId = segment.universe_id;

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
                "DELETE FROM StorySegmentWorldImage WHERE segment_id = @segment_id",
                new SqlParameter("@segment_id", id)
            );

            db.Database.ExecuteSqlCommand(
                "DELETE FROM CharacterStorySegment WHERE segment_id = @segment_id",
                new SqlParameter("@segment_id", id)
            );

            db.Database.ExecuteSqlCommand(
                "DELETE FROM StorySegmentLocation WHERE segment_id = @segment_id",
                new SqlParameter("@segment_id", id)
            );

            db.StorySegments.Remove(segment);
            db.SaveChanges();

            return RedirectToAction("Details", "Universes", new { id = universeId });
        }

    }
}