using System;

namespace OracleMultithreadingTest
{
    class Program
    {
        static void Main(string[] args)
        {
            TestHandler.ConcurrencyFirstExample();
            Console.WriteLine();
            TestHandler.AccessPointAmountExample();
            Console.WriteLine();
            TestHandler.ConcurrencySecondExample();

            Console.WriteLine("Press any key to exit.");
            Console.ReadKey();
        }
    }
}
