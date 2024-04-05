/**
 * File: binary_search_insertion.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* 二分搜尋插入點（無重複元素） */
fun binarySearchInsertionSimple(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // 初始化雙閉區間 [0, n-1]
    while (i <= j) {
        val m = i + (j - i) / 2 // 計算中點索引 m
        if (nums[m] < target) {
            i = m + 1 // target 在區間 [m+1, j] 中
        } else if (nums[m] > target) {
            j = m - 1 // target 在區間 [i, m-1] 中
        } else {
            return m // 找到 target ，返回插入點 m
        }
    }
    // 未找到 target ，返回插入點 i
    return i
}

/* 二分搜尋插入點（存在重複元素） */
fun binarySearchInsertion(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // 初始化雙閉區間 [0, n-1]
    while (i <= j) {
        val m = i + (j - i) / 2 // 計算中點索引 m
        if (nums[m] < target) {
            i = m + 1 // target 在區間 [m+1, j] 中
        } else if (nums[m] > target) {
            j = m - 1 // target 在區間 [i, m-1] 中
        } else {
            j = m - 1 // 首個小於 target 的元素在區間 [i, m-1] 中
        }
    }
    // 返回插入點 i
    return i
}

/* Driver Code */
fun main() {
    // 無重複元素的陣列
    var nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)
    println("\n陣列 nums = ${nums.contentToString()}")
    // 二分搜尋插入點
    for (target in intArrayOf(6, 9)) {
        val index = binarySearchInsertionSimple(nums, target)
        println("元素 $target 的插入點的索引為 $index")
    }

    // 包含重複元素的陣列
    nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\n陣列 nums = ${nums.contentToString()}")

    // 二分搜尋插入點
    for (target in intArrayOf(2, 6, 20)) {
        val index = binarySearchInsertion(nums, target)
        println("元素 $target 的插入點的索引為 $index")
    }
}