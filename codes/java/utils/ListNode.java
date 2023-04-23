/**
 * File: ListNode.java
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

package utils;

/* Definition for a singly-linked list node */
public class ListNode {
    public int val;
    public ListNode next;

    public ListNode(int x) {
        val = x;
    }

    /* Generate a linked list with an array */
    public static ListNode arrToLinkedList(int[] arr) {
        ListNode dum = new ListNode(0);
        ListNode head = dum;
        for (int val : arr) {
            head.next = new ListNode(val);
            head = head.next;
        }
        return dum.next;
    }

    /* Get a list node with specific value from a linked list */
    public static ListNode getListNode(ListNode head, int val) {
        while (head != null && head.val != val) {
            head = head.next;
        }
        return head;
    }
}
