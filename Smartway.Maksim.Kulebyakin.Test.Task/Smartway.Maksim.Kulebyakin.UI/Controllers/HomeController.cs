using Microsoft.AspNetCore.Mvc;
using Smartway.Maksim.Kulebyakin.Test.Task.Models;
using System.Diagnostics;

namespace Smartway.Maksim.Kulebyakin.Test.Task.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}