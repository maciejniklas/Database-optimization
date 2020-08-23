using MultithreadedAccessTest.Database;
using System.Data;
using System.Threading;

namespace MultithreadedAccessTest.Users
{
    public class BrewerSecond : AbstractUser
    {
        public BrewerSecond(IDatabase database) : base(database) { }

        protected override void WorkProcedure()
        {
            Message("This beer is almost good, but they've probably lowered the alcohol percentage value. I have to decrease it in a database of about 0.1 points.");
            Message("Let's find it there.");
            Message("SELECT Brewery.name, BeerStyle.name, Beer.alcohol_percent FROM Brewery JOIN BeerInBreweries ON (Brewery.id = BeerInBreweries.brewery_id) JOIN Beer ON (Beer.id = BeerInBreweries.beer_id) JOIN BeerStyle ON (BeerStyle.id = Beer.beer_style_id) WHERE Beer.id = 1997;");

            DataTable data = database.Select("SELECT Brewery.name, BeerStyle.name, Beer.alcohol_percent FROM Brewery JOIN BeerInBreweries ON (Brewery.id = BeerInBreweries.brewery_id) JOIN Beer ON (Beer.id = BeerInBreweries.beer_id) JOIN BeerStyle ON (BeerStyle.id = Beer.beer_style_id) WHERE Beer.id = 1997;");

            Message(string.Empty);
            table.AddRow(data.Rows[0].ItemArray);
            table.Write();

            Message("Great, I will update it.");
            Message($"UPDATE Beer SET alcohol_percent = {data.Rows[0][data.Columns["alcohol_percent"]].ToString().Replace(',', '.')} - 0.1 WHERE id = 1997;");

            database.Update($"UPDATE Beer SET alcohol_percent = {data.Rows[0][data.Columns["alcohol_percent"]].ToString().Replace(',', '.')} - 0.1 WHERE id = 1997;");

            Message("Nice job, where is my coffee?");

            Coffee(2000);

            Message("Great, let's see the result.");
            Message("SELECT Brewery.name, BeerStyle.name, Beer.alcohol_percent FROM Brewery JOIN BeerInBreweries ON (Brewery.id = BeerInBreweries.brewery_id) JOIN Beer ON (Beer.id = BeerInBreweries.beer_id) JOIN BeerStyle ON (BeerStyle.id = Beer.beer_style_id) WHERE Beer.id = 1997;");

            data = database.Select("SELECT Brewery.name, BeerStyle.name, Beer.alcohol_percent FROM Brewery JOIN BeerInBreweries ON (Brewery.id = BeerInBreweries.brewery_id) JOIN Beer ON (Beer.id = BeerInBreweries.beer_id) JOIN BeerStyle ON (BeerStyle.id = Beer.beer_style_id) WHERE Beer.id = 1997;");

            Message(string.Empty);
            table.Rows.Clear();
            table.AddRow(data.Rows[0].ItemArray);
            table.Write();

            Message("Hmmm, interesting. That is a bigger value.");
        }
    }
}
