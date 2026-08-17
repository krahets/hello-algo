/**
 * File: counting_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

import kotlin.math.max

/* Counting sort */
// Simple implementation, cannot be used for sorting objects
fun countingSortNaive(nums: IntArray) {
    // 1. Count the maximum element m in the array
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. Count the occurrence of each number
    // counter[num] represents the occurrence of num
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. Traverse counter, filling each element back into the original array nums
    var i = 0
    for (num in 0..<m + 1) {
        var j = 0
        while (j < counter[num]) {
            nums[i] = num
            j++
            i++
        }
    }
}

/* Counting sort */
// Complete implementation, can sort objects and is a stable sort
fun countingSort(nums: IntArray) {
    // 1. Count the maximum element m in the array
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. Count the occurrence of each number
    // counter[num] represents the occurrence of num
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
    // counter[num]-1 is the last index where num appears in res
    for (i in 0..<m) {
        counter[i + 1] += counter[i]
    }
    // 4. Traverse nums in reverse order, placing each element into the result array res
    // Initialize the array res to record results
    val n = nums.size
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val num = nums[i]
        res[counter[num] - 1] = num // Place num at the corresponding index
        counter[num]-- // Decrement the prefix sum by 1, getting the next index to place num
    }
    // Use result array res to overwrite the original array nums
    for (i in 0..<n) {
        nums[i] = res[i]
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSortNaive(nums)
    println("After counting sort (cannot sort objects), nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSort(nums1)
    println("After counting sort, nums1 = ${nums1.contentToString()}")
}