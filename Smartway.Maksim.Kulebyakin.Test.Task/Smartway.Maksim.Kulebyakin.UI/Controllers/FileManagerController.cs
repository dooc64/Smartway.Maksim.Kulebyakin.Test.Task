using Microsoft.AspNetCore.Mvc;
using Smartway.Maksim.Kulebyakin.CoreLogic.Contracts;
using Smartway.Maksim.Kulebyakin.Entities;
using System.Net.Mime;

namespace Smartway.Maksim.Kulebyakin.Test.Task.Controllers
{
    public class FileManagerController : Controller
    {
        private IFileHandler _fileHandler;

        public FileManagerController(IFileHandler fileHandler)
        {
            _fileHandler = fileHandler;
        }

        public IActionResult ShowAll()
        {
            var files = _fileHandler.GetFiles();

            return View("Download", files);
        }

        public IActionResult Upload()
        {
            return View();
        }

        [HttpPost]
        public JsonResult Upload(List<IFormFile> files)
        {
            var size = files.Sum(f => f.Length);
            byte[] buffer = new byte[size];

            if (files == null || files.Count == 0)
            {
                return Json(new { status = "Error" });
            }

            foreach (var item in files)
            {
                var path = @"\Files\";

                var filePath = Path.Combine(Directory.GetCurrentDirectory() + path, item.FileName);

                using (var stream = item.OpenReadStream())
                {
                    stream.Read(buffer, 0, buffer.Length);
                }

                FileModel file = new FileModel() { FileName = item.FileName, Data = buffer };

                _fileHandler.UploadFileToDataBase(file);
            }

            return Json(new { status = "Complete" });
        }

        public IActionResult Download(int id)
        {
            var file = _fileHandler.Download(id);

            return File(file.Data, MediaTypeNames.Application.Octet, file.FileName);
        }
    }
}
