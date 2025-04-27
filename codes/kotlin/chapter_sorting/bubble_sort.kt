/**
 * File: bubble_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 冒泡排序 */
fun bubbleSort(nums: IntArray) {
    // 外循环：未排序区间为 [0, i]
    for (i in nums.size - 1 downTo 1) {
        // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // 交换 nums[j] 与 nums[j + 1]
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
            }
        }
    }
}

/* 冒泡排序（标志优化） */
fun bubbleSortWithFlag(nums: IntArray) {
    // 外循环：未排序区间为 [0, i]
    for (i in nums.size - 1 downTo 1) {
        var flag = false // 初始化标志位
        // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // 交换 nums[j] 与 nums[j + 1]
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                flag = true // 记录交换元素
            }
        }
        if (!flag) break // 此轮“冒泡”未交换任何元素，直接跳出
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    bubbleSort(nums)
    println("冒泡排序完成后 nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(4, 1, 3, 1, 5, 2)
    bubbleSortWithFlag(nums1)
    println("冒泡排序完成后 nums1 = ${nums1.contentToString()}")
}