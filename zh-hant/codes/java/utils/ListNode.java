/**
 * File: ListNode.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package utils;

// [region]{list_node}
/* 鏈結串列節點 */
public class ListNode {
    public int val;       // 節點值
    public ListNode next; // 指向下一節點的引用

    public ListNode(int x) {
        val = x;
    }
// [endregion]{list_node}

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
// [region]{list_node_end}
}
// [endregion]{list_node_end}
