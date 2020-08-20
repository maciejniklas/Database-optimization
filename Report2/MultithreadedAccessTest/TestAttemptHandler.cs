using MultithreadedAccessTest.Factory;
using MultithreadedAccessTest.Users;
using System.Threading;

namespace MultithreadedAccessTest
{
    public class TestAttemptHandler
    {
        private IFactory<AbstractUser> userFactory;

        public TestAttemptHandler()
        {
            userFactory = new UserFactory(UserType.BrewerFirst, Database.DatabaseType.MicrosoftSQL);
        }

        public void OptimicticConcurrency()
        {
            userFactory.SelectType(UserType.BrewerFirst);
            AbstractUser first = userFactory.Get();

            userFactory.SelectType(UserType.BrewerSecondd);
            AbstractUser second = userFactory.Get();

            first.Work();
            second.Work();
        }
    }
}
