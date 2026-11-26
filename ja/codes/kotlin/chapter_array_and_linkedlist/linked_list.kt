/**
 * File: linked_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import utils.ListNode
import utils.printLinkedList

/* 連結リストのノード n0 の直後にノード P を挿入する */
fun insert(n0: ListNode?, p: ListNode?) {
    val n1 = n0?.next
    p?.next = n1
    n0?.next = p
}

/* 連結リストのノード n0 の直後にあるノードを削除する */
fun remove(n0: ListNode?) {
    if (n0?.next == null)
        return
    // n0 -> P -> n1
    val p = n0.next
    val n1 = p?.next
    n0.next = n1
}

/* 連結リストのインデックス index にあるノードにアクセスする */
fun access(head: ListNode?, index: Int): ListNode? {
    var h = head
    for (i in 0..<index) {
        if (h == null)
            return null
        h = h.next
    }
    return h
}

/* 連結リストから値が target の最初のノードを探す */
fun find(head: ListNode?, target: Int): Int {
    var index = 0
    var h = head
    while (h != null) {
        if (h._val == target)
            return index
        h = h.next
        index++
    }
    return -1
}

/* ドライバコード */
fun main() {
    /* 連結リストを初期化する */
    // 各ノードを初期化する
    val n0 = ListNode(1)
    val n1 = ListNode(3)
    val n2 = ListNode(2)
    val n3 = ListNode(5)
    val n4 = ListNode(4)

    // ノード間の参照を設定する
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    println("初期化した連結リスト：")
    printLinkedList(n0)

    /* ノードを挿入する */
    insert(n0, ListNode(0))
    println("ノード挿入後の連結リスト：")
    printLinkedList(n0)

    /* ノードを削除する */
    remove(n0)
    println("ノード削除後の連結リスト：")
    printLinkedList(n0)

    /* ノードにアクセスする */
    val node = access(n0, 3)!!
    println("連結リストのインデックス 3 にあるノードの値 = ${node._val}")

    /* ノードを探す */
    val index = find(n0, 2)
    println("連結リストで値が 2 のノードのインデックス = $index")
}