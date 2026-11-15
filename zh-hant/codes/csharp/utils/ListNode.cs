// File: ListNode.cs
// Created Time: 2022-12-16
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.utils;

// [region]{list_node}
/* 鏈結串列節點 */
public class ListNode(int x) {
    public int val = x;    // 節點值
    public ListNode? next; // 指向下一節點的引用
// [endregion]{list_node}

    /* 將陣列反序列化為鏈結串列 */
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
