/**
 * File: bubble_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 氣泡排序 */
fun bubbleSort(nums: IntArray) {
    // 外層迴圈：尚未排序的區間為 [0, i]
    for (i in nums.size - 1 downTo 1) {
        // 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
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

/* 氣泡排序（以旗標最佳化） */
fun bubbleSortWithFlag(nums: IntArray) {
    // 外層迴圈：尚未排序的區間為 [0, i]
    for (i in nums.size - 1 downTo 1) {
        var flag = false // 初始化旗標
        // 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // 交換 nums[j] 與 nums[j + 1]
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                flag = true // 記錄本輪曾交換元素
            }
        }
        if (!flag) break // 這一輪「冒泡」未交換任何元素，直接跳出迴圈
    }
}

/* 主程式 */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    bubbleSort(nums)
    println("氣泡排序完成後 nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(4, 1, 3, 1, 5, 2)
    bubbleSortWithFlag(nums1)
    println("氣泡排序完成後 nums1 = ${nums1.contentToString()}")
}