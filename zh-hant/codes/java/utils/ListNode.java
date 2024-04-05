/**
 * File: ListNode.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package utils;

/* 鏈結串列節點 */
public class ListNode {
    public int val;
    public ListNode next;

    public ListNode(int x) {
        val = x;
    }

    /* 將串列反序列化為鏈結串列 */
    public static ListNode arrToLinkedList(int[] arr) {
        ListNode dum = new ListNode(0);
        ListNode head = dum;
        for (int val : arr) {
            head.next = new ListNode(val);
            head = head.next;
        }
        return dum.next;
    }
}
