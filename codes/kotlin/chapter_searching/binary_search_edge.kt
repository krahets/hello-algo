/**
 * File: binary_search_edge.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* 二分查找最左一个 target */
fun binarySearchLeftEdge(nums: IntArray, target: Int): Int {
    // 等价于查找 target 的插入点
    val i = binarySearchInsertion(nums, target)
    // 未找到 target ，返回 -1
    if (i == nums.size || nums[i] != target) {
        return -1
    }
    // 找到 target ，返回索引 i
    return i
}

/* 二分查找最右一个 target */
fun binarySearchRightEdge(nums: IntArray, target: Int): Int {
    // 转化为查找最左一个 target + 1
    val i = binarySearchInsertion(nums, target + 1)
    // j 指向最右一个 target ，i 指向首个大于 target 的元素
    val j = i - 1
    // 未找到 target ，返回 -1
    if (j == -1 || nums[j] != target) {
        return -1
    }
    // 找到 target ，返回索引 j
    return j
}

/* Driver Code */
fun main() {
    // 包含重复元素的数组
    val nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\n数组 nums = ${nums.contentToString()}")

    // 二分查找左边界和右边界
    for (target in intArrayOf(6, 7)) {
        var index = binarySearchLeftEdge(nums, target)
        println("最左一个元素 $target 的索引为 $index")
        index = binarySearchRightEdge(nums, target)
        println("最右一个元素 $target 的索引为 $index")
    }
}