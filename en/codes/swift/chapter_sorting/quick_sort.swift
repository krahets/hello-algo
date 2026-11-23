/**
 * File: quick_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Quick sort functions */
/* Two-pointer partitioning */
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
    nums.swapAt(i, left) // Swap the pivot into the boundary position between the two subarrays
    return i // Return the pivot index
}

/* Quick sort */
func quickSort(nums: inout [Int], left: Int, right: Int) {
    // Stop recursing when the subarray has at most one element
    if left >= right {
        return
    }
    // Two-pointer partitioning
    let pivot = partition(nums: &nums, left: left, right: right)
    // Recurse on the left and right subarrays
    quickSort(nums: &nums, left: left, right: pivot - 1)
    quickSort(nums: &nums, left: pivot + 1, right: right)
}

/* Quick sort functions (median pivot optimization) */
/* Select the median of three candidate elements */
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

/* Two-pointer partitioning (median of three) */
func partitionMedian(nums: inout [Int], left: Int, right: Int) -> Int {
    // Select the median of three candidate elements
    let med = medianThree(nums: nums, left: left, mid: left + (right - left) / 2, right: right)
    // Swap the median into the leftmost position of the current subarray
    nums.swapAt(left, med)
    return partition(nums: &nums, left: left, right: right)
}

/* Quick sort (median pivot optimization) */
func quickSortMedian(nums: inout [Int], left: Int, right: Int) {
    // Stop recursing when the subarray has at most one element
    if left >= right {
        return
    }
    // Two-pointer partitioning
    let pivot = partitionMedian(nums: &nums, left: left, right: right)
    // Recurse on the left and right subarrays
    quickSortMedian(nums: &nums, left: left, right: pivot - 1)
    quickSortMedian(nums: &nums, left: pivot + 1, right: right)
}

/* Quick sort (recursion depth optimization) */
func quickSortTailCall(nums: inout [Int], left: Int, right: Int) {
    var left = left
    var right = right
    // Stop when the subarray has at most one element
    while left < right {
        // Perform two-pointer partitioning
        let pivot = partition(nums: &nums, left: left, right: right)
        // Apply quick sort to the shorter of the two subarrays
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
    /* Driver code */
    static func main() {
        /* Quick sort */
        var nums = [2, 4, 1, 0, 3, 5]
        quickSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("After quick sort, nums = \(nums)")

        /* Quick sort (median pivot optimization) */
        var nums1 = [2, 4, 1, 0, 3, 5]
        quickSortMedian(nums: &nums1, left: nums1.startIndex, right: nums1.endIndex - 1)
        print("After quick sort (median pivot optimization), nums1 = \(nums1)")

        /* Quick sort (recursion depth optimization) */
        var nums2 = [2, 4, 1, 0, 3, 5]
        quickSortTailCall(nums: &nums2, left: nums2.startIndex, right: nums2.endIndex - 1)
        print("After quick sort (recursion depth optimization), nums2 = \(nums2)")
    }
}
