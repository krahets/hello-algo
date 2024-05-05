/**
 * File: heap_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Heap length is n, start heapifying node i, from top to bottom */
func siftDown(nums: inout [Int], n: Int, i: Int) {
    var i = i
    while true {
        // Determine the largest node among i, l, r, noted as ma
        let l = 2 * i + 1
        let r = 2 * i + 2
        var ma = i
        if l < n, nums[l] > nums[ma] {
            ma = l
        }
        if r < n, nums[r] > nums[ma] {
            ma = r
        }
        // If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
        if ma == i {
            break
        }
        // Swap two nodes
        nums.swapAt(i, ma)
        // Loop downwards heapification
        i = ma
    }
}

/* Heap sort */
func heapSort(nums: inout [Int]) {
    // Build heap operation: heapify all nodes except leaves
    for i in stride(from: nums.count / 2 - 1, through: 0, by: -1) {
        siftDown(nums: &nums, n: nums.count, i: i)
    }
    // Extract the largest element from the heap and repeat for n-1 rounds
    for i in nums.indices.dropFirst().reversed() {
        // Swap the root node with the rightmost leaf node (swap the first element with the last element)
        nums.swapAt(0, i)
        // Start heapifying the root node, from top to bottom
        siftDown(nums: &nums, n: i, i: 0)
    }
}

@main
enum HeapSort {
    /* Driver Code */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        heapSort(nums: &nums)
        print("Heap sort completed, nums = \(nums)")
    }
}
