using MultithreadedAccessTest.Factory;
using MultithreadedAccessTest.Users;
using System;
using System.Threading;

namespace MultithreadedAccessTest
{
    public class TestAttemptHandler
    {
        public static object outputSentinel;

        private IFactory<AbstractUser> userFactory;

        public TestAttemptHandler()
        {
            userFactory = new UserFactory(UserType.BrewerFirst, Database.DatabaseType.MicrosoftSQL);
            outputSentinel = new object();
        }

        public void ConnectionPointsAmount()
        {
            ManualResetEvent sentinel = new ManualResetEvent(false);

            userFactory.SelectType(UserType.ConnectionTester);

            Console.Write("Threads amount: ");
            int threadsAmount = int.Parse(Console.ReadLine());

            Console.Write("Time, in milliseconds, while connection will be held: ");
            int time = int.Parse(Console.ReadLine());

            for(int index = 0; index < threadsAmount; index++)
            {
                ConnectionTester tester = userFactory.Get() as ConnectionTester;

                tester.Initialize(index, time, ref sentinel);
                tester.Work();
            }

            sentinel.Set();
        }

        public void OptimicticConcurrency()
        {
            userFactory.SelectType(UserType.BrewerFirst);
            AbstractUser first = userFactory.Get();

            userFactory.SelectType(UserType.BrewerSecondd);
            AbstractUser second = userFactory.Get();

            first.Work();
            second.Work();
        }
    }
}
