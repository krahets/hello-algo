// File: ListNode.cs
// Created Time: 2022-12-16
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.include
{
    /// <summary>
    /// Definition for a singly-linked list node
    /// </summary>
    public class ListNode
    {
        public int val;
        public ListNode? next;

        /// <summary>
        /// Generate a linked list with an array
        /// </summary>
        /// <param name="x"></param>
        public ListNode(int x)
        {
            val = x;
        }

        /// <summary>
        /// Generate a linked list with an array
        /// </summary>
        /// <param name="arr"></param>
        /// <returns></returns>
        public static ListNode? ArrToLinkedList(int[] arr)
        {
            ListNode dum = new ListNode(0);
            ListNode head = dum;
            foreach (int val in arr)
            {
                head.next = new ListNode(val);
                head = head.next;
            }
            return dum.next;
        }

        /// <summary>
        /// Get a list node with specific value from a linked list
        /// </summary>
        /// <param name="head"></param>
        /// <param name="val"></param>
        /// <returns></returns>
        public static ListNode? GetListNode(ListNode? head, int val)
        {
            while (head != null && head.val != val)
            {
                head = head.next;
            }
            return head;
        }

        public override string? ToString()
        {
            List<string> list = new();
            var head = this;
            while (head != null)
            {
                list.Add(head.val.ToString());
                head = head.next;
            }
            return string.Join("->", list);
        }
    }
}