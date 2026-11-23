/**
 * File: binary_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Binary search (closed interval) */
func binarySearch(nums: [Int], target: Int) -> Int {
    // Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
    var i = nums.startIndex
    var j = nums.endIndex - 1
    // Loop until the search interval is empty (when i > j)
    while i <= j {
        let m = i + (j - i) / 2 // Calculate the midpoint index m
        if nums[m] < target { // In this case, target must be in [m+1, j] if it exists
            i = m + 1
        } else if nums[m] > target { // In this case, target must be in [i, m-1] if it exists
            j = m - 1
        } else { // The target element was found; return its index
            return m
        }
    }
    // The target element was not found; return -1
    return -1
}

/* Binary search (left-closed, right-open interval) */
func binarySearchLCRO(nums: [Int], target: Int) -> Int {
    // Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
    var i = nums.startIndex
    var j = nums.endIndex
    // Loop until the search interval is empty (when i = j)
    while i < j {
        let m = i + (j - i) / 2 // Calculate the midpoint index m
        if nums[m] < target { // In this case, target must be in [m+1, j) if it exists
            i = m + 1
        } else if nums[m] > target { // In this case, target must be in [i, m) if it exists
            j = m
        } else { // The target element was found; return its index
            return m
        }
    }
    // The target element was not found; return -1
    return -1
}

@main
enum BinarySearch {
    /* Driver code */
    static func main() {
        let target = 6
        let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

        /* Binary search (closed interval) */
        var index = binarySearch(nums: nums, target: target)
        print("Index of target element 6 = \(index)")

        /* Binary search (left-closed, right-open interval) */
        index = binarySearchLCRO(nums: nums, target: target)
        print("Index of target element 6 = \(index)")
    }
}
