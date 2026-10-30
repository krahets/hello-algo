/**
 * File: counting_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

import kotlin.math.max

/* Counting sort */
// Simple implementation; cannot be used to sort objects
fun countingSortNaive(nums: IntArray) {
    // 1. Find the maximum array element m
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. Count the occurrences of each number
    // counter[num] is the number of occurrences of num
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. Traverse counter and fill the original array nums with the elements
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
// Full implementation; stable and adaptable to sorting objects
fun countingSort(nums: IntArray) {
    // 1. Find the maximum array element m
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. Count the occurrences of each number
    // counter[num] is the number of occurrences of num
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. Compute prefix sums of counter to convert occurrence counts into end positions
    // That is, counter[num]-1 is the index of the last occurrence of num in res
    for (i in 0..<m) {
        counter[i + 1] += counter[i]
    }
    // 4. Traverse nums in reverse and place each element in the result array res
    // Initialize array res to store the result
    val n = nums.size
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val num = nums[i]
        res[counter[num] - 1] = num // Place num at the corresponding index
        counter[num]-- // Decrement the prefix sum by 1 to determine where to place the next occurrence of num
    }
    // Overwrite the original array nums with the result array res
    for (i in 0..<n) {
        nums[i] = res[i]
    }
}

/* Driver code */
fun main() {
    val nums = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSortNaive(nums)
    println("After counting sort (cannot sort objects): nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSort(nums1)
    println("After counting sort: nums1 = ${nums1.contentToString()}")
}