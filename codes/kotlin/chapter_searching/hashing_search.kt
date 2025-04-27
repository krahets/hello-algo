/**
 * File: hashing_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* 哈希查找（数组） */
fun hashingSearchArray(map: Map<Int?, Int>, target: Int): Int {
    // 哈希表的 key: 目标元素，_val: 索引
    // 若哈希表中无此 key ，返回 -1
    return map.getOrDefault(target, -1)
}

/* 哈希查找（链表） */
fun hashingSearchLinkedList(map: Map<Int?, ListNode?>, target: Int): ListNode? {
    // 哈希表的 key: 目标节点值，_val: 节点对象
    // 若哈希表中无此 key ，返回 null
    return map.getOrDefault(target, null)
}

/* Driver Code */
fun main() {
    val target = 3

    /* 哈希查找（数组） */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    // 初始化哈希表
    val map = HashMap<Int?, Int>()
    for (i in nums.indices) {
        map[nums[i]] = i // key: 元素，_val: 索引
    }
    val index = hashingSearchArray(map, target)
    println("目标元素 3 的索引 = $index")

    /* 哈希查找（链表） */
    var head = ListNode.arrToLinkedList(nums)
    // 初始化哈希表
    val map1 = HashMap<Int?, ListNode?>()
    while (head != null) {
        map1[head._val] = head // key: 节点值，_val: 节点
        head = head.next
    }
    val node = hashingSearchLinkedList(map1, target)
    println("目标节点值 3 的对应节点对象为 $node")
}