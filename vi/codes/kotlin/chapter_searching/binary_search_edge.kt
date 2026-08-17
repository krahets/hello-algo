/**
 * File: binary_search_edge.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* Binary search for the leftmost target */
fun binarySearchLeftEdge(nums: IntArray, target: Int): Int {
    // Equivalent to finding the insertion point of target
    val i = binarySearchInsertion(nums, target)
    // Target not found, return -1
    if (i == nums.size || nums[i] != target) {
        return -1
    }
    // Found target, return index i
    return i
}

/* Binary search for the rightmost target */
fun binarySearchRightEdge(nums: IntArray, target: Int): Int {
    // Convert to finding the leftmost target + 1
    val i = binarySearchInsertion(nums, target + 1)
    // j points to the rightmost target, i points to the first element greater than target
    val j = i - 1
    // Target not found, return -1
    if (j == -1 || nums[j] != target) {
        return -1
    }
    // Found target, return index j
    return j
}

/* Driver Code */
fun main() {
    // Array with duplicate elements
    val nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\nArray nums = ${nums.contentToString()}")

    // Binary search left and right boundaries
    for (target in intArrayOf(6, 7)) {
        var index = binarySearchLeftEdge(nums, target)
        println("Leftmost element $target index is $index")
        index = binarySearchRightEdge(nums, target)
        println("Rightmost element $target index is $index")
    }
}