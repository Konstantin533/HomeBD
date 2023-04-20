using Book.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace Book.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private AplicationContext db;
        public HomeController(ILogger<HomeController> logger, AplicationContext context)
        {
            _logger = logger;
            db = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public IActionResult Privacy()
        {
            var books = db.Books.ToList();
            return View(books);
        }
        [HttpGet]
        public IActionResult Creat()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Creat(BookClass book)
        {
            db.Books.Add(book);
            db.SaveChangesAsync();
            return RedirectToAction("Privacy");
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}