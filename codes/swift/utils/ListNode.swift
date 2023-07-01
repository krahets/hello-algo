/**
 * File: ListNode.swift
 * Created Time: 2023-01-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

public class ListNode: Hashable {
    public var val: Int // 节点值
    public var next: ListNode? // 后继节点引用

    public init(x: Int) {
        val = x
    }

    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val == rhs.val && lhs.next.map { ObjectIdentifier($0) } == rhs.next.map { ObjectIdentifier($0) }
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(next.map { ObjectIdentifier($0) })
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
