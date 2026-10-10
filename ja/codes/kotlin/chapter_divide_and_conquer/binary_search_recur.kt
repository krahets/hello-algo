/**
 * File: binary_search_recur.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_divide_and_conquer.binary_search_recur

/* 二分探索：問題 f(i, j) */
fun dfs(
    nums: IntArray,
    target: Int,
    i: Int,
    j: Int
): Int {
    // 区間が空なら対象要素は存在しないので -1 を返す
    if (i > j) {
        return -1
    }
    // 中点インデックス m を計算
    val m = (i + j) / 2
    return if (nums[m] < target) {
        // 部分問題 f(m+1, j) を再帰的に解く
        dfs(nums, target, m + 1, j)
    } else if (nums[m] > target) {
        // 部分問題 f(i, m-1) を再帰的に解く
        dfs(nums, target, i, m - 1)
    } else {
        // 目標要素が見つかったらそのインデックスを返す
        m
    }
}

/* 二分探索 */
fun binarySearch(nums: IntArray, target: Int): Int {
    val n = nums.size
    // 問題 f(0, n-1) を解く
    return dfs(nums, target, 0, n - 1)
}

/* Driver Code */
fun main() {
    val target = 6
    val nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)

    // 二分探索（両閉区間）
    val index = binarySearch(nums, target)
    println("対象要素 6 のインデックス = $index")
}