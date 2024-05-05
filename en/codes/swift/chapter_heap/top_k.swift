/**
 * File: top_k.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

/* Using heap to find the largest k elements in an array */
func topKHeap(nums: [Int], k: Int) -> [Int] {
    // Initialize a min-heap and build the top k elements
    var heap = Heap(nums.prefix(k))
    // From the k+1th element, keep the heap length as k
    for i in nums.indices.dropFirst(k) {
        // If the current element is larger than the heap top element, remove the heap top element and enter the current element into the heap
        if nums[i] > heap.min()! {
            _ = heap.removeMin()
            heap.insert(nums[i])
        }
    }
    return heap.unordered
}

@main
enum TopK {
    /* Driver Code */
    static func main() {
        let nums = [1, 7, 6, 3, 2]
        let k = 3

        let res = topKHeap(nums: nums, k: k)
        print("The largest \(k) elements are")
        PrintUtil.printHeap(queue: res)
    }
}
