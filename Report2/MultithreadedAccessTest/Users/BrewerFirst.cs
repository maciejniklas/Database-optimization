using ConsoleTables;
using MultithreadedAccessTest.Database;
using System.Data;

namespace MultithreadedAccessTest.Users
{
    public class BrewerFirst : AbstractUser
    {
        public BrewerFirst(IDatabase database) : base(database)
        {
            table = new ConsoleTable("Brewery name", "Beer style", "Alcohol percentage");
        }

        protected override void WorkProcedure()
        {
            Message("This beer is almost good. In my opinion, it has a bigger alcohol percentage value. I have to increase it in database of about 0.1 points.");
            Message("Let's find it there.");
            Message("SELECT Brewery.name, BeerStyle.name, Beer.alcohol_percent FROM Brewery JOIN BeerInBreweries ON (Brewery.id = BeerInBreweries.brewery_id) JOIN Beer ON (Beer.id = BeerInBreweries.beer_id) JOIN BeerStyle ON (BeerStyle.id = Beer.beer_style_id) WHERE Beer.id = 1997;");

            DataTable data =  database.Read("SELECT Brewery.name, BeerStyle.name, Beer.alcohol_percent FROM Brewery JOIN BeerInBreweries ON (Brewery.id = BeerInBreweries.brewery_id) JOIN Beer ON (Beer.id = BeerInBreweries.beer_id) JOIN BeerStyle ON (BeerStyle.id = Beer.beer_style_id) WHERE Beer.id = 1997;");

            Message(string.Empty);
            table.AddRow(data.Rows[0].ItemArray);
            table.Write();

            Coffee(2000);

            Message("Wonderful taste. Now some work.");
            Message($"UPDATE Beer SET alcohol_percent = {data.Rows[0][data.Columns["alcohol_percent"]].ToString().Replace(',', '.')} + 0.1 WHERE id = 1997;");

            database.Modify($"UPDATE Beer SET alcohol_percent = {data.Rows[0][data.Columns["alcohol_percent"]].ToString().Replace(',', '.')} + 0.1 WHERE id = 1997;");

            Message("Great, let's see the result.");
            Message("SELECT Brewery.name, BeerStyle.name, Beer.alcohol_percent FROM Brewery JOIN BeerInBreweries ON (Brewery.id = BeerInBreweries.brewery_id) JOIN Beer ON (Beer.id = BeerInBreweries.beer_id) JOIN BeerStyle ON (BeerStyle.id = Beer.beer_style_id) WHERE Beer.id = 1997;");

            data = database.Read("SELECT Brewery.name, BeerStyle.name, Beer.alcohol_percent FROM Brewery JOIN BeerInBreweries ON (Brewery.id = BeerInBreweries.brewery_id) JOIN Beer ON (Beer.id = BeerInBreweries.beer_id) JOIN BeerStyle ON (BeerStyle.id = Beer.beer_style_id) WHERE Beer.id = 1997;");

            Message(string.Empty);
            table.Rows.Clear();
            table.AddRow(data.Rows[0].ItemArray);
            table.Write();

            Message("Nice!");
        }
    }
}
