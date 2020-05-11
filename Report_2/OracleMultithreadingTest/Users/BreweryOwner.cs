using System;
using System.Text;
using System.Threading;

namespace OracleMultithreadingTest.Users
{
    class BreweryOwner : AbstractUser
    {
        private string[] color = {
            "Alice Blue", "Antique White", "Aqua", "Aquamarine", "Azure", "Beige", "Bisque", "Black", "Blanched Almond", "Blue", "Blue Violet", "Brown", "Burly Wood", "Cadet Blue", "Chartreuse", "Chocolate", "Coral", "Cornflower Blue", "Cornsilk", "Crimson", "Cyan", "Dark Blue", "Dark Cyan", "Dark Golden Rod", "Dark Gray", "Dark Grey", "Dark Green", "Dark Khaki", "Dark Magenta", "Dark Olive Green", "Dark Orange", "Dark Orchid", "Dark Red", "Dark Salmon", "Dark Sea Green", "Dark Slate Blue", "Dark Slate Gray", "Dark Slate Grey", "Dark Turquoise", "Dark Violet", "Deep Pink", "Deep Sky Blue", "Dim Gray", "Dim Grey", "Dodger Blue", "Fire Brick", "Floral White", "Forest Green", "Fuchsia", "Gainsboro", "Ghost White", "Gold", "Golden Rod", "Gray", "Grey", "Green", "Green Yellow", "Honey Dew", "Hot Pink", "Indian Red", "Indigo", "Ivory", "Khaki", "Lavender", "Lavender Blush", "Lawn Green", "Lemon Chiffon", "Light Blue", "Light Coral", "Light Cyan", "Light Golden Rod Yellow", "Light Gray", "Light Grey", "Light Green", "Light Pink", "Light Salmon", "Light Sea Green", "Light Sky Blue", "Light Slate Gray", "Light Slate Grey", "Light Steel Blue", "Light Yellow", "Lime", "Lime Green", "Linen", "Magenta", "Maroon", "Medium Aqua Marine", "Medium Blue", "Medium Orchid", "Medium Purple", "Medium Sea Green", "Medium Slate Blue", "Medium Spring Green", "Medium Turquoise", "Medium Violet Red", "Midnight Blue", "Mint Cream", "Misty Rose", "Moccasin", "Navajo White", "Navy", "Old Lace", "Olive", "Olive Drab", "Orange", "Orange Red", "Orchid", "Pale Golden Rod", "Pale Green", "Pale Turquoise", "Pale Violet Red", "Papaya Whip", "Peach Puff", "Peru", "Pink", "Plum", "Powder Blue", "Purple", "Rebecca Purple", "Red", "Rosy Brown", "Royal Blue", "Saddle Brown", "Salmon", "Sandy Brown", "Sea Green", "Sea Shell", "Sienna", "Silver", "Sky Blue", "Slate Blue", "Slate Gray", "Slate Grey", "Snow", "Spring Green", "Steel Blue", "Tan", "Teal", "Thistle", "Tomato", "Turquoise", "Violet", "Wheat", "White", "White Smoke", "Yellow", "Yellow Green"
        };
        private string[] item = { "Bootle", "Can", "Cap", "Keg", "Mug", "Opener", "Box", "Kettle" };
        private string[] company = { "Brewery", "Firm", "Company", "Business", "Corporation", "Agency", "Institution", "Organization", "Concern", "Brewhouse" };
        private Random random;
        private string breweryName;

        public BreweryOwner() : base() 
        {
            random = new Random();

            StringBuilder builder = new StringBuilder();
            builder.Append(color[random.Next(color.Length)]);
            builder.Append(' ');
            builder.Append(item[random.Next(item.Length)]);
            builder.Append(' ');
            builder.Append(company[random.Next(company.Length)]);

            breweryName = builder.ToString();
        }

        public override void StartWork()
        {
            Communicate("I'm out of money and cannot pay my bills!");
            Communicate("Let me change my brewery name in database. I think that anyone find my brewery then.");
            Communicate("But first coffee");

            Thread.Sleep(2000);

            database.Modify("UPDATE Brewery SET breweryName = :param0 WHERE breweryID = 1501", new string[] { breweryName });

            Communicate("It's done. My brewery is safe with name " + breweryName);
        }
    }
}
