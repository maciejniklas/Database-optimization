namespace OracleMultithreadingTest.Users
{
    class Brewer2 : Brewer
    {
        public Brewer2() : base(-0.1f) { }

        public override void StartWork()
        {
            base.StartWork();

            Communicate("What the hell?!");
        }
    }
}
