/**
 * File: quick_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Quick sort class */
/* Sentinel partition */
func partition(nums: inout [Int], left: Int, right: Int) -> Int {
    // Use nums[left] as the pivot
    var i = left
    var j = right
    while i < j {
        while i < j, nums[j] >= nums[left] {
            j -= 1 // Search from right to left for the first element smaller than the pivot
        }
        while i < j, nums[i] <= nums[left] {
            i += 1 // Search from left to right for the first element greater than the pivot
        }
        nums.swapAt(i, j) // Swap these two elements
    }
    nums.swapAt(i, left) // Swap the pivot to the boundary between the two subarrays
    return i // Return the index of the pivot
}

/* Quick sort */
func quickSort(nums: inout [Int], left: Int, right: Int) {
    // Terminate recursion when subarray length is 1
    if left >= right {
        return
    }
    // Sentinel partition
    let pivot = partition(nums: &nums, left: left, right: right)
    // Recursively process the left subarray and right subarray
    quickSort(nums: &nums, left: left, right: pivot - 1)
    quickSort(nums: &nums, left: pivot + 1, right: right)
}

/* Quick sort class (median pivot optimization) */
/* Select the median of three candidate elements */
func medianThree(nums: [Int], left: Int, mid: Int, right: Int) -> Int {
    let l = nums[left]
    let m = nums[mid]
    let r = nums[right]
    if (l <= m && m <= r) || (r <= m && m <= l) {
        return mid // m is between l and r
    }
    if (m <= l && l <= r) || (r <= l && l <= m) {
        return left // l is between m and r
    }
    return right
}

/* Sentinel partition (median of three) */
func partitionMedian(nums: inout [Int], left: Int, right: Int) -> Int {
    // Select the median of three candidate elements
    let med = medianThree(nums: nums, left: left, mid: left + (right - left) / 2, right: right)
    // Swap the median to the array's leftmost position
    nums.swapAt(left, med)
    return partition(nums: &nums, left: left, right: right)
}

/* Quick sort (recursion depth optimization) */
func quickSortMedian(nums: inout [Int], left: Int, right: Int) {
    // Terminate recursion when subarray length is 1
    if left >= right {
        return
    }
    // Sentinel partition
    let pivot = partitionMedian(nums: &nums, left: left, right: right)
    // Recursively process the left subarray and right subarray
    quickSortMedian(nums: &nums, left: left, right: pivot - 1)
    quickSortMedian(nums: &nums, left: pivot + 1, right: right)
}

/* Quick sort (recursion depth optimization) */
func quickSortTailCall(nums: inout [Int], left: Int, right: Int) {
    var left = left
    var right = right
    // Terminate when subarray length is 1
    while left < right {
        // Sentinel partition operation
        let pivot = partition(nums: &nums, left: left, right: right)
        // Perform quick sort on the shorter of the two subarrays
        if (pivot - left) < (right - pivot) {
            quickSortTailCall(nums: &nums, left: left, right: pivot - 1) // Recursively sort the left subarray
            left = pivot + 1 // Remaining unsorted interval is [pivot + 1, right]
        } else {
            quickSortTailCall(nums: &nums, left: pivot + 1, right: right) // Recursively sort the right subarray
            right = pivot - 1 // Remaining unsorted interval is [left, pivot - 1]
        }
    }
}

@main
enum QuickSort {
    /* Driver Code */
    static func main() {
        /* Quick sort */
        var nums = [2, 4, 1, 0, 3, 5]
        quickSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("After quick sort, nums = \(nums)")

        /* Quick sort (recursion depth optimization) */
        var nums1 = [2, 4, 1, 0, 3, 5]
        quickSortMedian(nums: &nums1, left: nums1.startIndex, right: nums1.endIndex - 1)
        print("After quick sort (median pivot optimization), nums1 = \(nums1)")

        /* Quick sort (recursion depth optimization) */
        var nums2 = [2, 4, 1, 0, 3, 5]
        quickSortTailCall(nums: &nums2, left: nums2.startIndex, right: nums2.endIndex - 1)
        print("After quick sort (recursion depth optimization), nums2 = \(nums2)")
    }
}
