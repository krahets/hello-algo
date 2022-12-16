// File: ArrayTest.cs
// Created Time: 2022-12-16
// Author: mingXta (1195669834@qq.com)

using NUnit.Framework;
using Array = hello_algo.chapter_array_and_linkedlist.Array;

namespace hello_algo.test.chapter_array_and_linkedlist
{
    [TestFixture]
    internal class ArrayTest
    {
        private int[] nums;

        [SetUp]
        public void setup()
        {
            // 初始化数组
            nums = new int[] { 1, 3, 2, 5, 4 };
        }

        [Test]
        public void TestRandomAccess()
        {
            // 随机访问
            int randomNum = Array.RandomAccess(nums);
            Console.WriteLine($"在 nums 中获取随机元素 {randomNum}");
            Assert.Contains(randomNum, nums);
        }

        [Test]
        public void TestExtend()
        {
            // 长度扩展
            int[] target = { 1, 3, 2, 5, 4, 0, 0, 0 };
            nums = Array.Extend(nums, 3);
            Console.WriteLine($"将数组长度扩展至 8 ，得到 nums = {Array.ToString(nums)}");
            Assert.AreEqual(target, nums);
        }

        [Test]
        public void TestInsert()
        {
            // 插入元素
            int[] target = { 1, 3, 2, 6, 5 };
            Array.Insert(nums, 6, 3);
            Console.WriteLine($"在索引 3 处插入数字 6 ，得到 nums = {Array.ToString(nums)}");
            Assert.AreEqual(target, nums);
        }

        [Test]
        public void TestRemove()
        {
            // 删除元素
            int[] target = { 1, 3, 5, 4, 4 };
            Array.Remove(nums, 2);
            Console.WriteLine($"删除索引 2 处的元素，得到 nums = {Array.ToString(nums)}");
            Assert.AreEqual(target, nums);
        }

        [Test]
        public void TestFind()
        {
            // 查找元素
            int index = Array.Find(nums, 3);
            Console.WriteLine("在 nums 中查找元素 3 , 得到索引 = " + index);
            Assert.AreEqual(1, index);
        }
    }
}