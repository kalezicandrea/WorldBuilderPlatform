using System;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WorldBuilderPlatform.Controllers
{
    public class CharactersController : Controller
    {
        private WorldBuilderPlatformDBEntities db = new WorldBuilderPlatformDBEntities();

        // GET: Characters/Create?universeId=1
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

        // POST: Characters/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(
            int universeId,
            string name,
            string gender,
            string speciesName,
            string speciesDescription,
            string description,
            HttpPostedFileBase mainImage)
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
                ViewBag.Error = "Character name is required.";
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

                string folderPath = Server.MapPath("~/Content/Uploaded/Characters/");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string filePath = Path.Combine(folderPath, fileName);

                mainImage.SaveAs(filePath);

                mainImgUrl = "/Content/Uploaded/Characters/" + fileName;
            }

            db.Database.ExecuteSqlCommand(
                "EXEC sp_CreateCharacterWithSpecies @universe_id, @name, @gender, @species_name, @species_description, @description, @main_img_url",
                new SqlParameter("@universe_id", universeId),
                new SqlParameter("@name", name),
                new SqlParameter("@gender", string.IsNullOrWhiteSpace(gender) ? (object)DBNull.Value : gender),
                new SqlParameter("@species_name", string.IsNullOrWhiteSpace(speciesName) ? (object)DBNull.Value : speciesName),
                new SqlParameter("@species_description", string.IsNullOrWhiteSpace(speciesDescription) ? (object)DBNull.Value : speciesDescription),
                new SqlParameter("@description", string.IsNullOrWhiteSpace(description) ? (object)DBNull.Value : description),
                new SqlParameter("@main_img_url", string.IsNullOrWhiteSpace(mainImgUrl) ? (object)DBNull.Value : mainImgUrl)
            );

            return RedirectToAction("Details", "Universes", new { id = universeId });
        }

        public ActionResult Edit(int id)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var character = db.Characters.FirstOrDefault(c => c.character_id == id);

            if (character == null)
            {
                return HttpNotFound();
            }

            var universe = db.Universes.FirstOrDefault(u => u.universe_id == character.universe_id);

            int currentUserId = (int)Session["user_id"];
            bool isOwner = universe.owner_id == currentUserId;
            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            if (!isOwner && !isAdmin)
            {
                return RedirectToAction("Details", "Universes", new { id = character.universe_id });
            }

            ViewBag.UniverseId = character.universe_id;
            ViewBag.UniverseName = universe.name;
            ViewBag.SpeciesName = character.Species != null ? character.Species.name : "";
            ViewBag.SpeciesDescription = character.Species != null ? character.Species.description : "";

            return View(character);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(
            int id,
            string name,
            string gender,
            string speciesName,
            string speciesDescription,
            string description,
            HttpPostedFileBase mainImage)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var character = db.Characters.FirstOrDefault(c => c.character_id == id);

            if (character == null)
            {
                return HttpNotFound();
            }

            var universe = db.Universes.FirstOrDefault(u => u.universe_id == character.universe_id);

            int currentUserId = (int)Session["user_id"];
            bool isOwner = universe.owner_id == currentUserId;
            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            if (!isOwner && !isAdmin)
            {
                return RedirectToAction("Details", "Universes", new { id = character.universe_id });
            }

            if (string.IsNullOrWhiteSpace(name))
            {
                ViewBag.Error = "Character name is required.";
                ViewBag.UniverseId = character.universe_id;
                ViewBag.UniverseName = universe.name;
                ViewBag.SpeciesName = speciesName;
                ViewBag.SpeciesDescription = speciesDescription;
                return View(character);
            }

            int? speciesId = null;

            if (!string.IsNullOrWhiteSpace(speciesName))
            {
                var species = db.Species.FirstOrDefault(s =>
                    s.universe_id == character.universe_id &&
                    s.name == speciesName);

                if (species == null)
                {
                    species = new Species
                    {
                        name = speciesName,
                        description = speciesDescription,
                        universe_id = character.universe_id
                    };

                    db.Species.Add(species);
                    db.SaveChanges();
                }

                speciesId = species.species_id;
            }

            if (mainImage != null && mainImage.ContentLength > 0)
            {
                string extension = Path.GetExtension(mainImage.FileName).ToLower();
                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".webp" };

                if (!allowedExtensions.Contains(extension))
                {
                    ViewBag.Error = "Only JPG, JPEG, PNG and WEBP images are allowed.";
                    ViewBag.UniverseId = character.universe_id;
                    ViewBag.UniverseName = universe.name;
                    ViewBag.SpeciesName = speciesName;
                    ViewBag.SpeciesDescription = speciesDescription;
                    return View(character);
                }

                int maxFileSize = 5 * 1024 * 1024;

                if (mainImage.ContentLength > maxFileSize)
                {
                    ViewBag.Error = "Image size must be less than 5 MB.";
                    ViewBag.UniverseId = character.universe_id;
                    ViewBag.UniverseName = universe.name;
                    ViewBag.SpeciesName = speciesName;
                    ViewBag.SpeciesDescription = speciesDescription;
                    return View(character);
                }

                string fileName = Guid.NewGuid().ToString() + extension;
                string folderPath = Server.MapPath("~/Content/Uploaded/Characters/");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string filePath = Path.Combine(folderPath, fileName);
                mainImage.SaveAs(filePath);

                character.main_img_url = "/Content/Uploaded/Characters/" + fileName;
            }

            character.name = name;
            character.gender = gender;
            character.description = description;
            character.species_id = speciesId;

            db.SaveChanges();

            return RedirectToAction("Details", "Universes", new { id = character.universe_id });
        }

        public ActionResult Delete(int id)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var character = db.Characters.FirstOrDefault(c => c.character_id == id);

            if (character == null)
            {
                return HttpNotFound();
            }

            var universe = db.Universes.FirstOrDefault(u => u.universe_id == character.universe_id);

            int currentUserId = (int)Session["user_id"];
            bool isOwner = universe.owner_id == currentUserId;
            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            if (!isOwner && !isAdmin)
            {
                return RedirectToAction("Details", "Universes", new { id = character.universe_id });
            }

            return View(character);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            var character = db.Characters.FirstOrDefault(c => c.character_id == id);

            if (character == null)
            {
                return HttpNotFound();
            }

            int universeId = character.universe_id;

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
                "DELETE FROM CharacterRelationship WHERE character_id_1 = @character_id OR character_id_2 = @character_id",
                new SqlParameter("@character_id", id)
            );

            db.Database.ExecuteSqlCommand(
                "DELETE FROM CharacterStorySegment WHERE character_id = @character_id",
                new SqlParameter("@character_id", id)
            );

            db.Characters.Remove(character);
            db.SaveChanges();

            return RedirectToAction("Details", "Universes", new { id = universeId });
        }

    }
}