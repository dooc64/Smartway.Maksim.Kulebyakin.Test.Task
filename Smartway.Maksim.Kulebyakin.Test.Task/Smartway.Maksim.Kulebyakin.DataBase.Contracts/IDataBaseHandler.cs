using Smartway.Maksim.Kulebyakin.Entities;

namespace Smartway.Maksim.Kulebyakin.DataBase.Contracts
{
    public interface IDataBaseHandler
    {
        bool UploadFileToDataBase(FileModel file);

        void DownloadFileFromDataBase();

        List<FileModel> GetFiles();

        FileModel Download(int fileId);
    }
}