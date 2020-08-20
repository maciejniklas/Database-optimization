using MultithreadedAccessTest.Database;
using System;

namespace MultithreadedAccessTest.Factory
{
    internal class DatabaseFactory : IFactory<IDatabase>
    {
        private DatabaseType type;

        public DatabaseFactory(DatabaseType type)
        {
            this.type = type;
        }

        public IDatabase Get()
        {
            switch (type)
            {
                case DatabaseType.MicrosoftSQL:
                    return new MicrosoftSQLDatabase();
            }

            return null;
        }

        public void SelectType(Enum type)
        {
            type = (DatabaseType)type;
        }
    }
}
