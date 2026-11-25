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

/* Partition with two pointers */
fun partition(nums: IntArray, left: Int, right: Int): Int {
    // Use nums[left] as the pivot
    var i = left
    var j = right
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--           // Scan from right to left for the first element smaller than the pivot
        while (i < j && nums[i] <= nums[left])
            i++           // Scan from left to right for the first element larger than the pivot
        swap(nums, i, j)  // Swap these two elements
    }
    swap(nums, i, left)   // Swap the pivot into place between the two subarrays
    return i              // Return the pivot index
}

/* Quicksort */
fun quickSort(nums: IntArray, left: Int, right: Int) {
    // Stop recursing when the subarray has length 1
    if (left >= right) return
    // Partition with two pointers
    val pivot = partition(nums, left, right)
    // Recurse on the left and right subarrays
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
}

/* Select the median of three candidates */
fun medianThree(nums: IntArray, left: Int, mid: Int, right: Int): Int {
    val l = nums[left]
    val m = nums[mid]
    val r = nums[right]
    if ((m in l..r) || (m in r..l))
        return mid  // m lies between l and r
    if ((l in m..r) || (l in r..m))
        return left // l lies between m and r
    return right
}

/* Partition with two pointers (median of three) */
fun partitionMedian(nums: IntArray, left: Int, right: Int): Int {
    // Select the median of three candidates
    val med = medianThree(nums, left, (left + right) / 2, right)
    // Swap the median into the leftmost position
    swap(nums, left, med)
    // Use nums[left] as the pivot
    var i = left
    var j = right
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--                      // Scan from right to left for the first element smaller than the pivot
        while (i < j && nums[i] <= nums[left])
            i++                      // Scan from left to right for the first element larger than the pivot
        swap(nums, i, j)             // Swap these two elements
    }
    swap(nums, i, left)              // Swap the pivot into place between the two subarrays
    return i                         // Return the pivot index
}

/* Quicksort */
fun quickSortMedian(nums: IntArray, left: Int, right: Int) {
    // Stop recursing when the subarray has length 1
    if (left >= right) return
    // Partition with two pointers
    val pivot = partitionMedian(nums, left, right)
    // Recurse on the left and right subarrays
    quickSort(nums, left, pivot - 1)
    quickSort(nums, pivot + 1, right)
}

/* Quicksort with reduced recursion depth */
fun quickSortTailCall(nums: IntArray, left: Int, right: Int) {
    // Stop when the subarray has length 1
    var l = left
    var r = right
    while (l < r) {
        // Partition with two pointers
        val pivot = partition(nums, l, r)
        // Apply quicksort to the shorter of the two subarrays
        if (pivot - l < r - pivot) {
            quickSort(nums, l, pivot - 1) // Recursively sort the left subarray
            l = pivot + 1 // The remaining unsorted range is [pivot + 1, right]
        } else {
            quickSort(nums, pivot + 1, r) // Recursively sort the right subarray
            r = pivot - 1 // The remaining unsorted range is [left, pivot - 1]
        }
    }
}

/* Driver Code */
fun main() {
    /* Quicksort */
    val nums = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSort(nums, 0, nums.size - 1)
    println("After quicksort, nums = ${nums.contentToString()}")

    /* Quicksort with median-of-three pivot selection */
    val nums1 = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSortMedian(nums1, 0, nums1.size - 1)
    println("After median-of-three quicksort, nums1 = ${nums1.contentToString()}")

    /* Quicksort with reduced recursion depth */
    val nums2 = intArrayOf(2, 4, 1, 0, 3, 5)
    quickSortTailCall(nums2, 0, nums2.size - 1)
    println("After quicksort with reduced recursion depth, nums2 = ${nums2.contentToString()}")
}