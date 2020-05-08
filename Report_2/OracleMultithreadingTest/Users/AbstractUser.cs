using System;
using System.Linq;

namespace OracleMultithreadingTest
{
    abstract class AbstractUser
    {
        protected IDatabase database;
        protected string username;

        protected AbstractUser()
        {
            database = DatabaseFactory.Instance.Create();
            username = GetType().ToString().Split('.').Last();
        }

        protected void Communicate(string message)
        {
            Console.WriteLine("{0}: {1}", username, message);
        }

        public abstract void StartWork();
    }
}
