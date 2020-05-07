namespace OracleMultithreadingTest
{
    abstract class AbstractUser
    {
        protected IDatabase database;

        protected AbstractUser()
        {
            database = DatabaseFactory.Instance.Create();
        }

        public abstract void StartWork();
    }
}
