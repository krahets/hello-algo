/**
 * File: linked_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 在鏈結串列的節點 n0 之後插入節點 P */
func insert(n0: ListNode, P: ListNode) {
    let n1 = n0.next
    P.next = n1
    n0.next = P
}

/* 刪除鏈結串列的節點 n0 之後的首個節點 */
func remove(n0: ListNode) {
    if n0.next == nil {
        return
    }
    // n0 -> P -> n1
    let P = n0.next
    let n1 = P?.next
    n0.next = n1
}

/* 訪問鏈結串列中索引為 index 的節點 */
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

/* 在鏈結串列中查詢值為 target 的首個節點 */
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
        /* 初始化鏈結串列 */
        // 初始化各個節點
        let n0 = ListNode(x: 1)
        let n1 = ListNode(x: 3)
        let n2 = ListNode(x: 2)
        let n3 = ListNode(x: 5)
        let n4 = ListNode(x: 4)
        // 構建節點之間的引用
        n0.next = n1
        n1.next = n2
        n2.next = n3
        n3.next = n4
        print("初始化的鏈結串列為")
        PrintUtil.printLinkedList(head: n0)

        /* 插入節點 */
        insert(n0: n0, P: ListNode(x: 0))
        print("插入節點後的鏈結串列為")
        PrintUtil.printLinkedList(head: n0)

        /* 刪除節點 */
        remove(n0: n0)
        print("刪除節點後的鏈結串列為")
        PrintUtil.printLinkedList(head: n0)

        /* 訪問節點 */
        let node = access(head: n0, index: 3)
        print("鏈結串列中索引 3 處的節點的值 = \(node!.val)")

        /* 查詢節點 */
        let index = find(head: n0, target: 2)
        print("鏈結串列中值為 2 的節點的索引 = \(index)")
    }
}
