using System.Data;

namespace MultithreadedAccessTest.Database
{
    public interface IDatabase
    {
        DataTable Select(string sqlStatement);
        void TestConnection();
        void Update(string sqlStatement);
    }
}
