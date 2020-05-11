using System.Data;

namespace OracleMultithreadingTest
{
    interface IDatabase
    {
        void CloseConnection();
        void Modify(string statement, params object[] parameters);
        void OpenConnection();
        DataTable Read(string statement);
        void TestConnection();
    }
}
