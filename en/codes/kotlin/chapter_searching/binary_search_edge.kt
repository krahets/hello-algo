/**
 * File: binary_search_edge.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* Use binary search to find the leftmost occurrence of target */
fun binarySearchLeftEdge(nums: IntArray, target: Int): Int {
    // Equivalent to finding the insertion point for target
    val i = binarySearchInsertion(nums, target)
    // Target not found. Return -1
    if (i == nums.size || nums[i] != target) {
        return -1
    }
    // Found target. Return index i
    return i
}

/* Use binary search to find the rightmost occurrence of target */
fun binarySearchRightEdge(nums: IntArray, target: Int): Int {
    // Search for the leftmost occurrence of target + 1
    val i = binarySearchInsertion(nums, target + 1)
    // j points to the rightmost occurrence of target, and i to the first larger element
    val j = i - 1
    // Target not found. Return -1
    if (j == -1 || nums[j] != target) {
        return -1
    }
    // Found target. Return index j
    return j
}

/* Driver code */
fun main() {
    // Array with duplicates
    val nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\nArray nums = ${nums.contentToString()}")

    // Find the left and right boundaries using binary search
    for (target in intArrayOf(6, 7)) {
        var index = binarySearchLeftEdge(nums, target)
        println("Index of the leftmost occurrence of $target = $index")
        index = binarySearchRightEdge(nums, target)
        println("Index of the rightmost occurrence of $target = $index")
    }
}