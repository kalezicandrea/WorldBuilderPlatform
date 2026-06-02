using System;
using System.Linq;
using System.Web.Mvc;

namespace WorldBuilderPlatform.Controllers
{
    public class ReviewsController : Controller
    {
        private WorldBuilderPlatformDBEntities db = new WorldBuilderPlatformDBEntities();

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(int universeId, byte rating, string comment)
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

            if (universe.owner_id == currentUserId)
            {
                TempData["ReviewError"] = "You cannot review your own universe.";
                return RedirectToAction("Details", "Universes", new { id = universeId });
            }

            if (rating < 1 || rating > 5)
            {
                TempData["ReviewError"] = "Rating must be between 1 and 5.";
                return RedirectToAction("Details", "Universes", new { id = universeId });
            }

            bool alreadyReviewed = db.Reviews.Any(r =>
                r.universe_id == universeId &&
                r.user_id == currentUserId);

            if (alreadyReviewed)
            {
                TempData["ReviewError"] = "You have already reviewed this universe.";
                return RedirectToAction("Details", "Universes", new { id = universeId });
            }

            var review = new Review
            {
                universe_id = universeId,
                user_id = currentUserId,
                rating = rating,
                text = comment,
                created_at = DateTime.Now
            };

            db.Reviews.Add(review);
            db.SaveChanges();

            return RedirectToAction("Details", "Universes", new { id = universeId });
        }

        public ActionResult Delete(int id)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var review = db.Reviews.FirstOrDefault(r => r.review_id == id);

            if (review == null)
            {
                return HttpNotFound();
            }

            int currentUserId = (int)Session["user_id"];

            bool isReviewAuthor = review.user_id == currentUserId;
            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            if (!isReviewAuthor && !isAdmin)
            {
                return RedirectToAction("Details", "Universes", new { id = review.universe_id });
            }

            ViewBag.UniverseId = review.universe_id;

            return View(review);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var review = db.Reviews.FirstOrDefault(r => r.review_id == id);

            if (review == null)
            {
                return HttpNotFound();
            }

            int currentUserId = (int)Session["user_id"];

            bool isReviewAuthor = review.user_id == currentUserId;
            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            if (!isReviewAuthor && !isAdmin)
            {
                return RedirectToAction("Details", "Universes", new { id = review.universe_id });
            }

            int universeId = review.universe_id;

            db.Reviews.Remove(review);
            db.SaveChanges();

            return RedirectToAction("Details", "Universes", new { id = universeId });
        }
    }
}