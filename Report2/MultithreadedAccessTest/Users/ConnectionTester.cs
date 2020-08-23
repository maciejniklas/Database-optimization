using MultithreadedAccessTest.Database;
using System.Threading;

namespace MultithreadedAccessTest.Users
{
    public class ConnectionTester : AbstractUser
    {
        private int id;
        private int timeMilliseconds;
        private ManualResetEvent sentinel;

        public ConnectionTester(IDatabase database) : base(database) { }

        public void Initialize(int id, int timeMilliseconds, ref ManualResetEvent sentinel)
        {
            this.id = id;
            this.timeMilliseconds = timeMilliseconds;
            this.sentinel = sentinel;
        }

        protected override void WorkProcedure()
        {
            lock(sentinel)
            {
                sentinel.WaitOne();
            }

            database.Connection.Open();

            Message($"The thread {id} connected to the database.");

            Thread.Sleep(timeMilliseconds);

            database.Connection.Close();

            Message($"The thread {id} closed connection to the database.");
        }
    }
}
