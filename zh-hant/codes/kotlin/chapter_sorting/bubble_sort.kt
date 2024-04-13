/**
 * File: bubble_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 泡沫排序 */
fun bubbleSort(nums: IntArray) {
    // 外迴圈：未排序區間為 [0, i]
    for (i in nums.size - 1 downTo 1) {
        // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // 交換 nums[j] 與 nums[j + 1]
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
            }
        }
    }
}

/* 泡沫排序（標誌最佳化） */
fun bubbleSortWithFlag(nums: IntArray) {
    // 外迴圈：未排序區間為 [0, i]
    for (i in nums.size - 1 downTo 1) {
        var flag = false // 初始化標誌位
        // 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // 交換 nums[j] 與 nums[j + 1]
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                flag = true // 記錄交換元素
            }
        }
        if (!flag) break // 此輪“冒泡”未交換任何元素，直接跳出
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    bubbleSort(nums)
    println("泡沫排序完成後 nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(4, 1, 3, 1, 5, 2)
    bubbleSortWithFlag(nums1)
    println("泡沫排序完成後 nums1 = ${nums1.contentToString()}")
}