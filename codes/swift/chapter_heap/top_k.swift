/**
 * File: top_k.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

/* 基于堆查找数组中最大的 k 个元素 */
func topKHeap(nums: [Int], k: Int) -> [Int] {
    // 初始化一个小顶堆，并将前 k 个元素建堆
    var heap = Heap(nums.prefix(k))
    // 从第 k+1 个元素开始，保持堆的长度为 k
    for i in nums.indices.dropFirst(k) {
        // 若当前元素大于堆顶元素，则将堆顶元素出堆、当前元素入堆
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
        print("最大的 \(k) 个元素为")
        PrintUtil.printHeap(queue: res)
    }
}
