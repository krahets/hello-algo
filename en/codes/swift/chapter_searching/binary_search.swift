/**
 * File: binary_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Binary search (closed interval on both sides) */
func binarySearch(nums: [Int], target: Int) -> Int {
    // Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
    var i = nums.startIndex
    var j = nums.endIndex - 1
    // Loop, exit when the search interval is empty (empty when i > j)
    while i <= j {
        let m = i + (j - i) / 2 // Calculate the midpoint index m
        if nums[m] < target { // This means target is in the interval [m+1, j]
            i = m + 1
        } else if nums[m] > target { // This means target is in the interval [i, m-1]
            j = m - 1
        } else { // Found the target element, return its index
            return m
        }
    }
    // Target element not found, return -1
    return -1
}

/* Binary search (left-closed right-open interval) */
func binarySearchLCRO(nums: [Int], target: Int) -> Int {
    // Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
    var i = nums.startIndex
    var j = nums.endIndex
    // Loop, exit when the search interval is empty (empty when i = j)
    while i < j {
        let m = i + (j - i) / 2 // Calculate the midpoint index m
        if nums[m] < target { // This means target is in the interval [m+1, j)
            i = m + 1
        } else if nums[m] > target { // This means target is in the interval [i, m)
            j = m
        } else { // Found the target element, return its index
            return m
        }
    }
    // Target element not found, return -1
    return -1
}

@main
enum BinarySearch {
    /* Driver Code */
    static func main() {
        let target = 6
        let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

        /* Binary search (closed interval on both sides) */
        var index = binarySearch(nums: nums, target: target)
        print("Index of target element 6 = \(index)")

        /* Binary search (left-closed right-open interval) */
        index = binarySearchLCRO(nums: nums, target: target)
        print("Index of target element 6 = \(index)")
    }
}
