using System;
using System.Linq;
using System.Web.Mvc;

namespace WorldBuilderPlatform.Controllers
{
    public class AccountController : Controller
    {
        private WorldBuilderPlatformDBEntities db = new WorldBuilderPlatformDBEntities();

        // GET: Account/Register
        public ActionResult Register()
        {
            return View();
        }

        // POST: Account/Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(string username, string email, string password)
        {
            if (string.IsNullOrWhiteSpace(username) ||
                string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(password))
            {
                ViewBag.Error = "All fields are required.";
                return View();
            }

            bool usernameExists = db.Users.Any(u => u.username == username);
            if (usernameExists)
            {
                ViewBag.Error = "Username already exists.";
                return View();
            }

            bool emailExists = db.Users.Any(u => u.email == email);
            if (emailExists)
            {
                ViewBag.Error = "Email already exists.";
                return View();
            }

            string passwordHash = BCrypt.Net.BCrypt.HashPassword(password);

            var userRole = db.Roles.FirstOrDefault(r => r.name == "User");

            if (userRole == null)
            {
                ViewBag.Error = "User role does not exist in database.";
                return View();
            }

            var newUser = new User
            {
                username = username,
                email = email,
                password_hash = passwordHash,
                role_id = userRole.role_id,
                created_at = DateTime.Now
            };

            db.Users.Add(newUser);
            db.SaveChanges();

            return RedirectToAction("Login", "Account");
        }

        // GET: Account/Login
        public ActionResult Login()
        {
            return View();
        }

        // POST: Account/Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string email, string password)
        {
            if (string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(password))
            {
                ViewBag.Error = "Email and password are required.";
                return View();
            }

            var user = db.Users.FirstOrDefault(u => u.email == email);

            if (user == null)
            {
                ViewBag.Error = "Invalid email or password.";
                return View();
            }

            bool isPasswordCorrect = BCrypt.Net.BCrypt.Verify(password, user.password_hash);

            if (!isPasswordCorrect)
            {
                ViewBag.Error = "Invalid email or password.";
                return View();
            }

            Session["user_id"] = user.user_id;
            Session["username"] = user.username;
            Session["role_id"] = user.role_id;

            return RedirectToAction("Index", "Home");
        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }
    }
}