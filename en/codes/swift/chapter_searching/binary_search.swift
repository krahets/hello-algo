/**
 * File: binary_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Binary search on a closed interval */
func binarySearch(nums: [Int], target: Int) -> Int {
    // Initialize the closed interval [0, n-1] with i at the first element and j at the last
    var i = nums.startIndex
    var j = nums.endIndex - 1
    // Stop when the search interval is empty (i > j)
    while i <= j {
        let m = i + (j - i) / 2 // Compute the midpoint index m
        if nums[m] < target { // Any match must lie in [m+1, j]
            i = m + 1
        } else if nums[m] > target { // Any match must lie in [i, m-1]
            j = m - 1
        } else { // Found the target. Return its index
            return m
        }
    }
    // Target not found. Return -1
    return -1
}

/* Binary search on a left-closed, right-open interval */
func binarySearchLCRO(nums: [Int], target: Int) -> Int {
    // Initialize [0, n) with i at the first element and j one past the last
    var i = nums.startIndex
    var j = nums.endIndex
    // Stop when the search interval is empty (i = j)
    while i < j {
        let m = i + (j - i) / 2 // Compute the midpoint index m
        if nums[m] < target { // Any match must lie in [m+1, j)
            i = m + 1
        } else if nums[m] > target { // Any match must lie in [i, m)
            j = m
        } else { // Found the target. Return its index
            return m
        }
    }
    // Target not found. Return -1
    return -1
}

@main
enum BinarySearch {
    /* Driver code */
    static func main() {
        let target = 6
        let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

        /* Binary search on a closed interval */
        var index = binarySearch(nums: nums, target: target)
        print("Index of target 6 = \(index)")

        /* Binary search on a left-closed, right-open interval */
        index = binarySearchLCRO(nums: nums, target: target)
        print("Index of target 6 = \(index)")
    }
}
