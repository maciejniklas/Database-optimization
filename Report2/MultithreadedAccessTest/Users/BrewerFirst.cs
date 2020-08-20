using MultithreadedAccessTest.Database;
using System.Data;
using System.Threading;

namespace MultithreadedAccessTest.Users
{
    public class BrewerFirst : AbstractUser
    {
        public BrewerFirst(IDatabase database) : base(database) { }

        protected override void WorkProcedure()
        {
            Message("This beer is almost good. In my opinion, it has a bigger alcohol percentage value. I have to increase it in database of about 0.1 points.");
            Message("Let's find it there.");
            Message("SELECT Brewery.name, BeerStyle.name, Beer.alcohol_percent FROM Brewery JOIN BeerInBreweries ON (Brewery.id = BeerInBreweries.brewery_id) JOIN Beer ON (Beer.id = BeerInBreweries.beer_id) JOIN BeerStyle ON (BeerStyle.id = Beer.beer_style_id) WHERE Beer.id = 1997;");

            DataTable data =  database.Select("SELECT Brewery.name, BeerStyle.name, Beer.alcohol_percent FROM Brewery JOIN BeerInBreweries ON (Brewery.id = BeerInBreweries.brewery_id) JOIN Beer ON (Beer.id = BeerInBreweries.beer_id) JOIN BeerStyle ON (BeerStyle.id = Beer.beer_style_id) WHERE Beer.id = 1997;");

            table.AddRow(data.Rows[0].ItemArray);
            table.Write();

            Coffee(2000);

            Message("Wonderful taste. Now some work.");
            Message($"UPDATE Beer SET alcohol_percent = {data.Rows[0][data.Columns["alcohol_percent"]].ToString().Replace(',', '.')} + 0.1 WHERE id = 1997;");

            database.Update($"UPDATE Beer SET alcohol_percent = {data.Rows[0][data.Columns["alcohol_percent"]].ToString().Replace(',', '.')} + 0.1 WHERE id = 1997;");

            Message("Great, let's see the result.");
            Message("SELECT Brewery.name, BeerStyle.name, Beer.alcohol_percent FROM Brewery JOIN BeerInBreweries ON (Brewery.id = BeerInBreweries.brewery_id) JOIN Beer ON (Beer.id = BeerInBreweries.beer_id) JOIN BeerStyle ON (BeerStyle.id = Beer.beer_style_id) WHERE Beer.id = 1997;");

            data = database.Select("SELECT Brewery.name, BeerStyle.name, Beer.alcohol_percent FROM Brewery JOIN BeerInBreweries ON (Brewery.id = BeerInBreweries.brewery_id) JOIN Beer ON (Beer.id = BeerInBreweries.beer_id) JOIN BeerStyle ON (BeerStyle.id = Beer.beer_style_id) WHERE Beer.id = 1997;");

            Message("Hmmm, interesting. That is a bigger value.");

            table.Rows.Clear();
            table.AddRow(data.Rows[0].ItemArray);
            table.Write();
        }
    }
}
