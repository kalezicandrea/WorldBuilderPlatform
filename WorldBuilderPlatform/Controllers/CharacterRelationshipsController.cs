using System.Linq;
using System.Web.Mvc;

namespace WorldBuilderPlatform.Controllers
{
    public class CharacterRelationshipsController : Controller
    {
        private WorldBuilderPlatformDBEntities db = new WorldBuilderPlatformDBEntities();

        private bool CanEditUniverse(int universeId)
        {
            if (Session["user_id"] == null)
            {
                return false;
            }

            var universe = db.Universes.FirstOrDefault(u => u.universe_id == universeId);

            if (universe == null)
            {
                return false;
            }

            int currentUserId = (int)Session["user_id"];

            bool isOwner = universe.owner_id == currentUserId;
            bool isAdmin = Session["role_id"] != null && (int)Session["role_id"] == 1;

            return isOwner || isAdmin;
        }

        // GET: CharacterRelationships/Create?universeId=1
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

            if (!CanEditUniverse(universeId))
            {
                return RedirectToAction("Details", "Universes", new { id = universeId });
            }

            var characters = db.Characters
                .Where(c => c.universe_id == universeId)
                .OrderBy(c => c.name)
                .ToList();

            if (characters.Count < 2)
            {
                ViewBag.Error = "You need at least two characters to create a relationship.";
            }

            ViewBag.UniverseId = universeId;
            ViewBag.UniverseName = universe.name;
            ViewBag.Characters = characters;

            return View();
        }

        // POST: CharacterRelationships/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(int universeId, int characterId1, string relationType, int characterId2)
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

            if (!CanEditUniverse(universeId))
            {
                return RedirectToAction("Details", "Universes", new { id = universeId });
            }

            var characters = db.Characters
                .Where(c => c.universe_id == universeId)
                .OrderBy(c => c.name)
                .ToList();

            if (characters.Count < 2)
            {
                ViewBag.Error = "You need at least two characters to create a relationship.";
                ViewBag.UniverseId = universeId;
                ViewBag.UniverseName = universe.name;
                ViewBag.Characters = characters;

                return View();
            }

            if (characterId1 == characterId2)
            {
                ViewBag.Error = "A character cannot have a relationship with itself.";
                ViewBag.UniverseId = universeId;
                ViewBag.UniverseName = universe.name;
                ViewBag.Characters = characters;

                return View();
            }

            if (string.IsNullOrWhiteSpace(relationType))
            {
                ViewBag.Error = "Relationship type is required.";
                ViewBag.UniverseId = universeId;
                ViewBag.UniverseName = universe.name;
                ViewBag.Characters = characters;

                return View();
            }

            var firstCharacter = db.Characters.FirstOrDefault(c =>
                c.character_id == characterId1 &&
                c.universe_id == universeId);

            var secondCharacter = db.Characters.FirstOrDefault(c =>
                c.character_id == characterId2 &&
                c.universe_id == universeId);

            if (firstCharacter == null || secondCharacter == null)
            {
                return HttpNotFound();
            }

            var relationship = new CharacterRelationship
            {
                character_id_1 = characterId1,
                character_id_2 = characterId2,
                relation_type = relationType
            };

            db.CharacterRelationships.Add(relationship);
            db.SaveChanges();

            return RedirectToAction("Details", "Universes", new { id = universeId });
        }

        // GET: CharacterRelationships/Edit/5
        public ActionResult Edit(int id)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var relationship = db.CharacterRelationships
                .FirstOrDefault(r => r.relationship_id == id);

            if (relationship == null)
            {
                return HttpNotFound();
            }

            var firstCharacter = db.Characters
                .FirstOrDefault(c => c.character_id == relationship.character_id_1);

            if (firstCharacter == null)
            {
                return HttpNotFound();
            }

            int universeId = firstCharacter.universe_id;

            if (!CanEditUniverse(universeId))
            {
                return RedirectToAction("Details", "Universes", new { id = universeId });
            }

            var universe = db.Universes.FirstOrDefault(u => u.universe_id == universeId);

            var characters = db.Characters
                .Where(c => c.universe_id == universeId)
                .OrderBy(c => c.name)
                .ToList();

            ViewBag.UniverseId = universeId;
            ViewBag.UniverseName = universe.name;
            ViewBag.Characters = characters;

            return View(relationship);
        }

        // POST: CharacterRelationships/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, int universeId, int characterId1, string relationType, int characterId2)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var relationship = db.CharacterRelationships
                .FirstOrDefault(r => r.relationship_id == id);

            if (relationship == null)
            {
                return HttpNotFound();
            }

            var universe = db.Universes.FirstOrDefault(u => u.universe_id == universeId);

            if (universe == null)
            {
                return HttpNotFound();
            }

            if (!CanEditUniverse(universeId))
            {
                return RedirectToAction("Details", "Universes", new { id = universeId });
            }

            var characters = db.Characters
                .Where(c => c.universe_id == universeId)
                .OrderBy(c => c.name)
                .ToList();

            if (characterId1 == characterId2)
            {
                ViewBag.Error = "A character cannot have a relationship with itself.";
                ViewBag.UniverseId = universeId;
                ViewBag.UniverseName = universe.name;
                ViewBag.Characters = characters;

                return View(relationship);
            }

            if (string.IsNullOrWhiteSpace(relationType))
            {
                ViewBag.Error = "Relationship type is required.";
                ViewBag.UniverseId = universeId;
                ViewBag.UniverseName = universe.name;
                ViewBag.Characters = characters;

                return View(relationship);
            }

            var firstCharacter = db.Characters.FirstOrDefault(c =>
                c.character_id == characterId1 &&
                c.universe_id == universeId);

            var secondCharacter = db.Characters.FirstOrDefault(c =>
                c.character_id == characterId2 &&
                c.universe_id == universeId);

            if (firstCharacter == null || secondCharacter == null)
            {
                return HttpNotFound();
            }

            relationship.character_id_1 = characterId1;
            relationship.character_id_2 = characterId2;
            relationship.relation_type = relationType;

            db.SaveChanges();

            return RedirectToAction("Details", "Universes", new { id = universeId });
        }

        // GET: CharacterRelationships/Delete/5
        public ActionResult Delete(int id)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var relationship = db.CharacterRelationships
                .FirstOrDefault(r => r.relationship_id == id);

            if (relationship == null)
            {
                return HttpNotFound();
            }

            var firstCharacter = db.Characters
                .FirstOrDefault(c => c.character_id == relationship.character_id_1);

            if (firstCharacter == null)
            {
                return HttpNotFound();
            }

            int universeId = firstCharacter.universe_id;

            if (!CanEditUniverse(universeId))
            {
                return RedirectToAction("Details", "Universes", new { id = universeId });
            }

            ViewBag.UniverseId = universeId;

            return View(relationship);
        }

        // POST: CharacterRelationships/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id, int universeId)
        {
            if (Session["user_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            if (!CanEditUniverse(universeId))
            {
                return RedirectToAction("Details", "Universes", new { id = universeId });
            }

            var relationship = db.CharacterRelationships
                .FirstOrDefault(r => r.relationship_id == id);

            if (relationship == null)
            {
                return HttpNotFound();
            }

            db.CharacterRelationships.Remove(relationship);
            db.SaveChanges();

            return RedirectToAction("Details", "Universes", new { id = universeId });
        }
    }
}