/**
 * File: merge_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Merge the left and right subarrays */
func merge(nums: inout [Int], left: Int, mid: Int, right: Int) {
    // The left subarray spans [left, mid] and the right spans [mid+1, right]
    // Create a temporary array tmp for the merged result
    var tmp = Array(repeating: 0, count: right - left + 1)
    // Initialize the starting indices of the left and right subarrays
    var i = left, j = mid + 1, k = 0
    // While both subarrays have elements left, compare their front elements and copy the smaller one to the temporary array
    while i <= mid, j <= right {
        if nums[i] <= nums[j] {
            tmp[k] = nums[i]
            i += 1
        } else {
            tmp[k] = nums[j]
            j += 1
        }
        k += 1
    }
    // Copy any remaining elements from either subarray to the temporary array
    while i <= mid {
        tmp[k] = nums[i]
        i += 1
        k += 1
    }
    while j <= right {
        tmp[k] = nums[j]
        j += 1
        k += 1
    }
    // Copy tmp back into the corresponding range of nums
    for k in tmp.indices {
        nums[left + k] = tmp[k]
    }
}

/* Merge sort */
func mergeSort(nums: inout [Int], left: Int, right: Int) {
    // Base case
    if left >= right { // Stop recursing when the subarray has length 1
        return
    }
    // Divide
    let mid = left + (right - left) / 2 // Find the midpoint
    mergeSort(nums: &nums, left: left, right: mid) // Recurse on the left subarray
    mergeSort(nums: &nums, left: mid + 1, right: right) // Recurse on the right subarray
    // Merge
    merge(nums: &nums, left: left, mid: mid, right: right)
}

@main
enum MergeSort {
    /* Driver Code */
    static func main() {
        /* Merge sort */
        var nums = [7, 3, 2, 6, 0, 1, 5, 4]
        mergeSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("After merge sort, nums = \(nums)")
    }
}
