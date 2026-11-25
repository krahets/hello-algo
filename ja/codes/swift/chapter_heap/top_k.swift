/**
 * File: top_k.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

/* ヒープを使って配列の上位 k 個の要素を求める */
func topKHeap(nums: [Int], k: Int) -> [Int] {
    // 最小ヒープを初期化し、先頭 k 個の要素からヒープを構築する
    var heap = Heap(nums.prefix(k))
    // k+1 番目の要素からはヒープのサイズを k に保つ
    for i in nums.indices.dropFirst(k) {
        // 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
        if nums[i] > heap.min()! {
            _ = heap.removeMin()
            heap.insert(nums[i])
        }
    }
    return heap.unordered
}

@main
enum TopK {
    /* 実行例 */
    static func main() {
        let nums = [1, 7, 6, 3, 2]
        let k = 3

        let res = topKHeap(nums: nums, k: k)
        print("上位 \(k) 個の要素：")
        PrintUtil.printHeap(queue: res)
    }
}
