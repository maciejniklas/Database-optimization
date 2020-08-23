using System;
using System.Threading;

namespace MultithreadedAccessTest
{
    class Program
    {
        static void Main(string[] args)
        {
            TestAttemptHandler test = new TestAttemptHandler();

            test.OptimicticConcurrency();

            Thread.CurrentThread.Join();

            Console.WriteLine("Press any kley to exit.");
            Console.ReadKey();
        }
    }
}
