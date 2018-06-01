using System;
using NUnit.Framework;

namespace DemoApp1.Tests
{
    [TestFixture]
    public class UnitTest1
    {
        [Test]
        public void TestMethod1()
        {
            Class1 math = new Class1();
            int result = math.Add(12, 13);
            // TODO: Add your test code here
            Assert.AreEqual(25, result);
            Assert.Pass("Test Passing");
        }
		[Test]
        public void AddTest1()
        {
            Class1 math = new Class1();
            int result = math.Add(12, 14);
            Assert.AreEqual(26, result);
            Assert.Pass("Test Passing");
        }
    }
}
