/**
 * File: quick_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Quicksort class */
/* Partition with two pointers */
func partition(nums: inout [Int], left: Int, right: Int) -> Int {
    // Use nums[left] as the pivot
    var i = left
    var j = right
    while i < j {
        while i < j, nums[j] >= nums[left] {
            j -= 1 // Scan from right to left for the first element smaller than the pivot
        }
        while i < j, nums[i] <= nums[left] {
            i += 1 // Scan from left to right for the first element larger than the pivot
        }
        nums.swapAt(i, j) // Swap these two elements
    }
    nums.swapAt(i, left) // Swap the pivot into place between the two subarrays
    return i // Return the pivot index
}

/* Quicksort */
func quickSort(nums: inout [Int], left: Int, right: Int) {
    // Stop recursing when the subarray has length 1
    if left >= right {
        return
    }
    // Partition with two pointers
    let pivot = partition(nums: &nums, left: left, right: right)
    // Recurse on the left and right subarrays
    quickSort(nums: &nums, left: left, right: pivot - 1)
    quickSort(nums: &nums, left: pivot + 1, right: right)
}

/* Quicksort class with median-of-three pivot selection */
/* Select the median of three candidates */
func medianThree(nums: [Int], left: Int, mid: Int, right: Int) -> Int {
    let l = nums[left]
    let m = nums[mid]
    let r = nums[right]
    if (l <= m && m <= r) || (r <= m && m <= l) {
        return mid // m lies between l and r
    }
    if (m <= l && l <= r) || (r <= l && l <= m) {
        return left // l lies between m and r
    }
    return right
}

/* Partition with two pointers (median of three) */
func partitionMedian(nums: inout [Int], left: Int, right: Int) -> Int {
    // Select the median of three candidates
    let med = medianThree(nums: nums, left: left, mid: left + (right - left) / 2, right: right)
    // Swap the median into the leftmost position
    nums.swapAt(left, med)
    return partition(nums: &nums, left: left, right: right)
}

/* Quicksort with median-of-three pivot selection */
func quickSortMedian(nums: inout [Int], left: Int, right: Int) {
    // Stop recursing when the subarray has length 1
    if left >= right {
        return
    }
    // Partition with two pointers
    let pivot = partitionMedian(nums: &nums, left: left, right: right)
    // Recurse on the left and right subarrays
    quickSortMedian(nums: &nums, left: left, right: pivot - 1)
    quickSortMedian(nums: &nums, left: pivot + 1, right: right)
}

/* Quicksort with reduced recursion depth */
func quickSortTailCall(nums: inout [Int], left: Int, right: Int) {
    var left = left
    var right = right
    // Stop when the subarray has length 1
    while left < right {
        // Partition with two pointers
        let pivot = partition(nums: &nums, left: left, right: right)
        // Apply quicksort to the shorter of the two subarrays
        if (pivot - left) < (right - pivot) {
            quickSortTailCall(nums: &nums, left: left, right: pivot - 1) // Recursively sort the left subarray
            left = pivot + 1 // The remaining unsorted range is [pivot + 1, right]
        } else {
            quickSortTailCall(nums: &nums, left: pivot + 1, right: right) // Recursively sort the right subarray
            right = pivot - 1 // The remaining unsorted range is [left, pivot - 1]
        }
    }
}

@main
enum QuickSort {
    /* Driver Code */
    static func main() {
        /* Quicksort */
        var nums = [2, 4, 1, 0, 3, 5]
        quickSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("After quicksort, nums = \(nums)")

        /* Quicksort with median-of-three pivot selection */
        var nums1 = [2, 4, 1, 0, 3, 5]
        quickSortMedian(nums: &nums1, left: nums1.startIndex, right: nums1.endIndex - 1)
        print("After median-of-three quicksort, nums1 = \(nums1)")

        /* Quicksort with reduced recursion depth */
        var nums2 = [2, 4, 1, 0, 3, 5]
        quickSortTailCall(nums: &nums2, left: nums2.startIndex, right: nums2.endIndex - 1)
        print("After quicksort with reduced recursion depth, nums2 = \(nums2)")
    }
}
