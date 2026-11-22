/**
 * File: linked_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import utils.ListNode
import utils.printLinkedList

/* 在鏈結串列的節點 n0 之後插入節點 P */
fun insert(n0: ListNode?, p: ListNode?) {
    val n1 = n0?.next
    p?.next = n1
    n0?.next = p
}

/* 刪除鏈結串列的節點 n0 之後的首個節點 */
fun remove(n0: ListNode?) {
    if (n0?.next == null)
        return
    // n0 -> P -> n1
    val p = n0.next
    val n1 = p?.next
    n0.next = n1
}

/* 訪問鏈結串列中索引為 index 的節點 */
fun access(head: ListNode?, index: Int): ListNode? {
    var h = head
    for (i in 0..<index) {
        if (h == null)
            return null
        h = h.next
    }
    return h
}

/* 在鏈結串列中查詢值為 target 的首個節點 */
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

/* Driver Code */
fun main() {
    /* 初始化鏈結串列 */
    // 初始化各個節點
    val n0 = ListNode(1)
    val n1 = ListNode(3)
    val n2 = ListNode(2)
    val n3 = ListNode(5)
    val n4 = ListNode(4)

    // 構建節點之間的引用
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    println("初始化的鏈結串列為")
    printLinkedList(n0)

    /* 插入節點 */
    insert(n0, ListNode(0))
    println("插入節點後的鏈結串列為")
    printLinkedList(n0)

    /* 刪除節點 */
    remove(n0)
    println("刪除節點後的鏈結串列為")
    printLinkedList(n0)

    /* 訪問節點 */
    val node = access(n0, 3)!!
    println("鏈結串列中索引 3 處的節點的值 = ${node._val}")

    /* 查詢節點 */
    val index = find(n0, 2)
    println("鏈結串列中值為 2 的節點的索引 = $index")
}