/**
 * File: selection_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Selection sort */
func selectionSort(nums: inout [Int]) {
    // Outer loop: unsorted interval is [i, n-1]
    for i in nums.indices.dropLast() {
        // Inner loop: find the smallest element within the unsorted interval
        var k = i
        for j in nums.indices.dropFirst(i + 1) {
            if nums[j] < nums[k] {
                k = j // Record the index of the smallest element
            }
        }
        // Swap the smallest element with the first element of the unsorted interval
        nums.swapAt(i, k)
    }
}

@main
enum SelectionSort {
    /* Driver Code */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        selectionSort(nums: &nums)
        print("After selection sort, nums = \(nums)")
    }
}
