// File: ListNode.cs
// Created Time: 2022-12-16
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.utils;

// [region]{list_node}
/* 連結リストのノード */
public class ListNode(int x) {
    public int val = x;    // ノードの値
    public ListNode? next; // 次のノードへの参照
// [endregion]{list_node}

    /* 配列をデシリアライズして連結リストにする */
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
