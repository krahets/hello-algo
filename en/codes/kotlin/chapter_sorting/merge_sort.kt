/**
 * File: merge_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Merge left subarray and right subarray */
fun merge(nums: IntArray, left: Int, mid: Int, right: Int) {
    // Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
    // Create a temporary array tmp to store the merged results
    val tmp = IntArray(right - left + 1)
    // Initialize the start indices of the left and right subarrays
    var i = left
    var j = mid + 1
    var k = 0
    // While both subarrays still have elements, compare and copy the smaller element into the temporary array
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j])
            tmp[k++] = nums[i++]
        else
            tmp[k++] = nums[j++]
    }
    // Copy the remaining elements of the left and right subarrays into the temporary array
    while (i <= mid) {
        tmp[k++] = nums[i++]
    }
    while (j <= right) {
        tmp[k++] = nums[j++]
    }
    // Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
    for (l in tmp.indices) {
        nums[left + l] = tmp[l]
    }
}

/* Merge sort */
fun mergeSort(nums: IntArray, left: Int, right: Int) {
    // Termination condition
    if (left >= right) return  // Terminate recursion when subarray length is 1
    // Divide and conquer stage
    val mid = left + (right - left) / 2 // Calculate midpoint
    mergeSort(nums, left, mid) // Recursively process the left subarray
    mergeSort(nums, mid + 1, right) // Recursively process the right subarray
    // Merge stage
    merge(nums, left, mid, right)
}

/* Driver Code */
fun main() {
    /* Merge sort */
    val nums = intArrayOf(7, 3, 2, 6, 0, 1, 5, 4)
    mergeSort(nums, 0, nums.size - 1)
    println("After merge sort, nums = ${nums.contentToString()}")
}
