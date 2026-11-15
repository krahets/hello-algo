/**
 * File: ListNode.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package utils;

// [region]{list_node}
/* 链表节点 */
public class ListNode {
    public int val;       // 节点值
    public ListNode next; // 指向下一节点的引用

    public ListNode(int x) {
        val = x;
    }
// [endregion]{list_node}

    /* 将列表反序列化为链表 */
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
