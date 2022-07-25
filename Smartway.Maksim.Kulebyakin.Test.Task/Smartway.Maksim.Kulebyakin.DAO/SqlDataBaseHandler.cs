using Microsoft.Extensions.Configuration;
using Smartway.Maksim.Kulebyakin.DataBase.Contracts;
using Smartway.Maksim.Kulebyakin.Entities;
using System.Data.SqlClient;

namespace Smartway.Maksim.Kulebyakin.DAO
{
    public class SqlDataBaseHandler : IDataBaseHandler
    {
        private string _connectionString;

        public SqlDataBaseHandler(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Default");
        }

        public bool UploadFileToDataBase(FileModel file)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                var command = connection.CreateCommand();
                command.CommandText = "AddFile";
                command.CommandType = System.Data.CommandType.StoredProcedure;

                command.Parameters.AddWithValue("@Name", file.FileName);
                command.Parameters.AddWithValue("@Data", file.Data);

                command.ExecuteNonQuery();
            }

            return true;
        }

        public void DownloadFileFromDataBase()
        {
            var files = new List<FileModel>();

            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                var command = connection.CreateCommand();
                command.CommandText = "SELECT * FROM dbo.Files";
                command.CommandType = System.Data.CommandType.Text;
                var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int id = reader.GetInt32(0);

                    string name = reader.GetString(1);

                    byte[] data = (byte[])reader.GetValue(2);

                    var file = new FileModel() { FileName = name, Data = data };

                    files.Add(file);
                }
            }

            if (files.Count > 0)
            {
                foreach (var file in files)
                {
                    using (FileStream stream = new FileStream(Path.Combine(Directory.GetCurrentDirectory() + @"\Files\", file.FileName), FileMode.OpenOrCreate))
                    {
                        stream.Write(file.Data, 0, file.Data.Length);
                    }
                }
                
            }
        }

        public List<FileModel> GetFiles()
        {
            var files = new List<FileModel>();

            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                var command = connection.CreateCommand();
                command.CommandText = "SELECT * FROM dbo.Files";
                command.CommandType = System.Data.CommandType.Text;
                var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int id = reader.GetInt32(0);

                    string name = reader.GetString(1);

                    byte[] data = (byte[])reader.GetValue(2);

                    var file = new FileModel() { Id = id, FileName = name, Data = data };

                    files.Add(file);
                }
            }

            return files;
        }

        public FileModel Download(int fileId)
        {
            var file = new FileModel();

            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                var command = connection.CreateCommand();
                command.CommandText = $"SELECT * FROM dbo.Files WHERE Id = {fileId}";
                command.CommandType = System.Data.CommandType.Text;
                var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int id = reader.GetInt32(0);

                    string name = reader.GetString(1);

                    byte[] data = (byte[])reader.GetValue(2);

                    file.Data = data;

                    file.FileName = name;

                    file.Id = id;
                }
            }

            return file;
        }
    }
}