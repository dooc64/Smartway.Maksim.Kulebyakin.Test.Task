using Smartway.Maksim.Kulebyakin.Entities;

namespace Smartway.Maksim.Kulebyakin.CoreLogic.Contracts
{
    public interface IFileHandler
    {
        bool UploadFileToDataBase(FileModel file);

        void DownloadFileFromDataBase();

        List<FileModel> GetFiles();

        FileModel Download(int fileId);
    }
}