/**
 * File: heap_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Sift down from node i in a heap of size n */
func siftDown(nums: inout [Int], n: Int, i: Int) {
    var i = i
    while true {
        // Let ma be the index of the largest of nodes i, l, and r
        let l = 2 * i + 1
        let r = 2 * i + 2
        var ma = i
        if l < n, nums[l] > nums[ma] {
            ma = l
        }
        if r < n, nums[r] > nums[ma] {
            ma = r
        }
        // Stop if i is the largest or both child indices l and r are out of bounds
        if ma == i {
            break
        }
        // Swap the two nodes
        nums.swapAt(i, ma)
        // Continue sifting down
        i = ma
    }
}

/* Heap sort */
func heapSort(nums: inout [Int]) {
    // Build the heap by sifting down from each non-leaf node
    for i in stride(from: nums.count / 2 - 1, through: 0, by: -1) {
        siftDown(nums: &nums, n: nums.count, i: i)
    }
    // Extract the maximum from the heap in each of n-1 rounds
    for i in nums.indices.dropFirst().reversed() {
        // Swap the root and rightmost leaf (the first and last elements)
        nums.swapAt(0, i)
        // Sift down from the root
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
