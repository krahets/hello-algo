/**
 * File: heap_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 長さ n のヒープで、ノード i から下向きにヒープ化 */
func siftDown(nums: inout [Int], n: Int, i: Int) {
    var i = i
    while true {
        // ノード i, l, r のうち値が最大のものを ma とする
        let l = 2 * i + 1
        let r = 2 * i + 2
        var ma = i
        if l < n, nums[l] > nums[ma] {
            ma = l
        }
        if r < n, nums[r] > nums[ma] {
            ma = r
        }
        // i の値が最大か、左右の子のインデックス l, r がともに範囲外なら、ヒープ化を終了
        if ma == i {
            break
        }
        // 2 つのノードを交換
        nums.swapAt(i, ma)
        // 下向きのヒープ化を繰り返す
        i = ma
    }
}

/* ヒープソート */
func heapSort(nums: inout [Int]) {
    // ヒープの構築：葉以外のすべてのノードをヒープ化
    for i in stride(from: nums.count / 2 - 1, through: 0, by: -1) {
        siftDown(nums: &nums, n: nums.count, i: i)
    }
    // ヒープから最大要素を取り出す操作を n-1 回繰り返す
    for i in nums.indices.dropFirst().reversed() {
        // 根と右端の葉を交換（先頭要素と末尾要素の交換）
        nums.swapAt(0, i)
        // 根から下向きにヒープ化
        siftDown(nums: &nums, n: i, i: 0)
    }
}

@main
enum HeapSort {
    /* 実行例 */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        heapSort(nums: &nums)
        print("ヒープソート後の nums = \(nums)")
    }
}
