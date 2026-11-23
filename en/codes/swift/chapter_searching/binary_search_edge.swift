/**
 * File: binary_search_edge.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

import binary_search_insertion_target

/* Find the leftmost occurrence of target using binary search */
func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
    // This is equivalent to finding the insertion point of target
    let i = binarySearchInsertion(nums: nums, target: target)
    // If target was not found, return -1
    if i == nums.endIndex || nums[i] != target {
        return -1
    }
    // Target was found; return index i
    return i
}

/* Find the rightmost occurrence of target using binary search */
func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
    // Reduce the problem to finding the leftmost insertion point of target + 1
    let i = binarySearchInsertion(nums: nums, target: target + 1)
    // i is the first index with a value greater than target (or nums.endIndex); j is the candidate index of the rightmost target
    let j = i - 1
    // If target was not found, return -1
    if j == -1 || nums[j] != target {
        return -1
    }
    // Target was found; return index j
    return j
}

@main
enum BinarySearchEdge {
    /* Driver code */
    static func main() {
        // Array containing duplicate elements
        let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\nArray nums = \(nums)")

        // Find the left and right boundaries using binary search
        for target in [6, 7] {
            var index = binarySearchLeftEdge(nums: nums, target: target)
            print("Index of the leftmost occurrence of \(target): \(index)")
            index = binarySearchRightEdge(nums: nums, target: target)
            print("Index of the rightmost occurrence of \(target): \(index)")
        }
    }
}
