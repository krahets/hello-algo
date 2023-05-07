// File: ListNode.cs
// Created Time: 2022-12-16
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.utils;

/* Definition for a singly-linked list node */
public class ListNode {
    public int val;
    public ListNode? next;

    public ListNode(int x) {
        val = x;
    }

    /* Generate a linked list with an array */
    public static ListNode? ArrToLinkedList(int[] arr) {
        ListNode dum = new ListNode(0);
        ListNode head = dum;
        foreach (int val in arr) {
            head.next = new ListNode(val);
            head = head.next;
        }
        return dum.next;
    }

    /* Get a list node with specific value from a linked list */
    public static ListNode? GetListNode(ListNode? head, int val) {
        while (head != null && head.val != val) {
            head = head.next;
        }
        return head;
    }

    public override string? ToString() {
        List<string> list = new();
        var head = this;
        while (head != null) {
            list.Add(head.val.ToString());
            head = head.next;
        }
        return string.Join("->", list);
    }
}
