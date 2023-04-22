/**
 * File: ListNode.swift
 * Created Time: 2023-01-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

public class ListNode {
    public var val: Int // 节点值
    public var next: ListNode? // 后继节点引用

    public init(x: Int) {
        val = x
    }

    public static func arrToLinkedList(arr: [Int]) -> ListNode? {
        let dum = ListNode(x: 0)
        var head: ListNode? = dum
        for val in arr {
            head?.next = ListNode(x: val)
            head = head?.next
        }
        return dum.next
    }
}
