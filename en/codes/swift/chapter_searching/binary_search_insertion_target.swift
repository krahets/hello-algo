/**
 * File: binary_search_insertion.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Find an insertion point using binary search (no duplicates) */
func binarySearchInsertionSimple(nums: [Int], target: Int) -> Int {
    // Initialize the closed interval [0, n-1]
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // Calculate the midpoint index m
        if nums[m] < target {
            i = m + 1 // Target must be in [m+1, j] if it exists
        } else if nums[m] > target {
            j = m - 1 // Target must be in [i, m-1] if it exists
        } else {
            return m // Target was found; return insertion point m
        }
    }
    // Target was not found; return insertion point i
    return i
}

/* Find an insertion point using binary search (with duplicates) */
public func binarySearchInsertion(nums: [Int], target: Int) -> Int {
    // Initialize the closed interval [0, n-1]
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // Calculate the midpoint index m
        if nums[m] < target {
            i = m + 1 // Target must be in [m+1, j] if it exists
        } else if nums[m] > target {
            j = m - 1 // Target must be in [i, m-1] if it exists
        } else {
            j = m - 1 // Continue in [i, m-1] to find the rightmost element smaller than target
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
        // Array with no duplicate elements
        var nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
        print("\nArray nums = \(nums)")
        // Find an insertion point using binary search
        for target in [6, 9] {
            let index = binarySearchInsertionSimple(nums: nums, target: target)
            print("Insertion index for element \(target): \(index)")
        }

        // Array containing duplicate elements
        nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\nArray nums = \(nums)")
        // Find an insertion point using binary search
        for target in [2, 6, 20] {
            let index = binarySearchInsertion(nums: nums, target: target)
            print("Insertion index for element \(target): \(index)")
        }
    }
}

#endif
