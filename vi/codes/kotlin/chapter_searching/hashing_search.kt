/**
 * File: hashing_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* Hash search (array) */
fun hashingSearchArray(map: Map<Int?, Int>, target: Int): Int {
    // Hash table key: target element, _val: index
    // If this key does not exist in the hash table, return -1
    return map.getOrDefault(target, -1)
}

/* Hash search (linked list) */
fun hashingSearchLinkedList(map: Map<Int?, ListNode?>, target: Int): ListNode? {
    // Hash table key: target node value, _val: node object
    // If key is not in hash table, return null
    return map.getOrDefault(target, null)
}

/* Driver Code */
fun main() {
    val target = 3

    /* Hash search (array) */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    // Initialize hash table
    val map = HashMap<Int?, Int>()
    for (i in nums.indices) {
        map[nums[i]] = i // key: element, _val: index
    }
    val index = hashingSearchArray(map, target)
    println("Index of target element 3 = $index")

    /* Hash search (linked list) */
    var head = ListNode.arrToLinkedList(nums)
    // Initialize hash table
    val map1 = HashMap<Int?, ListNode?>()
    while (head != null) {
        map1[head._val] = head // key: node value, _val: node
        head = head.next
    }
    val node = hashingSearchLinkedList(map1, target)
    println("Node object corresponding to target node value 3 is $node")
}