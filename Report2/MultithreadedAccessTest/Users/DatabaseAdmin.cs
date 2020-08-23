using ConsoleTables;
using MultithreadedAccessTest.Database;
using System.Data;

namespace MultithreadedAccessTest.Users
{
    public class DatabaseAdmin : AbstractUser
    {
        public DatabaseAdmin(IDatabase database) : base(database)
        {
            table = new ConsoleTable("Brewery name");
        }

        protected override void WorkProcedure()
        {
            Message("One not paid order!");
            Message("Right then, check the name of this industry");
            Message("SELECT Brewery.name FROM Brewery WHERE id = 1997;");

            DataTable data = database.Read("SELECT Brewery.name FROM Brewery WHERE id = 1997;");

            Message(string.Empty);
            table.AddRow(data.Rows[0].ItemArray);
            table.Write();

            Message("There it is!");
            Message("I should delete this company for its debt");
            Message("First, time for a sip of a coffee");

            Coffee(2000);

            Message("Right, let's do it.");
            Message($"DELETE FROM Brewery WHERE name = '{data.Rows[0]["name"]}';");

            database.Modify($"DELETE FROM Brewery WHERE name = '{data.Rows[0]["name"]}';");

            Message("It's done");
            Message("Wait a minute!");
            Message("There is no such brewery right now!");

            database.Modify($"UPDATE Brewery SET name = '{data.Rows[0]["name"]}' WHERE id = 1997;");
        }
    }
}
