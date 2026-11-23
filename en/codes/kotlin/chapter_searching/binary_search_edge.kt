/**
 * File: binary_search_edge.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* Find the leftmost occurrence of target using binary search */
fun binarySearchLeftEdge(nums: IntArray, target: Int): Int {
    // This is equivalent to finding the insertion point of target
    val i = binarySearchInsertion(nums, target)
    // If target was not found, return -1
    if (i == nums.size || nums[i] != target) {
        return -1
    }
    // Target was found; return index i
    return i
}

/* Find the rightmost occurrence of target using binary search */
fun binarySearchRightEdge(nums: IntArray, target: Int): Int {
    // For integer values, find the leftmost insertion point of target + 1 (assuming no overflow)
    val i = binarySearchInsertion(nums, target + 1)
    // i is the index of the first element greater than target (or the array length); j is the candidate rightmost target index
    val j = i - 1
    // If target was not found, return -1
    if (j == -1 || nums[j] != target) {
        return -1
    }
    // Target was found; return index j
    return j
}

/* Driver code */
fun main() {
    // Array containing duplicate elements
    val nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\nArray nums = ${nums.contentToString()}")

    // Find the left and right boundaries using binary search
    for (target in intArrayOf(6, 7)) {
        var index = binarySearchLeftEdge(nums, target)
        println("Index of the leftmost occurrence of $target: $index")
        index = binarySearchRightEdge(nums, target)
        println("Index of the rightmost occurrence of $target: $index")
    }
}