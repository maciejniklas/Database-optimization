using System;

namespace MultithreadedAccessTest
{
    class Program
    {
        static void Main(string[] args)
        {
            AbstractDatabase database = new MicrosoftSQLDatabase();

            database.TestConnection();

            Console.WriteLine("Press any kley to exit.");
            Console.ReadKey();
        }
    }
}
