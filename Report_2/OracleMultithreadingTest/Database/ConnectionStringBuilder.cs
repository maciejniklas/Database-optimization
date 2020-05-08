using Oracle.ManagedDataAccess.Client;
using System;

namespace OracleMultithreadingTest
{
    static class ConnectionStringBuilder
    {
        public static string ConnectionString
        {
            get
            {
                if(connectionStringBuilder == null)
                {
                    connectionStringBuilder = new OracleConnectionStringBuilder();
                    Console.Write("Login: ");
                    connectionStringBuilder.UserID = "homeuser";// Console.ReadLine();

                    Console.Write("Password: ");
                    connectionStringBuilder.Password = "homepassword";// Console.ReadLine();

                    connectionStringBuilder.DataSource = defaultDataSource;
                    Console.WriteLine("CHANGE LOGIN METHOD BEFORE COMMIT");
                }

                return connectionStringBuilder.ConnectionString;
            }
        }

        public static string DataSource
        {
            set
            {
                if(connectionStringBuilder != null)
                {
                    connectionStringBuilder.DataSource = defaultDataSource;
                }
            }
        }

        private static OracleConnectionStringBuilder connectionStringBuilder;
        private static string defaultDataSource = "localhost:1521/xe";
    }
}
