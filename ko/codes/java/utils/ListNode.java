/**
 * File: ListNode.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package utils;

// [region]{list_node}
/* 연결 리스트 노드 */
public class ListNode {
    public int val;       // 노드 값
    public ListNode next; // 다음 노드를 가리키는 참조

    public ListNode(int x) {
        val = x;
    }
// [endregion]{list_node}

    /* 리스트를 연결 리스트로 역직렬화 */
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
