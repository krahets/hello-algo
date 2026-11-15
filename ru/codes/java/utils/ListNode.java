/**
 * File: ListNode.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package utils;

// [region]{list_node}
/* Узел связного списка */
public class ListNode {
    public int val;       // Значение узла
    public ListNode next; // Ссылка на следующий узел

    public ListNode(int x) {
        val = x;
    }
// [endregion]{list_node}

    /* Десериализовать список в связный список */
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
