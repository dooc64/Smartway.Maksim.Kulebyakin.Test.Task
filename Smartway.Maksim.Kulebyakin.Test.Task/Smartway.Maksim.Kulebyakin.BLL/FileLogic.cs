using Smartway.Maksim.Kulebyakin.CoreLogic.Contracts;
using Smartway.Maksim.Kulebyakin.DataBase.Contracts;
using Smartway.Maksim.Kulebyakin.Entities;

namespace Smartway.Maksim.Kulebyakin.BLL
{
    public class FileLogic : IFileHandler
    {
        private IDataBaseHandler _dataHandler;

        public FileLogic(IDataBaseHandler dataHandler)
        {
            _dataHandler = dataHandler;
        }

        public bool UploadFileToDataBase(FileModel file)
        {
            return _dataHandler.UploadFileToDataBase(file);
        }

        public void DownloadFileFromDataBase()
        {
            _dataHandler.DownloadFileFromDataBase();
        }

        public List<FileModel> GetFiles()
        {
            return _dataHandler.GetFiles();
        }

        public FileModel Download(int id)
        {
            return _dataHandler.Download(id);
        }
    }
}