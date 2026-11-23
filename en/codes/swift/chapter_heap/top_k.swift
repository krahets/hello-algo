/**
 * File: top_k.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

/* Use a heap to find the k largest elements in an array */
func topKHeap(nums: [Int], k: Int) -> [Int] {
    // Build a heap from the first k elements and use it as a min heap
    var heap = Heap(nums.prefix(k))
    // Starting with element k+1, keep the heap size at k
    for i in nums.indices.dropFirst(k) {
        // If the current element exceeds the heap minimum, remove the minimum and insert the current element
        if nums[i] > heap.min()! {
            _ = heap.removeMin()
            heap.insert(nums[i])
        }
    }
    return heap.unordered
}

@main
enum TopK {
    /* Driver code */
    static func main() {
        let nums = [1, 7, 6, 3, 2]
        let k = 3

        let res = topKHeap(nums: nums, k: k)
        print("The \(k) largest elements are:")
        PrintUtil.printHeap(queue: res)
    }
}
