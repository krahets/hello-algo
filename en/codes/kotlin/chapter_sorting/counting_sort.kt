/**
 * File: counting_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

import kotlin.math.max

/* Counting sort */
// Simple implementation that cannot sort objects
fun countingSortNaive(nums: IntArray) {
    // 1. Find the largest array element m
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. Count the occurrences of each number
    // counter[num] holds the number of occurrences of num
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. Traverse counter and write each value back into nums
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
// Full implementation that can sort objects and is stable
fun countingSort(nums: IntArray) {
    // 1. Find the largest array element m
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. Count the occurrences of each number
    // counter[num] holds the number of occurrences of num
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. Compute prefix sums in counter to locate the last position for each value
    // That is, counter[num]-1 is the last index of num in res
    for (i in 0..<m) {
        counter[i + 1] += counter[i]
    }
    // 4. Traverse nums backward and place each element in the result array res
    // Initialize the result array res
    val n = nums.size
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val num = nums[i]
        res[counter[num] - 1] = num // Place num at its corresponding index
        counter[num]-- // Decrement the prefix sum by 1 to find the next index for num
    }
    // Copy res back into the original array nums
    for (i in 0..<n) {
        nums[i] = res[i]
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSortNaive(nums)
    println("After counting sort (values only), nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSort(nums1)
    println("After counting sort, nums1 = ${nums1.contentToString()}")
}