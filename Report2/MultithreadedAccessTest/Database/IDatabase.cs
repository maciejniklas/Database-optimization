using System.Data;
using System.Data.Common;

namespace MultithreadedAccessTest.Database
{
    public interface IDatabase
    {
        DbConnection Connection { get; }
        DataTable Read(string sqlStatement);
        void TestConnection();
        void Modify(string sqlStatement);
    }
}
