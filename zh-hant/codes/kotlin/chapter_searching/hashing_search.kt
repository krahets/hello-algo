/**
 * File: hashing_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* 雜湊搜尋（陣列） */
fun hashingSearchArray(map: Map<Int?, Int>, target: Int): Int {
    // 雜湊表的 key 為目標元素，_val 為索引
    // 若雜湊表中沒有這個 key，則回傳 -1
    return map.getOrDefault(target, -1)
}

/* 雜湊搜尋（鏈結串列） */
fun hashingSearchLinkedList(map: Map<Int?, ListNode?>, target: Int): ListNode? {
    // 雜湊表的 key 為目標節點的值，_val 為節點物件
    // 若雜湊表中沒有這個 key，則回傳 null
    return map.getOrDefault(target, null)
}

/* 主程式 */
fun main() {
    val target = 3

    /* 雜湊搜尋（陣列） */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    // 初始化雜湊表
    val map = HashMap<Int?, Int>()
    for (i in nums.indices) {
        map[nums[i]] = i // key 為元素，_val 為索引
    }
    val index = hashingSearchArray(map, target)
    println("目標元素 3 的索引 = $index")

    /* 雜湊搜尋（鏈結串列） */
    var head = ListNode.arrToLinkedList(nums)
    // 初始化雜湊表
    val map1 = HashMap<Int?, ListNode?>()
    while (head != null) {
        map1[head._val] = head // key 為節點的值，_val 為節點
        head = head.next
    }
    val node = hashingSearchLinkedList(map1, target)
    println("目標值 3 對應的節點物件為 $node")
}