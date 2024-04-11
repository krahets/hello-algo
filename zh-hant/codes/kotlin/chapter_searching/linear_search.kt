/**
 * File: linear_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* 線性查詢（陣列） */
fun linearSearchArray(nums: IntArray, target: Int): Int {
    // 走訪陣列
    for (i in nums.indices) {
        // 找到目標元素，返回其索引
        if (nums[i] == target)
            return i
    }
    // 未找到目標元素，返回 -1
    return -1
}

/* 線性查詢（鏈結串列） */
fun linearSearchLinkedList(h: ListNode?, target: Int): ListNode? {
    // 走訪鏈結串列
    var head = h
    while (head != null) {
        // 找到目標節點，返回之
        if (head._val == target)
            return head
        head = head.next
    }
    // 未找到目標節點，返回 null
    return null
}

/* Driver Code */
fun main() {
    val target = 3

    /* 在陣列中執行線性查詢 */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    val index = linearSearchArray(nums, target)
    println("目標元素 3 的索引 = $index")

    /* 在鏈結串列中執行線性查詢 */
    val head = ListNode.arrToLinkedList(nums)
    val node = linearSearchLinkedList(head, target)
    println("目標節點值 3 的對應節點物件為 $node")
}