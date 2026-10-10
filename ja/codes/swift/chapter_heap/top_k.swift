/**
 * File: top_k.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

/* ヒープに基づいて配列中の最大の k 個の要素を探す */
func topKHeap(nums: [Int], k: Int) -> [Int] {
    // 最小ヒープを初期化し、先頭 k 個の要素でヒープを構築する
    var heap = Heap(nums.prefix(k))
    // k+1 番目の要素から開始し、ヒープ長を k に保つ
    for i in nums.indices.dropFirst(k) {
        // 現在の要素がヒープ先頭より大きければ、ヒープ先頭を取り出して現在の要素を追加する
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
        print("最大の \(k) 個の要素は")
        PrintUtil.printHeap(queue: res)
    }
}
