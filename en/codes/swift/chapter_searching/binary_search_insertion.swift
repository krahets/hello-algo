/**
 * File: binary_search_insertion.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Binary search for insertion point (no duplicate elements) */
func binarySearchInsertionSimple(nums: [Int], target: Int) -> Int {
    // Initialize closed interval [0, n-1]
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // Calculate the midpoint index m
        if nums[m] < target {
            i = m + 1 // target is in the interval [m+1, j]
        } else if nums[m] > target {
            j = m - 1 // target is in the interval [i, m-1]
        } else {
            return m // Found target, return insertion point m
        }
    }
    // Target not found, return insertion point i
    return i
}

/* Binary search for insertion point (with duplicate elements) */
public func binarySearchInsertion(nums: [Int], target: Int) -> Int {
    // Initialize closed interval [0, n-1]
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // Calculate the midpoint index m
        if nums[m] < target {
            i = m + 1 // target is in the interval [m+1, j]
        } else if nums[m] > target {
            j = m - 1 // target is in the interval [i, m-1]
        } else {
            j = m - 1 // The first element less than target is in the interval [i, m-1]
        }
    }
    // Return insertion point i
    return i
}

#if !TARGET

@main
enum BinarySearchInsertion {
    /* Driver Code */
    static func main() {
        // Array without duplicate elements
        var nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
        print("\nArray nums = \(nums)")
        // Binary search for insertion point
        for target in [6, 9] {
            let index = binarySearchInsertionSimple(nums: nums, target: target)
            print("Insertion point index for element \(target) is \(index)")
        }

        // Array with duplicate elements
        nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\nArray nums = \(nums)")
        // Binary search for insertion point
        for target in [2, 6, 20] {
            let index = binarySearchInsertion(nums: nums, target: target)
            print("Insertion point index for element \(target) is \(index)")
        }
    }
}

#endif
