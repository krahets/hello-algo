/**
 * File: binary_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Binary search (double closed interval) */
func binarySearch(nums: [Int], target: Int) -> Int {
    // Initialize double closed interval [0, n-1], i.e., i, j point to the first element and last element of the array respectively
    var i = nums.startIndex
    var j = nums.endIndex - 1
    // Loop until the search interval is empty (when i > j, it is empty)
    while i <= j {
        let m = i + (j - i) / 2 // Calculate midpoint index m
        if nums[m] < target { // This situation indicates that target is in the interval [m+1, j]
            i = m + 1
        } else if nums[m] > target { // This situation indicates that target is in the interval [i, m-1]
            j = m - 1
        } else { // Found the target element, thus return its index
            return m
        }
    }
    // Did not find the target element, thus return -1
    return -1
}

/* Binary search (left closed right open interval) */
func binarySearchLCRO(nums: [Int], target: Int) -> Int {
    // Initialize left closed right open interval [0, n), i.e., i, j point to the first element and the last element +1 of the array respectively
    var i = nums.startIndex
    var j = nums.endIndex
    // Loop until the search interval is empty (when i = j, it is empty)
    while i < j {
        let m = i + (j - i) / 2 // Calculate midpoint index m
        if nums[m] < target { // This situation indicates that target is in the interval [m+1, j)
            i = m + 1
        } else if nums[m] > target { // This situation indicates that target is in the interval [i, m)
            j = m
        } else { // Found the target element, thus return its index
            return m
        }
    }
    // Did not find the target element, thus return -1
    return -1
}

@main
enum BinarySearch {
    /* Driver Code */
    static func main() {
        let target = 6
        let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

        /* Binary search (double closed interval) */
        var index = binarySearch(nums: nums, target: target)
        print("Index of target element 6 = \(index)")

        /* Binary search (left closed right open interval) */
        index = binarySearchLCRO(nums: nums, target: target)
        print("Index of target element 6 = \(index)")
    }
}
