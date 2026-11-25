/**
 * File: selection_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 選擇排序 */
fun selectionSort(nums: IntArray) {
    val n = nums.size
    // 外層迴圈：未排序區間為 [i, n-1]
    for (i in 0..<n - 1) {
        var k = i
        // 內層迴圈：找出未排序區間中的最小元素
        for (j in i + 1..<n) {
            if (nums[j] < nums[k])
                k = j // 記錄最小元素的索引
        }
        // 將最小元素與未排序區間的第一個元素交換
        val temp = nums[i]
        nums[i] = nums[k]
        nums[k] = temp
    }
}

/* 主程式 */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    selectionSort(nums)
    println("選擇排序完成後 nums = ${nums.contentToString()}")
}