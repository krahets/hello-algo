// File: ListNode.cs
// Created Time: 2022-12-16
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.utils;

// [region]{list_node}
/* 연결 리스트 노드 */
public class ListNode(int x) {
    public int val = x;    // 노드 값
    public ListNode? next; // 다음 노드를 가리키는 참조
// [endregion]{list_node}

    /* 배열을 역직렬화하여 연결 리스트로 변환한다 */
    public static ListNode? ArrToLinkedList(int[] arr) {
        ListNode dum = new(0);
        ListNode head = dum;
        foreach (int val in arr) {
            head.next = new ListNode(val);
            head = head.next;
        }
        return dum.next;
    }

    public override string? ToString() {
        List<string> list = [];
        var head = this;
        while (head != null) {
            list.Add(head.val.ToString());
            head = head.next;
        }
        return string.Join("->", list);
    }
// [region]{list_node_end}
}
// [endregion]{list_node_end}
