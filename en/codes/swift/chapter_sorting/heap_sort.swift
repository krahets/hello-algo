/**
 * File: heap_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Heap length is n, start heapifying node i, from top to bottom */
func siftDown(nums: inout [Int], n: Int, i: Int) {
    var i = i
    while true {
        // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
        let l = 2 * i + 1
        let r = 2 * i + 2
        var ma = i
        if l < n, nums[l] > nums[ma] {
            ma = l
        }
        if r < n, nums[r] > nums[ma] {
            ma = r
        }
        // Swap two nodes
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
        // Delete node
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
        print("After heap sort, nums = \(nums)")
    }
}
