using Microsoft.AspNetCore.Mvc;

namespace LibraryProject.Controllers
{
    public class AutorController : Controller
    {
        [HttpGet]
        public IActionResult Add()
        {
            return View();
        }
    }
}
