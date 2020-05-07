using System.Data;

namespace OracleMultithreadingTest
{
    interface IDatabase
    {
        void Modify(string statement);
        DataTable Read(string statement);
        void TestConnection();
    }
}
