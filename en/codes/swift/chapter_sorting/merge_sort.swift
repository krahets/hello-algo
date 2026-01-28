/**
 * File: merge_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Merge left subarray and right subarray */
func merge(nums: inout [Int], left: Int, mid: Int, right: Int) {
    // Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
    // Create a temporary array tmp to store the merged results
    var tmp = Array(repeating: 0, count: right - left + 1)
    // Initialize the start indices of the left and right subarrays
    var i = left, j = mid + 1, k = 0
    // While both subarrays still have elements, compare and copy the smaller element into the temporary array
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
    // Copy the remaining elements of the left and right subarrays into the temporary array
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
    // Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
    for k in tmp.indices {
        nums[left + k] = tmp[k]
    }
}

/* Merge sort */
func mergeSort(nums: inout [Int], left: Int, right: Int) {
    // Termination condition
    if left >= right { // Terminate recursion when subarray length is 1
        return
    }
    // Divide and conquer stage
    let mid = left + (right - left) / 2 // Calculate midpoint
    mergeSort(nums: &nums, left: left, right: mid) // Recursively process the left subarray
    mergeSort(nums: &nums, left: mid + 1, right: right) // Recursively process the right subarray
    // Merge stage
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
