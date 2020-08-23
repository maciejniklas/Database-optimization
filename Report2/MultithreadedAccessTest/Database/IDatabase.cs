using System.Data;
using System.Data.Common;

namespace MultithreadedAccessTest.Database
{
    public interface IDatabase
    {
        DbConnection Connection { get; }
        DataTable Select(string sqlStatement);
        void TestConnection();
        void Update(string sqlStatement);
    }
}
