namespace OracleMultithreadingTest
{
    sealed class DatabaseFactory : IDatabaseFactory
    {
        public static DatabaseFactory Instance
        {
            get
            {
                if(instance == null)
                {
                    lock(padlock)
                    {
                        if(instance == null)
                        {
                            instance = new DatabaseFactory();
                        }
                    }
                }

                return instance;
            }
        }

        private static DatabaseFactory instance;
        private static readonly object padlock = new object();

        private DatabaseFactory() { }

        public IDatabase Create()
        {
            return new DatabaseHandler();
        }
    }
}
