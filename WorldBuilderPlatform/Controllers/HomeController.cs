using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Mvc;

namespace WorldBuilderPlatform.Controllers
{
    public class HomeController : Controller
    {
        private WorldBuilderPlatformDBEntities db = new WorldBuilderPlatformDBEntities();

        public ActionResult Index(
            string searchText,
            string category,
            string sortBy,
            bool myUniverses = false,
            bool myFavorites = false,
            int[] selectedTagIds = null,
            string[] selectedGenders = null,
            int[] selectedSpeciesIds = null)
        {
            if (string.IsNullOrWhiteSpace(category))
            {
                category = "universe";
            }

            if (string.IsNullOrWhiteSpace(sortBy))
            {
                sortBy = "newest";
            }

            IQueryable<Universe> universes = db.Universes;

            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            if (myUniverses)
            {
                if (Session["user_id"] == null)
                {
                    return RedirectToAction("Login", "Account");
                }

                int currentUserId = (int)Session["user_id"];
                universes = universes.Where(u => u.owner_id == currentUserId);
            }
            else if (myFavorites)
            {
                if (Session["user_id"] == null)
                {
                    return RedirectToAction("Login", "Account");
                }

                int currentUserId = (int)Session["user_id"];

                var favoriteUniverseIds = db.FavoriteUniverses
                    .Where(f => f.user_id == currentUserId)
                    .Select(f => f.universe_id);

                universes = universes.Where(u => favoriteUniverseIds.Contains(u.universe_id));
            }
            else if (isAdmin)
            {
            }
            else
            {
                universes = universes.Where(u => u.visibility == "public");
            }

            if (!string.IsNullOrWhiteSpace(searchText))
            {
                if (category == "character")
                {
                    var characterUniverseIds = db.Characters
                        .Where(c =>
                            c.name.Contains(searchText) ||
                            (c.description != null && c.description.Contains(searchText)))
                        .Select(c => c.universe_id);

                    universes = universes.Where(u => characterUniverseIds.Contains(u.universe_id));
                }
                else if (category == "story")
                {
                    var storyUniverseIds = db.StorySegments
                        .Where(s =>
                            s.title.Contains(searchText) ||
                            (s.content != null && s.content.Contains(searchText)))
                        .Select(s => s.universe_id);

                    universes = universes.Where(u => storyUniverseIds.Contains(u.universe_id));
                }
                else if (category == "location")
                {
                    var locationUniverseIds = db.Locations
                        .Where(l =>
                            l.name.Contains(searchText) ||
                            (l.description != null && l.description.Contains(searchText)))
                        .Select(l => l.universe_id);

                    universes = universes.Where(u => locationUniverseIds.Contains(u.universe_id));
                }
                else
                {
                    universes = universes.Where(u =>
                        u.name.Contains(searchText) ||
                        (u.description != null && u.description.Contains(searchText)));
                }
            }

            if (category == "universe" && selectedTagIds != null && selectedTagIds.Length > 0)
            {
                var tagIds = selectedTagIds.ToList();

                universes = universes.Where(u =>
                    u.Tags.Any(t => tagIds.Contains(t.tag_id)));
            }

            if (category == "character")
            {
                IQueryable<Character> characterQuery = db.Characters;

                if (selectedGenders != null && selectedGenders.Length > 0)
                {
                    var genders = selectedGenders.ToList();

                    characterQuery = characterQuery.Where(c =>
                        c.gender != null && genders.Contains(c.gender));
                }

                if (selectedSpeciesIds != null && selectedSpeciesIds.Length > 0)
                {
                    var speciesIds = selectedSpeciesIds.ToList();

                    characterQuery = characterQuery.Where(c =>
                        c.species_id != null && speciesIds.Contains(c.species_id.Value));
                }

                if ((selectedGenders != null && selectedGenders.Length > 0) ||
                    (selectedSpeciesIds != null && selectedSpeciesIds.Length > 0))
                {
                    var filteredCharacterUniverseIds = characterQuery
                        .Select(c => c.universe_id);

                    universes = universes.Where(u =>
                        filteredCharacterUniverseIds.Contains(u.universe_id));
                }
            }

            var result = universes.ToList();

            var ratings = new Dictionary<int, decimal>();
            var favoriteCounts = new Dictionary<int, int>();
            var reviewCounts = new Dictionary<int, int>();

            foreach (var universe in result)
            {
                var averageRating = db.Database.SqlQuery<decimal>(
                    "SELECT dbo.fn_GetAverageUniverseRating(@universe_id)",
                    new SqlParameter("@universe_id", universe.universe_id)
                ).FirstOrDefault();

                var favoriteCount = db.Database.SqlQuery<int>(
                    "SELECT dbo.fn_GetUniverseFavoriteCount(@universe_id)",
                    new SqlParameter("@universe_id", universe.universe_id)
                ).FirstOrDefault();

                var reviewCount = db.Reviews.Count(r => r.universe_id == universe.universe_id);

                ratings[universe.universe_id] = averageRating;
                favoriteCounts[universe.universe_id] = favoriteCount;
                reviewCounts[universe.universe_id] = reviewCount;
            }

            if (sortBy == "oldest")
            {
                result = result.OrderBy(u => u.created_at).ToList();
            }
            else if (sortBy == "mostReviews")
            {
                result = result
                    .OrderByDescending(u => reviewCounts.ContainsKey(u.universe_id) ? reviewCounts[u.universe_id] : 0)
                    .ToList();
            }
            else if (sortBy == "leastReviews")
            {
                result = result
                    .OrderBy(u => reviewCounts.ContainsKey(u.universe_id) ? reviewCounts[u.universe_id] : 0)
                    .ToList();
            }
            else if (sortBy == "bestRating")
            {
                result = result
                    .OrderByDescending(u => ratings.ContainsKey(u.universe_id) ? ratings[u.universe_id] : 0)
                    .ToList();
            }
            else if (sortBy == "worstRating")
            {
                result = result
                    .OrderBy(u => ratings.ContainsKey(u.universe_id) ? ratings[u.universe_id] : 0)
                    .ToList();
            }
            else if (sortBy == "mostFavorites")
            {
                result = result
                    .OrderByDescending(u => favoriteCounts.ContainsKey(u.universe_id) ? favoriteCounts[u.universe_id] : 0)
                    .ToList();
            }
            else if (sortBy == "leastFavorites")
            {
                result = result
                    .OrderBy(u => favoriteCounts.ContainsKey(u.universe_id) ? favoriteCounts[u.universe_id] : 0)
                    .ToList();
            }
            else
            {
                result = result.OrderByDescending(u => u.created_at).ToList();
            }

            ViewBag.Ratings = ratings;
            ViewBag.FavoriteCounts = favoriteCounts;
            ViewBag.ReviewCounts = reviewCounts;

            ViewBag.AllTags = db.Tags.OrderBy(t => t.name).ToList();

            ViewBag.AllGenders = new List<string>
            {
                "Male",
                "Female",
                "Other"
            };

            ViewBag.AllSpecies = db.Species
                .OrderBy(s => s.name)
                .ToList();

            ViewBag.IsAdmin = isAdmin;

            if (isAdmin)
            {
                ViewBag.AllUsers = db.Users
                    .OrderBy(u => u.username)
                    .ToList();
            }
            else
            {
                ViewBag.AllUsers = null;
            }

            ViewBag.SearchText = searchText;
            ViewBag.Category = category;
            ViewBag.SortBy = sortBy;
            ViewBag.MyUniverses = myUniverses;
            ViewBag.MyFavorites = myFavorites;
            ViewBag.SelectedTagIds = selectedTagIds ?? new int[0];
            ViewBag.SelectedGenders = selectedGenders ?? new string[0];
            ViewBag.SelectedSpeciesIds = selectedSpeciesIds ?? new int[0];

            return View(result);
        }
    }
}