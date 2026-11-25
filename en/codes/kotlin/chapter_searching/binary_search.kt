/**
 * File: binary_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* Binary search on a closed interval */
fun binarySearch(nums: IntArray, target: Int): Int {
    // Initialize the closed interval [0, n-1] with i at the first element and j at the last
    var i = 0
    var j = nums.size - 1
    // Stop when the search interval is empty (i > j)
    while (i <= j) {
        val m = i + (j - i) / 2 // Compute the midpoint index m
        if (nums[m] < target) // Any match must lie in [m+1, j]
            i = m + 1
        else if (nums[m] > target) // Any match must lie in [i, m-1]
            j = m - 1
        else  // Found the target. Return its index
            return m
    }
    // Target not found. Return -1
    return -1
}

/* Binary search on a left-closed, right-open interval */
fun binarySearchLCRO(nums: IntArray, target: Int): Int {
    // Initialize [0, n) with i at the first element and j one past the last
    var i = 0
    var j = nums.size
    // Stop when the search interval is empty (i = j)
    while (i < j) {
        val m = i + (j - i) / 2 // Compute the midpoint index m
        if (nums[m] < target) // Any match must lie in [m+1, j)
            i = m + 1
        else if (nums[m] > target) // Any match must lie in [i, m)
            j = m
        else  // Found the target. Return its index
            return m
    }
    // Target not found. Return -1
    return -1
}

/* Driver code */
fun main() {
    val target = 6
    val nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)

    /* Binary search on a closed interval */
    var index = binarySearch(nums, target)
    println("Index of target 6 = $index")

    /* Binary search on a left-closed, right-open interval */
    index = binarySearchLCRO(nums, target)
    println("Index of target 6 = $index")
}