/**
 * File: top_k.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 基于堆查找数组中最大的 k 个元素 */
func topKHeap(nums: [Int], k: Int) -> [Int] {
    // 将数组的前 k 个元素入堆
    var heap = Array(nums.prefix(k))
    // 从第 k+1 个元素开始，保持堆的长度为 k
    for i in stride(from: k, to: nums.count, by: 1) {
        // 若当前元素大于堆顶元素，则将堆顶元素出堆、当前元素入堆
        if nums[i] > heap.first! {
            heap.removeFirst()
            heap.insert(nums[i], at: 0)
        }
    }
    return heap
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
