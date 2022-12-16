// File: LinkedListTest.cs
// Created Time: 2022-12-16
// Author: mingXta (1195669834@qq.com)

using hello_algo.chapter_array_and_linkedlist;
using hello_algo.include;
using NUnit.Framework;

namespace hello_algo.test.chapter_array_and_linkedlist
{
    [TestFixture]
    internal class LinkedListTest
    {
        private ListNode n0;
        private ListNode n1;
        private ListNode n2;
        private ListNode n3;
        private ListNode n4;

        [SetUp]
        public void SetUp()
        {
            // 初始化各结点
            n0 = new ListNode(1);
            n1 = new ListNode(3);
            n2 = new ListNode(2);
            n3 = new ListNode(5);
            n4 = new ListNode(4);
            // 构建引用指向
            n0.next = n1;
            n1.next = n2;
            n2.next = n3;
            n3.next = n4;
        }

        [Test]
        public void CheckInit()
        {
            // 检查初始化是否正确
            Console.WriteLine($"初始化的链表为{n0}");
            Assert.AreEqual(n0.ToString(), "1->3->2->5->4");
        }

        [Test]
        public void TestInsert()
        {
            // 插入结点
            LinkedList.Insert(n0, new ListNode(0));
            Console.WriteLine($"插入结点后的链表为{n0}");
            Assert.AreEqual(n0.ToString(), "1->0->3->2->5->4");
        }

        [Test]
        public void TestRemove()
        {
            // 删除结点
            LinkedList.Remove(n0);
            Console.WriteLine($"删除节点后的链表为{n0}");
            Assert.AreEqual(n0.ToString(), "1->2->5->4");
        }

        [Test]
        public void TestAccess()
        {
            // 访问结点
            var node = LinkedList.Access(n0, 3);
            Console.WriteLine($"链表中索引 3 处的结点的值 ={node.val}");
            Assert.AreEqual(node.val, 5);
        }

        [Test]
        public void TestFind()
        {
            // 查找结点
            int index = LinkedList.Find(n0, 2);
            Console.WriteLine($"链表中值为 2 的结点的索引 = {index}");
            Assert.AreEqual(index, 2);
        }
    }
}