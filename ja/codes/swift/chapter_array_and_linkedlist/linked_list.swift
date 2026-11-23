/**
 * File: linked_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 連結リストのノード n0 の直後にノード P を挿入する */
func insert(n0: ListNode, P: ListNode) {
    let n1 = n0.next
    P.next = n1
    n0.next = P
}

/* 連結リストのノード n0 の直後のノードを削除する */
func remove(n0: ListNode) {
    if n0.next == nil {
        return
    }
    // n0 -> P -> n1
    let P = n0.next
    let n1 = P?.next
    n0.next = n1
}

/* 連結リストのインデックス index にあるノードにアクセスする */
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

/* 連結リストから値が target である最初のノードを探索する */
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
    /* 実行用コード */
    static func main() {
        /* 連結リストを初期化する */
        // 各ノードを初期化する
        let n0 = ListNode(x: 1)
        let n1 = ListNode(x: 3)
        let n2 = ListNode(x: 2)
        let n3 = ListNode(x: 5)
        let n4 = ListNode(x: 4)
        // ノード間の参照を設定する
        n0.next = n1
        n1.next = n2
        n2.next = n3
        n3.next = n4
        print("初期化した連結リスト")
        PrintUtil.printLinkedList(head: n0)

        /* ノードを挿入する */
        insert(n0: n0, P: ListNode(x: 0))
        print("ノードを挿入した後の連結リスト")
        PrintUtil.printLinkedList(head: n0)

        /* ノードを削除する */
        remove(n0: n0)
        print("ノードを削除した後の連結リスト")
        PrintUtil.printLinkedList(head: n0)

        /* ノードにアクセスする */
        let node = access(head: n0, index: 3)
        print("連結リストのインデックス 3 にあるノードの値 = \(node!.val)")

        /* ノードを探索する */
        let index = find(head: n0, target: 2)
        print("連結リスト内で値が 2 であるノードのインデックス = \(index)")
    }
}
