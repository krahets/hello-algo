/**
 * File: binary_search_insertion.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Binary search for an insertion point (no duplicates) */
func binarySearchInsertionSimple(nums: [Int], target: Int) -> Int {
    // Initialize the closed interval [0, n-1]
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // Compute the midpoint index m
        if nums[m] < target {
            i = m + 1 // Any match must lie in [m+1, j]
        } else if nums[m] > target {
            j = m - 1 // Any match must lie in [i, m-1]
        } else {
            return m // Found target. Return insertion point m
        }
    }
    // Target not found. Return insertion point i
    return i
}

/* Binary search for an insertion point (duplicates allowed) */
public func binarySearchInsertion(nums: [Int], target: Int) -> Int {
    // Initialize the closed interval [0, n-1]
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // Compute the midpoint index m
        if nums[m] < target {
            i = m + 1 // Any match must lie in [m+1, j]
        } else if nums[m] > target {
            j = m - 1 // Any match must lie in [i, m-1]
        } else {
            j = m - 1 // Look in [i, m-1] for the rightmost element less than target
        }
    }
    // Return insertion point i
    return i
}

#if !TARGET

@main
enum BinarySearchInsertion {
    /* Driver code */
    static func main() {
        // Array without duplicates
        var nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
        print("\nArray nums = \(nums)")
        // Find the insertion point using binary search
        for target in [6, 9] {
            let index = binarySearchInsertionSimple(nums: nums, target: target)
            print("Insertion index for \(target) = \(index)")
        }

        // Array with duplicates
        nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\nArray nums = \(nums)")
        // Find the insertion point using binary search
        for target in [2, 6, 20] {
            let index = binarySearchInsertion(nums: nums, target: target)
            print("Insertion index for \(target) = \(index)")
        }
    }
}

#endif
