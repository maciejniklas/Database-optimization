using Microsoft.Data.SqlClient;
using System;

namespace MultithreadedAccessTest
{
    public class MicrosoftSQLDatabase : AbstractDatabase
    {
        private SqlConnection connection;

        // For localhost, windows authenticated connection
        public MicrosoftSQLDatabase()
        {
            string connectionString = "Server=localhost;Database=BreweriesDatabase;Trusted_Connection=True;";

            connection = new SqlConnection(connectionString);
        }

        public override void TestConnection()
        {
            try
            {
                connection.Open();

                Console.WriteLine($"Database: {connection.Database}");
                Console.WriteLine($"State: {connection.State}");
            }
            catch(Exception exception)
            {
                HandleException(exception);
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
