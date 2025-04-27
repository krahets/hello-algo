/**
 * File: insertion_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 插入排序 */
fun insertionSort(nums: IntArray) {
    //外循环: 已排序元素为 1, 2, ..., n
    for (i in nums.indices) {
        val base = nums[i]
        var j = i - 1
        // 内循环：将 base 插入到已排序区间 [0, i-1] 中的正确位置
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j] // 将 nums[j] 向右移动一位
            j--
        }
        nums[j + 1] = base        // 将 base 赋值到正确位置
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    insertionSort(nums)
    println("插入排序完成后 nums = ${nums.contentToString()}")
}