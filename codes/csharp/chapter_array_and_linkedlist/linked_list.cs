// File: linked_list.cs
// Created Time: 2022-12-16
// Author: mingXta (1195669834@qq.com)

using hello_algo.include;
using NUnit.Framework;

namespace hello_algo.chapter_array_and_linkedlist
{
    public class linked_list
    {
        /* 在链表的结点 n0 之后插入结点 P */
        public static void Insert(ListNode n0, ListNode P)
        {
            ListNode? n1 = n0.next;
            n0.next = P;
            P.next = n1;
        }

        /* 删除链表的结点 n0 之后的首个结点 */
        public static void Remove(ListNode n0)
        {
            if (n0.next == null)
                return;
            // n0 -> P -> n1
            ListNode P = n0.next;
            ListNode? n1 = P.next;
            n0.next = n1;
        }

        /* 访问链表中索引为 index 的结点 */
        public static ListNode? Access(ListNode head, int index)
        {
            for (int i = 0; i < index; i++)
            {
                if (head == null)
                    return null;
                head = head.next;
            }
            return head;
        }

        /* 在链表中查找值为 target 的首个结点 */
        public static int Find(ListNode head, int target)
        {
            int index = 0;
            while (head != null)
            {
                if (head.val == target)
                    return index;
                head = head.next;
                index++;
            }
            return -1;
        }


        [Test]
        public void Test()
        {
            // 初始化链表 
            // 初始化各个结点 
            ListNode n0 = new ListNode(1);
            ListNode n1 = new ListNode(3);
            ListNode n2 = new ListNode(2);
            ListNode n3 = new ListNode(5);
            ListNode n4 = new ListNode(4);
            // 构建引用指向
            n0.next = n1;
            n1.next = n2;
            n2.next = n3;
            n3.next = n4;
            Console.WriteLine($"初始化的链表为{n0}");

            // 插入结点 
            Insert(n0, new ListNode(0));
            Console.WriteLine($"插入结点后的链表为{n0}");

            // 删除结点 
            Remove(n0);
            Console.WriteLine($"删除结点后的链表为{n0}");

            // 访问结点 
            ListNode? node = Access(n0, 3);
            Console.WriteLine($"链表中索引 3 处的结点的值 = {node?.val}");

            // 查找结点 
            int index = Find(n0, 2);
            Console.WriteLine($"链表中值为 2 的结点的索引 = {index}");    
        }
    }
}
