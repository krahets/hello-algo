/**
 * File: binary_search_edge.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

import binary_search_insertion_target

/* Binary search for the leftmost target */
func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
    // Equivalent to finding the insertion point of target
    let i = binarySearchInsertion(nums: nums, target: target)
    // Target not found, return -1
    if i == nums.endIndex || nums[i] != target {
        return -1
    }
    // Found target, return index i
    return i
}

/* Binary search for the rightmost target */
func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
    // Convert to finding the leftmost target + 1
    let i = binarySearchInsertion(nums: nums, target: target + 1)
    // j points to the rightmost target, i points to the first element greater than target
    let j = i - 1
    // Target not found, return -1
    if j == -1 || nums[j] != target {
        return -1
    }
    // Found target, return index j
    return j
}

@main
enum BinarySearchEdge {
    /* Driver Code */
    static func main() {
        // Array with duplicate elements
        let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\nArray nums = \(nums)")

        // Binary search left and right boundaries
        for target in [6, 7] {
            var index = binarySearchLeftEdge(nums: nums, target: target)
            print("Leftmost element \(target) index is \(index)")
            index = binarySearchRightEdge(nums: nums, target: target)
            print("Rightmost element \(target) index is \(index)")
        }
    }
}
