/**
 * File: linked_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import utils.ListNode
import utils.printLinkedList

/* 在链表的节点 n0 之后插入节点 P */
fun insert(n0: ListNode?, p: ListNode?) {
    val n1 = n0?.next
    p?.next = n1
    n0?.next = p
}

/* 删除链表的节点 n0 之后的首个节点 */
fun remove(n0: ListNode?) {
    if (n0?.next == null)
        return
    // n0 -> P -> n1
    val p = n0.next
    val n1 = p?.next
    n0.next = n1
}

/* 访问链表中索引为 index 的节点 */
fun access(head: ListNode?, index: Int): ListNode? {
    var h = head
    for (i in 0..<index) {
        if (h == null)
            return null
        h = h.next
    }
    return h
}

/* 在链表中查找值为 target 的首个节点 */
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
    /* 初始化链表 */
    // 初始化各个节点
    val n0 = ListNode(1)
    val n1 = ListNode(3)
    val n2 = ListNode(2)
    val n3 = ListNode(5)
    val n4 = ListNode(4)

    // 构建节点之间的引用
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    println("初始化的链表为")
    printLinkedList(n0)

    /* 插入节点 */
    insert(n0, ListNode(0))
    println("插入节点后的链表为")
    printLinkedList(n0)

    /* 删除节点 */
    remove(n0)
    println("删除节点后的链表为")
    printLinkedList(n0)

    /* 访问节点 */
    val node = access(n0, 3)!!
    println("链表中索引 3 处的节点的值 = ${node._val}")

    /* 查找节点 */
    val index = find(n0, 2)
    println("链表中值为 2 的节点的索引 = $index")
}