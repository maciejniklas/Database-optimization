using System.Data;
using System.Threading;

namespace OracleMultithreadingTest.Users
{
    class DatabaseAdmin : AbstractUser
    {
        public DatabaseAdmin() : base() { }

        public override void StartWork()
        {
            Communicate("One not paid order!");
            Communicate("Right then, check name of this industry");

            DataTable data = database.Read("SELECT breweryName FROM Brewery WHERE breweryId = 1501");

            string breweryName = string.Empty;

            foreach(DataRow row in data.Rows)
            {
                foreach(DataColumn column in data.Columns)
                {
                    if(column.ColumnName == "BREWERYNAME")
                    {
                        breweryName = row[column].ToString();
                    }
                }
            }

            Communicate("It is " + breweryName);
            Communicate("Time for a sip of a coffee");

            Thread.Sleep(1000);

            Communicate("I should delete this man for his debt");

            database.Modify("DELETE FROM Brewery WHERE breweryName = :param0", new string[] { breweryName });

            Communicate("It's done");
            Communicate("Wait a minute!");

            data = database.Read("SELECT breweryName FROM Brewery WHERE breweryId = 1501");

            breweryName = string.Empty;

            foreach (DataRow row in data.Rows)
            {
                foreach (DataColumn column in data.Columns)
                {
                    if (column.ColumnName == "BREWERYNAME")
                    {
                        breweryName = row[column].ToString();
                    }
                }
            }

            Communicate("It changed name to " + breweryName);
        }
    }
}
