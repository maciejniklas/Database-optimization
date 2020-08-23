using Microsoft.Data.SqlClient;
using System;
using System.Collections;
using System.Data;
using System.Data.Common;
using System.Threading;

namespace MultithreadedAccessTest.Database
{
    public class MicrosoftSQLDatabase : IDatabase
    {
        public DbConnection Connection
        {
            get
            {
                return connection;
            }
        }

        private SqlConnection connection;

        public MicrosoftSQLDatabase()
        {
            connection = new SqlConnection(CustomConnectionString.ConnectionString);
        }

        public DataTable Select(string sqlStatement)
        {
            try
            {
                DataTable data = new DataTable();

                connection.Open();

                using(SqlCommand command = new SqlCommand(sqlStatement, connection))
                {
                    using(SqlDataReader reader = command.ExecuteReader())
                    {
                        data.Load(reader);
                    }
                }

                return data;
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
            }
            finally
            {
                connection.Close();
            }

            return null;
        }

        public void TestConnection()
        {
            try
            {
                connection.Open();

                Console.WriteLine("Connection established");
                Console.WriteLine($"Database name: {connection.Database}");

                IDictionary statistics = connection.RetrieveStatistics();

                Console.WriteLine($"Connection time: {statistics["ConnectionTime"]}");
                Console.WriteLine($"Network server time: {statistics["NetworkServerTime"]}");
            }
            catch(Exception exception)
            {
                Console.WriteLine(exception);
            }
            finally
            {
                connection.Close();
            }
        }

        public void Update(string sqlStatement)
        {
            try
            {
                DataTable data = new DataTable();

                connection.Open();

                using (SqlCommand command = new SqlCommand(sqlStatement, connection))
                {
                    command.ExecuteNonQuery();
                }
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
