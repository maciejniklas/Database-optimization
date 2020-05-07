using System;
using System.Data;

namespace OracleMultithreadingTest.Users
{
    class CommonDataReader : AbstractUser
    {
        public CommonDataReader() : base() { }

        public override void StartWork()
        {
            DataTable data = database.Read("SELECT table_name FROM user_tables");

            foreach(DataColumn item in data.Columns)
            {
                Console.Write(item.ColumnName + '\t');
            }

            Console.WriteLine();

            foreach(DataRow item in data.Rows)
            {
                foreach(DataColumn value in data.Columns)
                {
                    Console.Write(item[value].ToString() + '\t');
                }
                Console.WriteLine();
            }
        }
    }
}
