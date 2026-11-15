/**
 * File: ListNode.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package utils;

// [region]{list_node}
/* Linked list node */
public class ListNode {
    public int val;       // Node value
    public ListNode next; // Reference to the next node

    public ListNode(int x) {
        val = x;
    }
// [endregion]{list_node}

    /* Deserialize an array into a linked list */
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
