/**
 * File: heap_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 長さ n のヒープを、ノード i から下向きにヒープ化する */
func siftDown(nums: inout [Int], n: Int, i: Int) {
    var i = i
    while true {
        // ノード i, l, r のうち値が最大のノードを求め、ma とする
        let l = 2 * i + 1
        let r = 2 * i + 2
        var ma = i
        if l < n, nums[l] > nums[ma] {
            ma = l
        }
        if r < n, nums[r] > nums[ma] {
            ma = r
        }
        // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
        if ma == i {
            break
        }
        // 2 つのノードを交換する
        nums.swapAt(i, ma)
        // 下向きのヒープ化を繰り返す
        i = ma
    }
}

/* ヒープソート */
func heapSort(nums: inout [Int]) {
    // ヒープの構築：葉ノード以外の全ノードをヒープ化する
    for i in stride(from: nums.count / 2 - 1, through: 0, by: -1) {
        siftDown(nums: &nums, n: nums.count, i: i)
    }
    // ヒープから最大要素を取り出す処理を n-1 回繰り返す
    for i in nums.indices.dropFirst().reversed() {
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        nums.swapAt(0, i)
        // 根ノードから下向きにヒープ化する
        siftDown(nums: &nums, n: i, i: 0)
    }
}

@main
enum HeapSort {
    /* 実行用コード */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        heapSort(nums: &nums)
        print("ヒープソート完了後 nums = \(nums)")
    }
}
