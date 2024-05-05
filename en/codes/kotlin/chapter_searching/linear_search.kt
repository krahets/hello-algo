/**
 * File: linear_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* Linear search (array) */
fun linearSearchArray(nums: IntArray, target: Int): Int {
    // Traverse array
    for (i in nums.indices) {
        // Found the target element, thus return its index
        if (nums[i] == target)
            return i
    }
    // Did not find the target element, thus return -1
    return -1
}

/* Linear search (linked list) */
fun linearSearchLinkedList(h: ListNode?, target: Int): ListNode? {
    // Traverse the list
    var head = h
    while (head != null) {
        // Found the target node, return it
        if (head._val == target)
            return head
        head = head.next
    }
    // If the target node is not found, return null
    return null
}

/* Driver Code */
fun main() {
    val target = 3

    /* Perform linear search in array */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    val index = linearSearchArray(nums, target)
    println("Index of target element 3 = $index")

    /* Perform linear search in linked list */
    val head = ListNode.arrToLinkedList(nums)
    val node = linearSearchLinkedList(head, target)
    println("Corresponding node object for target node value 3 = $node")
}