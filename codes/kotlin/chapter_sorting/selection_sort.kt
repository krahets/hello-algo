/**
 * File: selection_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 选择排序 */
fun selectionSort(nums: IntArray) {
    val n = nums.size
    // 外循环：未排序区间为 [i, n-1]
    for (i in 0..<n - 1) {
        var k = i
        // 内循环：找到未排序区间内的最小元素
        for (j in i + 1..<n) {
            if (nums[j] < nums[k])
                k = j // 记录最小元素的索引
        }
        // 将该最小元素与未排序区间的首个元素交换
        val temp = nums[i]
        nums[i] = nums[k]
        nums[k] = temp
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    selectionSort(nums)
    println("选择排序完成后 nums = ${nums.contentToString()}")
}