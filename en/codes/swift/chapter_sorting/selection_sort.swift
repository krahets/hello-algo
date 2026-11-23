/**
 * File: selection_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Selection sort */
func selectionSort(nums: inout [Int]) {
    // Outer loop: the unsorted range is [i, n-1]
    for i in nums.indices.dropLast() {
        // Inner loop: find the smallest element in the unsorted range
        var k = i
        for j in nums.indices.dropFirst(i + 1) {
            if nums[j] < nums[k] {
                k = j // Record the index of the smallest element
            }
        }
        // Swap the smallest element with the first element of the unsorted range
        nums.swapAt(i, k)
    }
}

@main
enum SelectionSort {
    /* Driver code */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        selectionSort(nums: &nums)
        print("After selection sort, nums = \(nums)")
    }
}
