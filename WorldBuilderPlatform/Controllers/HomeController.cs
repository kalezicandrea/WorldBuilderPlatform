using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;

namespace WorldBuilderPlatform.Controllers
{
    public class HomeController : Controller
    {
        private WorldBuilderPlatformDBEntities db = new WorldBuilderPlatformDBEntities();

        public ActionResult Index()
        {
            var universes = db.Universes
                .Where(u => u.visibility == "public")
                .OrderByDescending(u => u.created_at)
                .ToList();

            var ratings = new Dictionary<int, decimal>();
            var favoriteCounts = new Dictionary<int, int>();

            foreach (var universe in universes)
            {
                var averageRating = db.Database.SqlQuery<decimal>(
                    "SELECT dbo.fn_GetAverageUniverseRating(@universe_id)",
                    new SqlParameter("@universe_id", universe.universe_id)
                ).FirstOrDefault();

                var favoriteCount = db.Database.SqlQuery<int>(
                    "SELECT dbo.fn_GetUniverseFavoriteCount(@universe_id)",
                    new SqlParameter("@universe_id", universe.universe_id)
                ).FirstOrDefault();

                ratings[universe.universe_id] = averageRating;
                favoriteCounts[universe.universe_id] = favoriteCount;
            }

            ViewBag.Ratings = ratings;
            ViewBag.FavoriteCounts = favoriteCounts;

            return View(universes);
        }
    }
}