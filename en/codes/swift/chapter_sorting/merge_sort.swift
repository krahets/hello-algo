/**
 * File: merge_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Merge the left and right subarrays */
func merge(nums: inout [Int], left: Int, mid: Int, right: Int) {
    // The left subarray spans [left, mid], and the right subarray spans [mid+1, right]
    // Create a temporary array tmp to store the merged result
    var tmp = Array(repeating: 0, count: right - left + 1)
    // Initialize the starting indices of the left and right subarrays
    var i = left, j = mid + 1, k = 0
    // While both subarrays have elements remaining, compare them and copy the smaller element into the temporary array
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
    // Copy the elements of temporary array tmp back into the corresponding range of the original array nums
    for k in tmp.indices {
        nums[left + k] = tmp[k]
    }
}

/* Merge sort */
func mergeSort(nums: inout [Int], left: Int, right: Int) {
    // Base case
    if left >= right { // Stop recursing when the subarray has at most one element
        return
    }
    // Divide phase
    let mid = left + (right - left) / 2 // Calculate the midpoint
    mergeSort(nums: &nums, left: left, right: mid) // Recurse on the left subarray
    mergeSort(nums: &nums, left: mid + 1, right: right) // Recurse on the right subarray
    // Merge phase
    merge(nums: &nums, left: left, mid: mid, right: right)
}

@main
enum MergeSort {
    /* Driver code */
    static func main() {
        /* Merge sort */
        var nums = [7, 3, 2, 6, 0, 1, 5, 4]
        mergeSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("After merge sort, nums = \(nums)")
    }
}
