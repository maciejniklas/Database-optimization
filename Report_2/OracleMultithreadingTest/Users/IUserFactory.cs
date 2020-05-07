namespace OracleMultithreadingTest.Users
{
    interface IUserFactory
    {
        AbstractUser Create(UserType type);
    }
}
