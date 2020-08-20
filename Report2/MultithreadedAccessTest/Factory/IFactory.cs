using System;
using System.Windows.Forms;

namespace MultithreadedAccessTest.Factory
{
    internal interface IFactory<T>
    {
        T Get();
        void SelectType(Enum type);
    }
}
