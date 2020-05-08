using OracleMultithreadingTest.Users;
using System;
using System.Collections.Generic;
using System.Threading;

namespace OracleMultithreadingTest
{
    class Program
    {
        static void Main(string[] args)
        {
            List<AbstractUser> users = new List<AbstractUser>();
            List<Thread> threads = new List<Thread>();

            //users.Add(UserFactory.Instance.Create(UserType.ConnectionTester));
            users.Add(UserFactory.Instance.Create(UserType.Brewer1));
            users.Add(UserFactory.Instance.Create(UserType.Brewer2));

            users.ForEach(item =>
            {
                Thread thread = new Thread(new ThreadStart(item.StartWork));
                threads.Add(thread);
                thread.Start();
            });

            threads.ForEach(item => item.Join());

            Console.WriteLine("Press any key to exit.");
            Console.ReadKey();
        }
    }
}
