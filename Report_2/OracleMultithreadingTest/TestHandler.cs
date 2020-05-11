using OracleMultithreadingTest.Users;
using System;
using System.Collections.Generic;
using System.Threading;

namespace OracleMultithreadingTest
{
    static class TestHandler
    {
        public static int ThreadCounter
        {
            get
            {
                threadCounter++;
                return threadCounter;
            }
        }

        public static ManualResetEvent sentinel = new ManualResetEvent(false);

        private static int threadCounter = 0;

        public static void AccessPointAmountExample()
        {
            Console.WriteLine("Enter threads amount: ");
            int threadsAmount = int.Parse(Console.ReadLine());

            List<AbstractUser> users = new List<AbstractUser>();
            List<Thread> threads = new List<Thread>();

            for(int index = 0; index < threadsAmount; index++)
            {
                users.Add(UserFactory.Instance.Create(UserType.AccessPointAmountTester));
            }

            users.ForEach(item =>
            {
                Thread thread = new Thread(new ThreadStart(item.StartWork));
                threads.Add(thread);
                thread.Start();
            });

            Thread.Sleep(10000);

            TestHandler.sentinel.Set();

            threads.ForEach(item => item.Join());

            Console.WriteLine("\nAny issue happend\n");
        }

        public static void ConcurrencyFirstExample()
        {
            List<AbstractUser> users = new List<AbstractUser>();
            List<Thread> threads = new List<Thread>();

            users.Add(UserFactory.Instance.Create(UserType.Brewer1));
            users.Add(UserFactory.Instance.Create(UserType.Brewer2));

            users.ForEach(item =>
            {
                Thread thread = new Thread(new ThreadStart(item.StartWork));
                threads.Add(thread);
                thread.Start();
            });

            threads.ForEach(item => item.Join());
        }

        public static void ConcurrencySecondExample()
        {
            List<AbstractUser> users = new List<AbstractUser>();
            List<Thread> threads = new List<Thread>();

            users.Add(UserFactory.Instance.Create(UserType.BreweryOwner));
            users.Add(UserFactory.Instance.Create(UserType.DatabaseAdmin));

            users.ForEach(item =>
            {
                Thread thread = new Thread(new ThreadStart(item.StartWork));
                threads.Add(thread);
                thread.Start();
            });

            threads.ForEach(item => item.Join());
        }
    }
}
