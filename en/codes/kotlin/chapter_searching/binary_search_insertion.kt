/**
 * File: binary_search_insertion.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* Binary search for an insertion point (no duplicates) */
fun binarySearchInsertionSimple(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // Initialize the closed interval [0, n-1]
    while (i <= j) {
        val m = i + (j - i) / 2 // Compute the midpoint index m
        if (nums[m] < target) {
            i = m + 1 // Any match must lie in [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1 // Any match must lie in [i, m-1]
        } else {
            return m // Found target. Return insertion point m
        }
    }
    // Target not found. Return insertion point i
    return i
}

/* Binary search for an insertion point (duplicates allowed) */
fun binarySearchInsertion(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // Initialize the closed interval [0, n-1]
    while (i <= j) {
        val m = i + (j - i) / 2 // Compute the midpoint index m
        if (nums[m] < target) {
            i = m + 1 // Any match must lie in [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1 // Any match must lie in [i, m-1]
        } else {
            j = m - 1 // Look in [i, m-1] for the rightmost element less than target
        }
    }
    // Return insertion point i
    return i
}

/* Driver code */
fun main() {
    // Array without duplicates
    var nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)
    println("\nArray nums = ${nums.contentToString()}")
    // Find the insertion point using binary search
    for (target in intArrayOf(6, 9)) {
        val index = binarySearchInsertionSimple(nums, target)
        println("Insertion index for $target = $index")
    }

    // Array with duplicates
    nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\nArray nums = ${nums.contentToString()}")

    // Find the insertion point using binary search
    for (target in intArrayOf(2, 6, 20)) {
        val index = binarySearchInsertion(nums, target)
        println("Insertion index for $target = $index")
    }
}
