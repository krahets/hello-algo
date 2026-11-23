/**
 * File: insertion_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Insertion sort */
fun insertionSort(nums: IntArray) {
    //Outer loop: the sorted prefix grows to 1, 2, ..., n elements
    for (i in nums.indices) {
        val base = nums[i]
        var j = i - 1
        // Inner loop: insert base at the correct position in the sorted range [0, i-1]
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j] // Shift nums[j] one position to the right
            j--
        }
        nums[j + 1] = base        // Place base at the correct position
    }
}

/* Driver code */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    insertionSort(nums)
    println("After insertion sort: nums = ${nums.contentToString()}")
}