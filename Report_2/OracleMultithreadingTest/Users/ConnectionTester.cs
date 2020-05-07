namespace OracleMultithreadingTest.Users
{
    class ConnectionTester : AbstractUser
    {
        public ConnectionTester() : base() { }

        public override void StartWork()
        {
            database.TestConnection();
        }
    }
}
