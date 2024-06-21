/**
 * File: linear_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* 线性查找（数组） */
fun linearSearchArray(nums: IntArray, target: Int): Int {
    // 遍历数组
    for (i in nums.indices) {
        // 找到目标元素，返回其索引
        if (nums[i] == target)
            return i
    }
    // 未找到目标元素，返回 -1
    return -1
}

/* 线性查找（链表） */
fun linearSearchLinkedList(h: ListNode?, target: Int): ListNode? {
    // 遍历链表
    var head = h
    while (head != null) {
        // 找到目标节点，返回之
        if (head._val == target)
            return head
        head = head.next
    }
    // 未找到目标节点，返回 null
    return null
}

/* Driver Code */
fun main() {
    val target = 3

    /* 在数组中执行线性查找 */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    val index = linearSearchArray(nums, target)
    println("目标元素 3 的索引 = $index")

    /* 在链表中执行线性查找 */
    val head = ListNode.arrToLinkedList(nums)
    val node = linearSearchLinkedList(head, target)
    println("目标节点值 3 的对应节点对象为 $node")
}