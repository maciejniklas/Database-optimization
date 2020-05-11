using Oracle.ManagedDataAccess.Client;
using System;
using System.Data;

namespace OracleMultithreadingTest
{
    class DatabaseHandler : IDatabase
    {
        private OracleConnection connection;

        public DatabaseHandler()
        {
            connection = new OracleConnection();
            connection.ConnectionString = ConnectionStringBuilder.ConnectionString;
        }

        public void CloseConnection()
        {
            connection.Close();
        }

        private void HandleException(Exception exception)
        {
            if (connection.State == System.Data.ConnectionState.Open)
            {
                connection.Close();
            }

            Console.WriteLine("EXCEPTION OCCURED!");
            Console.WriteLine("Message:");
            Console.WriteLine(exception.Message);
            Console.WriteLine("Trace:");
            Console.WriteLine(exception.StackTrace);
        }

        public void Modify(string statement, params object[] parameters)
        {
            try
            {
                connection.Open();

                OracleCommand command = new OracleCommand();
                command.Connection = connection;
                command.CommandText = statement;
                command.CommandType = CommandType.Text;

                if(parameters != null)
                {
                    for (int index = 0; index < parameters.Length; index++)
                    {
                        command.Parameters.Add(":param" + index.ToString(), parameters[index]);
                    }
                }

                command.ExecuteNonQuery();

                command.CommandText = "COMMIT";
                command.ExecuteNonQuery();

                connection.Close();
            }
            catch (Exception exception)
            {
                HandleException(exception);
            }
        }

        public void OpenConnection()
        {
            connection.Open();
        }

        public DataTable Read(string statement)
        {
            DataTable data = new DataTable();

            try
            {
                connection.Open();

                OracleCommand command = new OracleCommand();
                command.Connection = connection;
                command.CommandText = statement;
                command.CommandType = CommandType.Text;

                OracleDataReader reader = command.ExecuteReader();

                data.Load(reader);

                connection.Close();
            }
            catch (Exception exception)
            {
                HandleException(exception);
            }

            return data;
        }

        public void TestConnection()
        {
            try
            {
                DataTable data = new DataTable();

                connection.Open();

                OracleGlobalization globalization = connection.GetSessionInfo();

                Console.WriteLine("Date format: {0}", globalization.DateFormat);
                Console.WriteLine("Language: {0}", globalization.Language);
                Console.WriteLine("Territory: {0}", globalization.Territory);

                OracleCommand command = new OracleCommand();
                command.Connection = connection;
                command.CommandText = "SELECT table_name FROM user_tables";
                command.CommandType = CommandType.Text;

                OracleDataReader reader = command.ExecuteReader();
                data.Load(reader);

                connection.Close();

                foreach (DataRow row in data.Rows)
                {
                    foreach (DataColumn column in data.Columns)
                    {
                        Console.WriteLine(row[column].ToString());
                    }
                }
            }
            catch (Exception exception)
            {
                HandleException(exception);
            }
        }
    }
}
