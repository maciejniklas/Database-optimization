using System.Data;
using System.Text;
using System.Threading;

namespace OracleMultithreadingTest.Users
{
    abstract class Brewer : AbstractUser
    {
        private float alcoholPercent;
        private int beerID;
        private float modifier;

        protected Brewer(float modifier) : base()
        {
            this.modifier = modifier;
        }

        public override void StartWork()
        {
            Communicate("This beer is almost good. I must update its alcohol percentage value about " + modifier);

            if (username.Contains("1"))
            {
                Communicate("Time for a sip of a coffee");
                Thread.Sleep(2000);
            }

            Communicate("Oh, there it is!");
            Read();

            Communicate("Right then, let's update this value");
            alcoholPercent += modifier;
            database.Modify(string.Format("UPDATE Beer SET alcoholPercent = :param0 WHERE beerID = :param1"), new object[] { alcoholPercent, beerID });

            if (username.Contains("2"))
            {
                Communicate("Time for a sip of a coffee");
                Thread.Sleep(2000);
            }

            Communicate("It's done. Let's see my masterwork. It should be about " + alcoholPercent);
            Read();
        }

        private void Read()
        {
            StringBuilder builder = new StringBuilder();
            DataTable data = database.Read("SELECT beerID, breweryName, styleName, alcoholPercent FROM (SELECT * FROM (SELECT * FROM BeerInBreweries INNER JOIN Beer USING (beerID)) INNER JOIN Brewery USING (breweryID)) INNER JOIN BeerStyle USING (beerStyleID) WHERE breweryName LIKE 'Light Sea Green Keg Organization' AND styleName LIKE 'ESB'");

            foreach (DataRow row in data.Rows)
            {
                foreach (DataColumn column in data.Columns)
                {
                    if (column.ColumnName.Contains("ID"))
                    {
                        beerID = int.Parse(row[column].ToString());
                        continue;
                    }
                    else if (column.ColumnName == "ALCOHOLPERCENT" && alcoholPercent <= float.Epsilon)
                    {
                        alcoholPercent = float.Parse(row[column].ToString());
                    }

                    builder.Append(row[column].ToString() + ' ');
                }
            }

            Communicate(builder.ToString());
        }
    }
}
