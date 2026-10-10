/**
 * File: linked_list.swift
 * Created Time: 2023-01-08
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 連結リストでノード n0 の後ろにノード P を挿入する */
func insert(n0: ListNode, P: ListNode) {
    let n1 = n0.next
    P.next = n1
    n0.next = P
}

/* 連結リストでノード n0 の直後のノードを削除する */
func remove(n0: ListNode) {
    if n0.next == nil {
        return
    }
    // n0 -> P -> n1
    let P = n0.next
    let n1 = P?.next
    n0.next = n1
}

/* 連結リスト内で index 番目のノードにアクセス */
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

/* 連結リストで値が target の最初のノードを探す */
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
        /* 連結リストを初期化 */
        // 各ノードを初期化
        let n0 = ListNode(x: 1)
        let n1 = ListNode(x: 3)
        let n2 = ListNode(x: 2)
        let n3 = ListNode(x: 5)
        let n4 = ListNode(x: 4)
        // ノード間の参照を構築する
        n0.next = n1
        n1.next = n2
        n2.next = n3
        n3.next = n4
        print("初期化した連結リストは")
        PrintUtil.printLinkedList(head: n0)

        /* ノードを挿入 */
        insert(n0: n0, P: ListNode(x: 0))
        print("ノード挿入後の連結リストは")
        PrintUtil.printLinkedList(head: n0)

        /* ノードを削除 */
        remove(n0: n0)
        print("ノード削除後の連結リストは")
        PrintUtil.printLinkedList(head: n0)

        /* ノードにアクセス */
        let node = access(head: n0, index: 3)
        print("連結リストのインデックス 3 にあるノードの値 = \(node!.val)")

        /* ノードを探索 */
        let index = find(head: n0, target: 2)
        print("連結リスト内で値が 2 のノードのインデックス = \(index)")
    }
}
