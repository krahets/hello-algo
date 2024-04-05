/**
 * File: binary_search_edge.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* 二分搜尋最左一個 target */
fun binarySearchLeftEdge(nums: IntArray, target: Int): Int {
    // 等價於查詢 target 的插入點
    val i = binarySearchInsertion(nums, target)
    // 未找到 target ，返回 -1
    if (i == nums.size || nums[i] != target) {
        return -1
    }
    // 找到 target ，返回索引 i
    return i
}

/* 二分搜尋最右一個 target */
fun binarySearchRightEdge(nums: IntArray, target: Int): Int {
    // 轉化為查詢最左一個 target + 1
    val i = binarySearchInsertion(nums, target + 1)
    // j 指向最右一個 target ，i 指向首個大於 target 的元素
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
    // 包含重複元素的陣列
    val nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\n陣列 nums = ${nums.contentToString()}")

    // 二分搜尋左邊界和右邊界
    for (target in intArrayOf(6, 7)) {
        var index = binarySearchLeftEdge(nums, target)
        println("最左一個元素 $target 的索引為 $index")
        index = binarySearchRightEdge(nums, target)
        println("最右一個元素 $target 的索引為 $index")
    }
}