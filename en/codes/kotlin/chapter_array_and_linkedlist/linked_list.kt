/**
 * File: linked_list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import utils.ListNode
import utils.printLinkedList

/* Insert node p after node n0 in the linked list */
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

/* Access the node at index `index` in the linked list */
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

/* Driver code */
fun main() {
    /* Initialize the linked list */
    // Initialize the individual nodes
    val n0 = ListNode(1)
    val n1 = ListNode(3)
    val n2 = ListNode(2)
    val n3 = ListNode(5)
    val n4 = ListNode(4)

    // Set up references between the nodes
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    println("The initialized linked list is")
    printLinkedList(n0)

    /* Insert a node */
    insert(n0, ListNode(0))
    println("The linked list after inserting a node is")
    printLinkedList(n0)

    /* Remove a node */
    remove(n0)
    println("The linked list after removing a node is")
    printLinkedList(n0)

    /* Access a node */
    val node = access(n0, 3)!!
    println("Value of the linked-list node at index 3 = ${node._val}")

    /* Find a node */
    val index = find(n0, 2)
    println("Index of the linked-list node with value 2 = $index")
}