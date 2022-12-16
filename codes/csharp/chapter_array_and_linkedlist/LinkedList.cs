// File: LinkedList.cs
// Created Time: 2022-12-16
// Author: mingXta (1195669834@qq.com)

using hello_algo.include;

namespace hello_algo.chapter_array_and_linkedlist
{
    public class LinkedList
    {
        /// <summary>
        /// 在链表的结点 n0 之后插入结点 P
        /// </summary>
        public static void Insert(ListNode n0, ListNode P)
        {
            ListNode n1 = n0.next;
            n0.next = P;
            P.next = n1;
        }

        /// <summary>
        /// 删除链表的结点 n0 之后的首个结点
        /// </summary>
        public static void Remove(ListNode n0)
        {
            if (n0.next == null)
                return;
            // n0 -> P -> n1
            ListNode P = n0.next;
            ListNode n1 = P.next;
            n0.next = n1;
        }

        /// <summary>
        /// 访问链表中索引为 index 的结点
        /// </summary>
        public static ListNode Access(ListNode head, int index)
        {
            for (int i = 0; i < index; i++)
            {
                head = head.next;
                if (head == null)
                    return null;
            }
            return head;
        }

        /// <summary>
        /// 在链表中查找值为 target 的首个结点
        /// </summary>
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
    }
}