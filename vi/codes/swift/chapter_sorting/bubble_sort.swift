/**
 * File: bubble_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Bubble sort */
func bubbleSort(nums: inout [Int]) {
    // Outer loop: unsorted range is [0, i]
    for i in nums.indices.dropFirst().reversed() {
        // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // Swap nums[j] and nums[j + 1]
                nums.swapAt(j, j + 1)
            }
        }
    }
}

/* Bubble sort (flag optimization) */
func bubbleSortWithFlag(nums: inout [Int]) {
    // Outer loop: unsorted range is [0, i]
    for i in nums.indices.dropFirst().reversed() {
        var flag = false // Initialize flag
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // Swap nums[j] and nums[j + 1]
                nums.swapAt(j, j + 1)
                flag = true // Record element swap
            }
        }
        if !flag { // No elements were swapped in this round of "bubbling", exit directly
            break
        }
    }
}

@main
enum BubbleSort {
    /* Driver Code */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        bubbleSort(nums: &nums)
        print("After bubble sort, nums = \(nums)")

        var nums1 = [4, 1, 3, 1, 5, 2]
        bubbleSortWithFlag(nums: &nums1)
        print("After bubble sort, nums1 = \(nums1)")
    }
}
