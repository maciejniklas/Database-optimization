using MultithreadedAccessTest.Database;
using System;

namespace MultithreadedAccessTest
{
    class Program
    {
        static void Main(string[] args)
        {
            TestAttemptHandler test = new TestAttemptHandler();

            test.OptimicticConcurrency();

            Console.WriteLine("Press any kley to exit.");
            Console.ReadKey();
        }
    }
}
