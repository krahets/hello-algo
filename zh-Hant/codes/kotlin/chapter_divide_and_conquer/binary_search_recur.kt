/**
 * File: binary_search_recur.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.binary_search_recur

/* 二分搜尋：問題 f(i, j) */
fun dfs(
    nums: IntArray,
    target: Int,
    i: Int,
    j: Int
): Int {
    // 若區間為空，代表無目標元素，則返回 -1
    if (i > j) {
        return -1
    }
    // 計算中點索引 m
    val m = (i + j) / 2
    return if (nums[m] < target) {
        // 遞迴子問題 f(m+1, j)
        dfs(nums, target, m + 1, j)
    } else if (nums[m] > target) {
        // 遞迴子問題 f(i, m-1)
        dfs(nums, target, i, m - 1)
    } else {
        // 找到目標元素，返回其索引
        m
    }
}

/* 二分搜尋 */
fun binarySearch(nums: IntArray, target: Int): Int {
    val n = nums.size
    // 求解問題 f(0, n-1)
    return dfs(nums, target, 0, n - 1)
}

/* Driver Code */
fun main() {
    val target = 6
    val nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)

    // 二分搜尋（雙閉區間）
    val index = binarySearch(nums, target)
    println("目標元素 6 的索引 = $index")
}