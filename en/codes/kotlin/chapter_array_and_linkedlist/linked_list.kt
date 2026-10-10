/**
 * File: linked_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import utils.ListNode
import utils.printLinkedList

/* Insert node P after node n0 in the linked list */
fun insert(n0: ListNode?, p: ListNode?) {
    val n1 = n0?.next
    p?.next = n1
    n0?.next = p
}

/* Remove the first node after node n0 in the linked list */
fun remove(n0: ListNode?) {
    if (n0?.next == null)
        return
    // n0 -> P -> n1
    val p = n0.next
    val n1 = p?.next
    n0.next = n1
}

/* Access the node at index index in the linked list */
fun access(head: ListNode?, index: Int): ListNode? {
    var h = head
    for (i in 0..<index) {
        if (h == null)
            return null
        h = h.next
    }
    return h
}

/* Find the first node with value target in the linked list */
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
    /* Initialize linked list */
    // Initialize each node
    val n0 = ListNode(1)
    val n1 = ListNode(3)
    val n2 = ListNode(2)
    val n3 = ListNode(5)
    val n4 = ListNode(4)

    // Build references between nodes
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    println("Initialized linked list is")
    printLinkedList(n0)

    /* Insert node */
    insert(n0, ListNode(0))
    println("Linked list after inserting node is")
    printLinkedList(n0)

    /* Remove node */
    remove(n0)
    println("Linked list after removing node is")
    printLinkedList(n0)

    /* Access node */
    val node = access(n0, 3)!!
    println("Value of node at index 3 in linked list = ${node._val}")

    /* Search node */
    val index = find(n0, 2)
    println("Index of node with value 2 in linked list = $index")
}