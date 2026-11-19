/**
 * File: ListNode.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package utils;

// [region]{list_node}
/* 連結リストのノード */
public class ListNode {
    public int val;       // ノードの値
    public ListNode next; // 次のノードへの参照

    public ListNode(int x) {
        val = x;
    }
// [endregion]{list_node}

    /* リストをデシリアライズして連結リストにする */
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
