namespace MultithreadedAccessTest.Database
{
    internal class CustomConnectionString
    {
        public static string ConnectionString
        {
            get
            {
                return "Server=localhost;Database=BreweriesDatabase;Trusted_Connection=True;";
            }
        }
    }
}
