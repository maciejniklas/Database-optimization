namespace MultithreadedAccessTest.Users
{
    public interface IUser
    {
        void Coffee(int milliseconds);
        void Message(string message);
        void Work();
    }
}
