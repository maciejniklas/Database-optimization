using System.Data;

namespace OracleMultithreadingTest
{
    interface IDatabase
    {
        void Modify(string statement, params object[] parameters);
        DataTable Read(string statement);
        void TestConnection();
    }
}
