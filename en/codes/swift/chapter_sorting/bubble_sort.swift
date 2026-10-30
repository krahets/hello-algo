/**
 * File: bubble_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Bubble sort */
func bubbleSort(nums: inout [Int]) {
    // Outer loop: the unsorted range is [0, i]
    for i in nums.indices.dropFirst().reversed() {
        // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // Swap nums[j] and nums[j + 1]
                nums.swapAt(j, j + 1)
            }
        }
    }
}

/* Bubble sort (flag optimization)*/
func bubbleSortWithFlag(nums: inout [Int]) {
    // Outer loop: the unsorted range is [0, i]
    for i in nums.indices.dropFirst().reversed() {
        var flag = false // Initialize the flag
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // Swap nums[j] and nums[j + 1]
                nums.swapAt(j, j + 1)
                flag = true // Record that a swap occurred
            }
        }
        if !flag { // Exit immediately if this pass made no swaps
            break
        }
    }
}

@main
enum BubbleSort {
    /* Driver code */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        bubbleSort(nums: &nums)
        print("After bubble sort, nums = \(nums)")

        var nums1 = [4, 1, 3, 1, 5, 2]
        bubbleSortWithFlag(nums: &nums1)
        print("After bubble sort, nums1 = \(nums1)")
    }
}
