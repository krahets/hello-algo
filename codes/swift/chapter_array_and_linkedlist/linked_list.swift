/**
 * File: linked_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 在链表的节点 n0 之后插入节点 P */
func insert(n0: ListNode, P: ListNode) {
    let n1 = n0.next
    P.next = n1
    n0.next = P
}

/* 删除链表的节点 n0 之后的首个节点 */
func remove(n0: ListNode) {
    if n0.next == nil {
        return
    }
    // n0 -> P -> n1
    let P = n0.next
    let n1 = P?.next
    n0.next = n1
}

/* 访问链表中索引为 index 的节点 */
func access(head: ListNode, index: Int) -> ListNode? {
    var head: ListNode? = head
    for _ in 0 ..< index {
        if head == nil {
            return nil
        }
        head = head?.next
    }
    return head
}

/* 在链表中查找值为 target 的首个节点 */
func find(head: ListNode, target: Int) -> Int {
    var head: ListNode? = head
    var index = 0
    while head != nil {
        if head?.val == target {
            return index
        }
        head = head?.next
        index += 1
    }
    return -1
}

@main
enum LinkedList {
    /* Driver Code */
    static func main() {
        /* 初始化链表 */
        // 初始化各个节点
        let n0 = ListNode(x: 1)
        let n1 = ListNode(x: 3)
        let n2 = ListNode(x: 2)
        let n3 = ListNode(x: 5)
        let n4 = ListNode(x: 4)
        // 构建节点之间的引用
        n0.next = n1
        n1.next = n2
        n2.next = n3
        n3.next = n4
        print("初始化的链表为")
        PrintUtil.printLinkedList(head: n0)

        /* 插入节点 */
        insert(n0: n0, P: ListNode(x: 0))
        print("插入节点后的链表为")
        PrintUtil.printLinkedList(head: n0)

        /* 删除节点 */
        remove(n0: n0)
        print("删除节点后的链表为")
        PrintUtil.printLinkedList(head: n0)

        /* 访问节点 */
        let node = access(head: n0, index: 3)
        print("链表中索引 3 处的节点的值 = \(node!.val)")

        /* 查找节点 */
        let index = find(head: n0, target: 2)
        print("链表中值为 2 的节点的索引 = \(index)")
    }
}
