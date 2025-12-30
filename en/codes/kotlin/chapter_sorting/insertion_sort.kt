/**
 * File: insertion_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Insertion sort */
fun insertionSort(nums: IntArray) {
    // Outer loop: sorted elements are 1, 2, ..., n
    for (i in nums.indices) {
        val base = nums[i]
        var j = i - 1
        // Inner loop: insert base into the correct position within the sorted interval [0, i-1]
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j] // Move nums[j] to the right by one position
            j--
        }
        nums[j + 1] = base        // Assign base to the correct position
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    insertionSort(nums)
    println("After insertion sort, nums = ${nums.contentToString()}")
}