using ConsoleTables;
using MultithreadedAccessTest.Database;

namespace MultithreadedAccessTest.Users
{
    public class BreweryOwner : AbstractUser
    {
        public BreweryOwner(IDatabase database) : base(database)
        {
            table = new ConsoleTable("Brewery name");
        }

        protected override void WorkProcedure()
        {
            Message("I'm out of money and cannot pay my bills!");
            Message("Let me change my brewery name in the database. I think that anyone finds my brewery then.");
            Message("But first...");

            Coffee(2000);

            Message("Wonderful taste, now some work.");
            Message("UPDATE Brewery SET name = 'Temporary Brewery Name' WHERE id = 1997;");

            database.Modify("UPDATE Brewery SET name = 'Temporary Brewery Name' WHERE id = 1997;");

            Message("Great job, my brewery is safe now.");
        }
    }
}
