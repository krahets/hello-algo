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

/* 刪除鏈結串列中緊接在節點 n0 之後的節點 */
fun remove(n0: ListNode?) {
    if (n0?.next == null)
        return
    // n0 -> P -> n1
    val p = n0.next
    val n1 = p?.next
    n0.next = n1
}

/* 存取鏈結串列中索引為 index 的節點 */
fun access(head: ListNode?, index: Int): ListNode? {
    var h = head
    for (i in 0..<index) {
        if (h == null)
            return null
        h = h.next
    }
    return h
}

/* 在鏈結串列中尋找第一個值為 target 的節點 */
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

/* 範例主程式 */
fun main() {
    /* 初始化鏈結串列 */
    // 初始化各個節點
    val n0 = ListNode(1)
    val n1 = ListNode(3)
    val n2 = ListNode(2)
    val n3 = ListNode(5)
    val n4 = ListNode(4)

    // 建立節點之間的參照
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    println("初始化後的鏈結串列為")
    printLinkedList(n0)

    /* 插入節點 */
    insert(n0, ListNode(0))
    println("插入節點後的鏈結串列為")
    printLinkedList(n0)

    /* 刪除節點 */
    remove(n0)
    println("刪除節點後的鏈結串列為")
    printLinkedList(n0)

    /* 存取節點 */
    val node = access(n0, 3)!!
    println("鏈結串列中索引 3 處的節點值 = ${node._val}")

    /* 尋找節點 */
    val index = find(n0, 2)
    println("鏈結串列中值為 2 的節點索引 = $index")
}