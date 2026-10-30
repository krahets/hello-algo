/**
 * File: linear_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* Linear search (array) */
fun linearSearchArray(nums: IntArray, target: Int): Int {
    // Traverse the array
    for (i in nums.indices) {
        // The target element was found; return its index
        if (nums[i] == target)
            return i
    }
    // The target element was not found; return -1
    return -1
}

/* Linear search (linked list) */
fun linearSearchLinkedList(h: ListNode?, target: Int): ListNode? {
    // Traverse the linked list
    var head = h
    while (head != null) {
        // The target node was found; return it
        if (head._val == target)
            return head
        head = head.next
    }
    // The target node was not found; return null
    return null
}

/* Driver code */
fun main() {
    val target = 3

    /* Perform linear search on the array */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    val index = linearSearchArray(nums, target)
    println("Index of target element 3 = $index")

    /* Perform linear search on the linked list */
    val head = ListNode.arrToLinkedList(nums)
    val node = linearSearchLinkedList(head, target)
    println("Node object with target value 3: $node")
}