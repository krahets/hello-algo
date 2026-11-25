/**
 * File: merge_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Merge the left and right subarrays */
fun merge(nums: IntArray, left: Int, mid: Int, right: Int) {
    // The left subarray spans [left, mid] and the right spans [mid+1, right]
    // Create a temporary array tmp for the merged result
    val tmp = IntArray(right - left + 1)
    // Initialize the starting indices of the left and right subarrays
    var i = left
    var j = mid + 1
    var k = 0
    // While both subarrays have elements left, compare their front elements and copy the smaller one to the temporary array
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j])
            tmp[k++] = nums[i++]
        else
            tmp[k++] = nums[j++]
    }
    // Copy any remaining elements from either subarray to the temporary array
    while (i <= mid) {
        tmp[k++] = nums[i++]
    }
    while (j <= right) {
        tmp[k++] = nums[j++]
    }
    // Copy tmp back into the corresponding range of nums
    for (l in tmp.indices) {
        nums[left + l] = tmp[l]
    }
}

/* Merge sort */
fun mergeSort(nums: IntArray, left: Int, right: Int) {
    // Base case
    if (left >= right) return  // Stop recursing when the subarray has length 1
    // Divide
    val mid = left + (right - left) / 2 // Find the midpoint
    mergeSort(nums, left, mid) // Recurse on the left subarray
    mergeSort(nums, mid + 1, right) // Recurse on the right subarray
    // Merge
    merge(nums, left, mid, right)
}

/* Driver Code */
fun main() {
    /* Merge sort */
    val nums = intArrayOf(7, 3, 2, 6, 0, 1, 5, 4)
    mergeSort(nums, 0, nums.size - 1)
    println("After merge sort, nums = ${nums.contentToString()}")
}
