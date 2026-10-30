/**
 * File: insertion_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Insertion sort */
func insertionSort(nums: inout [Int]) {
    // Outer loop: the sorted range is [0, i-1]
    for i in nums.indices.dropFirst() {
        let base = nums[i]
        var j = i - 1
        // Inner loop: insert base at the correct position in the sorted range [0, i-1]
        while j >= 0, nums[j] > base {
            nums[j + 1] = nums[j] // Shift nums[j] one position to the right
            j -= 1
        }
        nums[j + 1] = base // Place base at the correct position
    }
}

@main
enum InsertionSort {
    /* Driver code */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        insertionSort(nums: &nums)
        print("After insertion sort, nums = \(nums)")
    }
}
