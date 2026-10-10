/**
 * File: bubble_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Bubble sort */
fun bubbleSort(nums: IntArray) {
    // Outer loop: unsorted range is [0, i]
    for (i in nums.size - 1 downTo 1) {
        // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
            }
        }
    }
}

/* Bubble sort (flag optimization) */
fun bubbleSortWithFlag(nums: IntArray) {
    // Outer loop: unsorted range is [0, i]
    for (i in nums.size - 1 downTo 1) {
        var flag = false // Initialize flag
        // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                flag = true // Record element swap
            }
        }
        if (!flag) break // No elements were swapped in this round of "bubbling", exit directly
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    bubbleSort(nums)
    println("After bubble sort, nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(4, 1, 3, 1, 5, 2)
    bubbleSortWithFlag(nums1)
    println("After bubble sort, nums1 = ${nums1.contentToString()}")
}