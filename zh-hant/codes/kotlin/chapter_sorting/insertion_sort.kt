/**
 * File: insertion_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 插入排序 */
fun insertionSort(nums: IntArray) {
    //外層迴圈：每輪結束後，已排序的元素數依序為 1, 2, ..., n
    for (i in nums.indices) {
        val base = nums[i]
        var j = i - 1
        // 內層迴圈：將 base 插入已排序區間 [0, i-1] 中的正確位置
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j] // 將 nums[j] 向右移動一格
            j--
        }
        nums[j + 1] = base        // 將 base 寫入正確位置
    }
}

/* 主程式 */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    insertionSort(nums)
    println("插入排序完成後 nums = ${nums.contentToString()}")
}