/**
 * File: binary_search_insertion.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* 二分查找插入点（无重复元素） */
fun binarySearchInsertionSimple(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // 初始化双闭区间 [0, n-1]
    while (i <= j) {
        val m = i + (j - i) / 2 // 计算中点索引 m
        if (nums[m] < target) {
            i = m + 1 // target 在区间 [m+1, j] 中
        } else if (nums[m] > target) {
            j = m - 1 // target 在区间 [i, m-1] 中
        } else {
            return m // 找到 target ，返回插入点 m
        }
    }
    // 未找到 target ，返回插入点 i
    return i
}

/* 二分查找插入点（存在重复元素） */
fun binarySearchInsertion(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // 初始化双闭区间 [0, n-1]
    while (i <= j) {
        val m = i + (j - i) / 2 // 计算中点索引 m
        if (nums[m] < target) {
            i = m + 1 // target 在区间 [m+1, j] 中
        } else if (nums[m] > target) {
            j = m - 1 // target 在区间 [i, m-1] 中
        } else {
            j = m - 1 // 首个小于 target 的元素在区间 [i, m-1] 中
        }
    }
    // 返回插入点 i
    return i
}

/* Driver Code */
fun main() {
    // 无重复元素的数组
    var nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)
    println("\n数组 nums = ${nums.contentToString()}")
    // 二分查找插入点
    for (target in intArrayOf(6, 9)) {
        val index = binarySearchInsertionSimple(nums, target)
        println("元素 $target 的插入点的索引为 $index")
    }

    // 包含重复元素的数组
    nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\n数组 nums = ${nums.contentToString()}")

    // 二分查找插入点
    for (target in intArrayOf(2, 6, 20)) {
        val index = binarySearchInsertion(nums, target)
        println("元素 $target 的插入点的索引为 $index")
    }
}