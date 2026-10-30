/**
 * File: binary_search_insertion.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* Find an insertion point using binary search (no duplicates) */
fun binarySearchInsertionSimple(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // Initialize the closed interval [0, n-1]
    while (i <= j) {
        val m = i + (j - i) / 2 // Calculate the midpoint index m
        if (nums[m] < target) {
            i = m + 1 // Target must be in [m+1, j] if it exists
        } else if (nums[m] > target) {
            j = m - 1 // Target must be in [i, m-1] if it exists
        } else {
            return m // Target was found; return insertion point m
        }
    }
    // Target was not found; return insertion point i
    return i
}

/* Find an insertion point using binary search (with duplicates) */
fun binarySearchInsertion(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // Initialize the closed interval [0, n-1]
    while (i <= j) {
        val m = i + (j - i) / 2 // Calculate the midpoint index m
        if (nums[m] < target) {
            i = m + 1 // Target must be in [m+1, j] if it exists
        } else if (nums[m] > target) {
            j = m - 1 // Target must be in [i, m-1] if it exists
        } else {
            j = m - 1 // Continue in [i, m-1] to find the rightmost element smaller than target
        }
    }
    // Return insertion point i
    return i
}

/* Driver code */
fun main() {
    // Array with no duplicate elements
    var nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)
    println("\nArray nums = ${nums.contentToString()}")
    // Find an insertion point using binary search
    for (target in intArrayOf(6, 9)) {
        val index = binarySearchInsertionSimple(nums, target)
        println("Insertion index for $target: $index")
    }

    // Array containing duplicate elements
    nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\nArray nums = ${nums.contentToString()}")

    // Find an insertion point using binary search
    for (target in intArrayOf(2, 6, 20)) {
        val index = binarySearchInsertion(nums, target)
        println("Insertion index for $target: $index")
    }
}
