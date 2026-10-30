/**
 * File: binary_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* Binary search (closed interval) */
fun binarySearch(nums: IntArray, target: Int): Int {
    // Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
    var i = 0
    var j = nums.size - 1
    // Loop until the search interval is empty (when i > j)
    while (i <= j) {
        val m = i + (j - i) / 2 // Calculate the midpoint index m
        if (nums[m] < target) // In this case, target must be in [m+1, j] if it exists
            i = m + 1
        else if (nums[m] > target) // In this case, target must be in [i, m-1] if it exists
            j = m - 1
        else  // The target element was found; return its index
            return m
    }
    // The target element was not found; return -1
    return -1
}

/* Binary search (left-closed, right-open interval) */
fun binarySearchLCRO(nums: IntArray, target: Int): Int {
    // Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
    var i = 0
    var j = nums.size
    // Loop until the search interval is empty (when i = j)
    while (i < j) {
        val m = i + (j - i) / 2 // Calculate the midpoint index m
        if (nums[m] < target) // In this case, target must be in [m+1, j) if it exists
            i = m + 1
        else if (nums[m] > target) // In this case, target must be in [i, m) if it exists
            j = m
        else  // The target element was found; return its index
            return m
    }
    // The target element was not found; return -1
    return -1
}

/* Driver code */
fun main() {
    val target = 6
    val nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)

    /* Binary search (closed interval) */
    var index = binarySearch(nums, target)
    println("Index of target element 6 = $index")

    /* Binary search (left-closed, right-open interval) */
    index = binarySearchLCRO(nums, target)
    println("Index of target element 6 = $index")
}