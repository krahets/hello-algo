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
    // If the interval is empty, it means there is no target element, return -1
    if (i > j) {
        return -1
    }
    // Calculate the midpoint index m
    val m = (i + j) / 2
    return if (nums[m] < target) {
        // Recursion subproblem f(m+1, j)
        dfs(nums, target, m + 1, j)
    } else if (nums[m] > target) {
        // Recursion subproblem f(i, m-1)
        dfs(nums, target, i, m - 1)
    } else {
        // Found the target element, return its index
        m
    }
}

/* Binary search */
fun binarySearch(nums: IntArray, target: Int): Int {
    val n = nums.size
    // Solve the problem f(0, n-1)
    return dfs(nums, target, 0, n - 1)
}

/* Driver Code */
fun main() {
    val target = 6
    val nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)

    // Binary search (closed interval on both sides)
    val index = binarySearch(nums, target)
    println("Index of target element 6 = $index")
}