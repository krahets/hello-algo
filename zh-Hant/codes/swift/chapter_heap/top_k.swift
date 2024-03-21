/**
 * File: top_k.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

/* 基於堆積查詢陣列中最大的 k 個元素 */
func topKHeap(nums: [Int], k: Int) -> [Int] {
    // 初始化一個小頂堆積，並將前 k 個元素建堆積
    var heap = Heap(nums.prefix(k))
    // 從第 k+1 個元素開始，保持堆積的長度為 k
    for i in nums.indices.dropFirst(k) {
        // 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
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
        print("最大的 \(k) 個元素為")
        PrintUtil.printHeap(queue: res)
    }
}
