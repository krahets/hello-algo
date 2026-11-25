/**
 * File: binary_search_edge.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

import binary_search_insertion_target

/* Use binary search to find the leftmost occurrence of target */
func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
    // Equivalent to finding the insertion point for target
    let i = binarySearchInsertion(nums: nums, target: target)
    // Target not found. Return -1
    if i == nums.endIndex || nums[i] != target {
        return -1
    }
    // Found target. Return index i
    return i
}

/* Use binary search to find the rightmost occurrence of target */
func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
    // Search for the leftmost occurrence of target + 1
    let i = binarySearchInsertion(nums: nums, target: target + 1)
    // j points to the rightmost occurrence of target, and i to the first larger element
    let j = i - 1
    // Target not found. Return -1
    if j == -1 || nums[j] != target {
        return -1
    }
    // Found target. Return index j
    return j
}

@main
enum BinarySearchEdge {
    /* Driver code */
    static func main() {
        // Array with duplicates
        let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\nArray nums = \(nums)")

        // Find the left and right boundaries using binary search
        for target in [6, 7] {
            var index = binarySearchLeftEdge(nums: nums, target: target)
            print("Index of the leftmost occurrence of \(target) = \(index)")
            index = binarySearchRightEdge(nums: nums, target: target)
            print("Index of the rightmost occurrence of \(target) = \(index)")
        }
    }
}
