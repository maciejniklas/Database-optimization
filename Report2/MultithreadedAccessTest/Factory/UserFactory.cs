using MultithreadedAccessTest.Database;
using MultithreadedAccessTest.Users;
using System;

namespace MultithreadedAccessTest.Factory
{
    public class UserFactory : IFactory<AbstractUser>
    {
        private IFactory<IDatabase> databaseFactory;

        private UserType userType;

        public UserFactory(UserType userType, DatabaseType databaseType)
        {
            this.userType = userType;
            databaseFactory = new DatabaseFactory(databaseType);
        }

        public AbstractUser Get()
        {
            switch(userType)
            {
                case UserType.BrewerFirst:
                    return new BrewerFirst(databaseFactory.Get());

                case UserType.BrewerSecondd:
                    return new BrewerSecond(databaseFactory.Get());
            }

            return null;
        }

        public void SelectType(Enum type)
        {
            userType = (UserType)type;
        }
    }
}
