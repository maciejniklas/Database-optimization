﻿using System;

namespace OracleMultithreadingTest.Users
{
    sealed class UserFactory : IUserFactory
    {
        public static UserFactory Instance
        {
            get
            {
                if (instance == null)
                {
                    lock (padlock)
                    {
                        if (instance == null)
                        {
                            instance = new UserFactory();
                        }
                    }
                }

                return instance;
            }
        }

        private static UserFactory instance;
        private static readonly object padlock = new object();

        private UserFactory() { }

        public AbstractUser Create(UserType type = UserType.ConnectionTester)
        {
            switch(type)
            {
                case UserType.ConnectionTester:
                    return new ConnectionTester();
                case UserType.CommonDataReader:
                    return new CommonDataReader();
                default:
                    Console.WriteLine("Unknown user type {0}!", type);
                    break;
            }

            return null;
        }
    }
}