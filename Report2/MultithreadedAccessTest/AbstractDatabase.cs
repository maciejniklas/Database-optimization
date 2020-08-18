using System;

namespace MultithreadedAccessTest
{
    public abstract class AbstractDatabase
    {
        public abstract void TestConnection();

        protected virtual void HandleException(Exception exception)
        {
            Console.WriteLine("EXCEPTION");
            Console.WriteLine(exception.Message);
            Console.WriteLine("TRACE");
            Console.WriteLine(exception.StackTrace);
        }
    }
}
