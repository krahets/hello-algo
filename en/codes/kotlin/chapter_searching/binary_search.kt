/**
 * File: binary_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* Binary search (double closed interval) */
fun binarySearch(nums: IntArray, target: Int): Int {
    // Initialize double closed interval [0, n-1], i.e., i, j point to the first element and last element of the array respectively
    var i = 0
    var j = nums.size - 1
    // Loop until the search interval is empty (when i > j, it is empty)
    while (i <= j) {
        val m = i + (j - i) / 2 // Calculate midpoint index m
        if (nums[m] < target) // This situation indicates that target is in the interval [m+1, j]
            i = m + 1
        else if (nums[m] > target) // This situation indicates that target is in the interval [i, m-1]
            j = m - 1
        else  // Found the target element, thus return its index
            return m
    }
    // Did not find the target element, thus return -1
    return -1
}

/* Binary search (left closed right open interval) */
fun binarySearchLCRO(nums: IntArray, target: Int): Int {
    // Initialize left closed right open interval [0, n), i.e., i, j point to the first element and the last element +1 of the array respectively
    var i = 0
    var j = nums.size
    // Loop until the search interval is empty (when i = j, it is empty)
    while (i < j) {
        val m = i + (j - i) / 2 // Calculate midpoint index m
        if (nums[m] < target) // This situation indicates that target is in the interval [m+1, j)
            i = m + 1
        else if (nums[m] > target) // This situation indicates that target is in the interval [i, m)
            j = m
        else  // Found the target element, thus return its index
            return m
    }
    // Did not find the target element, thus return -1
    return -1
}

/* Driver Code */
fun main() {
    val target = 6
    val nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)

    /* Binary search (double closed interval) */
    var index = binarySearch(nums, target)
    println("Index of target element 6 = $index")

    /* Binary search (left closed right open interval) */
    index = binarySearchLCRO(nums, target)
    println("Index of target element 6 = $index")
}