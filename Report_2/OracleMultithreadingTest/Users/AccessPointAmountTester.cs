using System;
using System.Threading;

namespace OracleMultithreadingTest.Users
{
    class AccessPointAmountTester : AbstractUser
    {
        public AccessPointAmountTester() : base() { }

        public override void StartWork()
        {
            int threadNumber = TestHandler.ThreadCounter;

            database.OpenConnection();

            Console.WriteLine("Thread {0} starts connecting to database.", threadNumber);
            TestHandler.sentinel.WaitOne();

            database.CloseConnection();
            Console.WriteLine("Connection closed");
        }
    }
}
