/**
 * File: top_k.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

/* Find the largest k elements in array based on heap */
func topKHeap(nums: [Int], k: Int) -> [Int] {
    // Initialize min heap and build heap with first k elements
    var heap = Heap(nums.prefix(k))
    // Starting from the (k+1)th element, maintain heap length as k
    for i in nums.indices.dropFirst(k) {
        // If current element is greater than top element, top element exits heap, current element enters heap
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
