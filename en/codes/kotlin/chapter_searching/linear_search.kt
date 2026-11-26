/**
 * File: linear_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* Linear search in an array */
fun linearSearchArray(nums: IntArray, target: Int): Int {
    // Traverse the array
    for (i in nums.indices) {
        // Found the target. Return its index
        if (nums[i] == target)
            return i
    }
    // Target not found. Return -1
    return -1
}

/* Linear search in a linked list */
fun linearSearchLinkedList(h: ListNode?, target: Int): ListNode? {
    // Traverse the linked list
    var head = h
    while (head != null) {
        // Found the target node. Return it
        if (head._val == target)
            return head
        head = head.next
    }
    // Target node not found. Return null
    return null
}

/* Driver code */
fun main() {
    val target = 3

    /* Run linear search on the array */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    val index = linearSearchArray(nums, target)
    println("Index of target 3 = $index")

    /* Run linear search on the linked list */
    val head = ListNode.arrToLinkedList(nums)
    val node = linearSearchLinkedList(head, target)
    println("Node object for target value 3 = $node")
}