/**
 * File: hashing_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* Hash-based search (array) */
fun hashingSearchArray(map: Map<Int?, Int>, target: Int): Int {
    // Hash table key: target element; value: index
    // Return -1 if the hash table does not contain this key
    return map.getOrDefault(target, -1)
}

/* Hash-based search (linked list) */
fun hashingSearchLinkedList(map: Map<Int?, ListNode?>, target: Int): ListNode? {
    // Hash table key: target node value; value: node object
    // Return null if the hash table does not contain this key
    return map.getOrDefault(target, null)
}

/* Driver code */
fun main() {
    val target = 3

    /* Hash-based search (array) */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    // Initialize the hash table
    val map = HashMap<Int?, Int>()
    for (i in nums.indices) {
        map[nums[i]] = i // Key: element; value: index
    }
    val index = hashingSearchArray(map, target)
    println("Index of target element 3 = $index")

    /* Hash-based search (linked list) */
    var head = ListNode.arrToLinkedList(nums)
    // Initialize the hash table
    val map1 = HashMap<Int?, ListNode?>()
    while (head != null) {
        map1[head._val] = head // Key: node value; value: node
        head = head.next
    }
    val node = hashingSearchLinkedList(map1, target)
    println("Node object with target value 3: $node")
}