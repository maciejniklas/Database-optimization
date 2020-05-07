using OracleMultithreadingTest.Users;
using System;

namespace OracleMultithreadingTest
{
    class Program
    {
        static void Main(string[] args)
        {
            AbstractUser user = UserFactory.Instance.Create(UserType.CommonDataReader);
            user.StartWork();

            Console.WriteLine("Press any key to exit.");
            Console.ReadKey();
        }
    }
}
