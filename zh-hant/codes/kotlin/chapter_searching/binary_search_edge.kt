/**
 * File: binary_search_edge.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* 用二分搜尋找最左邊的 target */
fun binarySearchLeftEdge(nums: IntArray, target: Int): Int {
    // 等同於搜尋 target 的插入點
    val i = binarySearchInsertion(nums, target)
    // 找不到 target，回傳 -1
    if (i == nums.size || nums[i] != target) {
        return -1
    }
    // 找到 target，回傳索引 i
    return i
}

/* 用二分搜尋找最右邊的 target */
fun binarySearchRightEdge(nums: IntArray, target: Int): Int {
    // 改為搜尋 target + 1 的最左插入位置
    val i = binarySearchInsertion(nums, target + 1)
    // j 指向最右邊的 target，i 指向第一個大於 target 的元素
    val j = i - 1
    // 找不到 target，回傳 -1
    if (j == -1 || nums[j] != target) {
        return -1
    }
    // 找到 target，回傳索引 j
    return j
}

/* 主程式 */
fun main() {
    // 含有重複元素的陣列
    val nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\n陣列 nums = ${nums.contentToString()}")

    // 用二分搜尋找左界和右界
    for (target in intArrayOf(6, 7)) {
        var index = binarySearchLeftEdge(nums, target)
        println("最左邊的元素 $target 的索引為 $index")
        index = binarySearchRightEdge(nums, target)
        println("最右邊的元素 $target 的索引為 $index")
    }
}