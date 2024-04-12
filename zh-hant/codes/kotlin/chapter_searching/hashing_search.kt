/**
 * File: hashing_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* 雜湊查詢（陣列） */
fun hashingSearchArray(map: Map<Int?, Int>, target: Int): Int {
    // 雜湊表的 key: 目標元素，_val: 索引
    // 若雜湊表中無此 key ，返回 -1
    return map.getOrDefault(target, -1)
}

/* 雜湊查詢（鏈結串列） */
fun hashingSearchLinkedList(map: Map<Int?, ListNode?>, target: Int): ListNode? {
    // 雜湊表的 key: 目標節點值，_val: 節點物件
    // 若雜湊表中無此 key ，返回 null
    return map.getOrDefault(target, null)
}

/* Driver Code */
fun main() {
    val target = 3

    /* 雜湊查詢（陣列） */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    // 初始化雜湊表
    val map = HashMap<Int?, Int>()
    for (i in nums.indices) {
        map[nums[i]] = i // key: 元素，_val: 索引
    }
    val index = hashingSearchArray(map, target)
    println("目標元素 3 的索引 = $index")

    /* 雜湊查詢（鏈結串列） */
    var head = ListNode.arrToLinkedList(nums)
    // 初始化雜湊表
    val map1 = HashMap<Int?, ListNode?>()
    while (head != null) {
        map1[head._val] = head // key: 節點值，_val: 節點
        head = head.next
    }
    val node = hashingSearchLinkedList(map1, target)
    println("目標節點值 3 的對應節點物件為 $node")
}