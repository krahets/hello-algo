/**
 * File: selection_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Selection sort */
fun selectionSort(nums: IntArray) {
    val n = nums.size
    // Outer loop: unsorted interval is [i, n-1]
    for (i in 0..<n - 1) {
        var k = i
        // Inner loop: find the smallest element within the unsorted interval
        for (j in i + 1..<n) {
            if (nums[j] < nums[k])
                k = j // Record the index of the smallest element
        }
        // Swap the smallest element with the first element of the unsorted interval
        val temp = nums[i]
        nums[i] = nums[k]
        nums[k] = temp
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    selectionSort(nums)
    println("After selection sort, nums = ${nums.contentToString()}")
}