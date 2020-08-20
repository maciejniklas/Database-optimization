using ConsoleTables;
using MultithreadedAccessTest.Database;
using System;
using System.Linq;
using System.Threading;

namespace MultithreadedAccessTest.Users
{
    public abstract class AbstractUser : IUser
    {
        protected string username;
        protected IDatabase database;
        protected ConsoleTable table;

        public AbstractUser(IDatabase database)
        {
            this.database = database;

            table = new ConsoleTable("Brewery name", "Beer style", "Alcohol percentage");

            username = GetType().ToString().Split('.').Last();
        }

        public void Coffee(int milliseconds)
        {
            Message("Cofee time!");

            Thread.Sleep(milliseconds);

            Message("It was really good.");
        }

        public virtual void Message(string message)
        {
            Console.ForegroundColor = ConsoleColor.Yellow;
            Console.Write($"{username}: ");

            Console.ResetColor();
            Console.WriteLine($"{message}");
        }

        public void Work()
        {
            Thread thread = new Thread(new ThreadStart(WorkProcedure));
            thread.Start();
        }

        protected abstract void WorkProcedure();
    }
}
