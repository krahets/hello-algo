/**
 * File: binary_search_recur.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.binary_search_recur

/* Binary search: problem f(i, j) */
fun dfs(
    nums: IntArray,
    target: Int,
    i: Int,
    j: Int
): Int {
    // An empty interval contains no target, so return -1
    if (i > j) {
        return -1
    }
    // Compute the middle index m
    val m = (i + j) / 2
    return if (nums[m] < target) {
        // Recursively solve f(m+1, j)
        dfs(nums, target, m + 1, j)
    } else if (nums[m] > target) {
        // Recursively solve f(i, m-1)
        dfs(nums, target, i, m - 1)
    } else {
        // Target found: return its index
        m
    }
}

/* Binary search */
fun binarySearch(nums: IntArray, target: Int): Int {
    val n = nums.size
    // Solve f(0, n-1)
    return dfs(nums, target, 0, n - 1)
}

/* Driver code */
fun main() {
    val target = 6
    val nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)

    // Binary search (closed interval)
    val index = binarySearch(nums, target)
    println("Index of target 6 = $index")
}