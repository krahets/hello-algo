/**
 * File: quick_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* Swap elements */
fun swap(nums: IntArray, i: Int, j: Int) {
    val temp = nums[i]
    nums[i] = nums[j]
    nums[j] = temp
}

/* Sentinel partition */
fun partition(nums: IntArray, left: Int, right: Int): Int {
    // Use nums[left] as the pivot
    var i = left
    var j = right
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--           // Search from right to left for the first element smaller than the pivot
        while (i < j && nums[i] <= nums[left])
            i++           // Search from left to right for the first element greater than the pivot
        swap(nums, i, j)  // Swap these two elements
    }
    swap(nums, i, left)   // Swap the pivot to the boundary between the two subarrays
    return i              // Return the index of the pivot
}

/* Quick sort */
fun quickSort(nums: IntArray, left: Int, right: Int) {
    // Terminate recursion when subarray length is 1
    if (left >= right) return
    // Sentinel partition
    val pivot = partition(nums, left, right)
    // Recursively process the left subarray and right subarray
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
}

/* Select the median of three candidate elements */
fun medianThree(nums: IntArray, left: Int, mid: Int, right: Int): Int {
    val l = nums[left]
    val m = nums[mid]
    val r = nums[right]
    if ((m in l..r) || (m in r..l))
        return mid  // m is between l and r
    if ((l in m..r) || (l in r..m))
        return left // l is between m and r
    return right
}

/* Sentinel partition (median of three) */
fun partitionMedian(nums: IntArray, left: Int, right: Int): Int {
    // Select the median of three candidate elements
    val med = medianThree(nums, left, (left + right) / 2, right)
    // Swap the median to the array's leftmost position
    swap(nums, left, med)
    // Use nums[left] as the pivot
    var i = left
    var j = right
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--                      // Search from right to left for the first element smaller than the pivot
        while (i < j && nums[i] <= nums[left])
            i++                      // Search from left to right for the first element greater than the pivot
        swap(nums, i, j)             // Swap these two elements
    }
    swap(nums, i, left)              // Swap the pivot to the boundary between the two subarrays
    return i                         // Return the index of the pivot
}

/* Quick sort */
fun quickSortMedian(nums: IntArray, left: Int, right: Int) {
    // Terminate recursion when subarray length is 1
    if (left >= right) return
    // Sentinel partition
    val pivot = partitionMedian(nums, left, right)
    // Recursively process the left subarray and right subarray
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
}

/* Quick sort (recursion depth optimization) */
fun quickSortTailCall(nums: IntArray, left: Int, right: Int) {
    // Terminate when subarray length is 1
    var l = left
    var r = right
    while (l < r) {
        // Sentinel partition operation
        val pivot = partition(nums, l, r)
        // Perform quick sort on the shorter of the two subarrays
        if (pivot - l < r - pivot) {
            quickSort(nums, l, pivot - 1) // Recursively sort the left subarray
            l = pivot + 1 // Remaining unsorted interval is [pivot + 1, right]
        } else {
            quickSort(nums, pivot + 1, r) // Recursively sort the right subarray
            r = pivot - 1 // Remaining unsorted interval is [left, pivot - 1]
        }
    }
}

/* Driver Code */
fun main() {
    /* Quick sort */
    val nums = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSort(nums, 0, nums.size - 1)
    println("After quick sort, nums = ${nums.contentToString()}")

    /* Quick sort (recursion depth optimization) */
    val nums1 = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSortMedian(nums1, 0, nums1.size - 1)
    println("After quick sort (median pivot optimization), nums1 = ${nums1.contentToString()}")

    /* Quick sort (recursion depth optimization) */
    val nums2 = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSortTailCall(nums2, 0, nums2.size - 1)
    println("After quick sort (recursion depth optimization), nums2 = ${nums2.contentToString()}")
}