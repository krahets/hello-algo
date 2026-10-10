/**
 * File: heap_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* ヒープの長さは n。ノード i から下方向にヒープ化 */
func siftDown(nums: inout [Int], n: Int, i: Int) {
    var i = i
    while true {
        // ノード i, l, r のうち値が最大のノードを ma とする
        let l = 2 * i + 1
        let r = 2 * i + 2
        var ma = i
        if l < n, nums[l] > nums[ma] {
            ma = l
        }
        if r < n, nums[r] > nums[ma] {
            ma = r
        }
        // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
        if ma == i {
            break
        }
        // 2 つのノードを交換
        nums.swapAt(i, ma)
        // ループで上から下へヒープ化
        i = ma
    }
}

/* ヒープソート */
func heapSort(nums: inout [Int]) {
    // ヒープ構築：葉ノード以外のすべてのノードをヒープ化する
    for i in stride(from: nums.count / 2 - 1, through: 0, by: -1) {
        siftDown(nums: &nums, n: nums.count, i: i)
    }
    // ヒープから最大要素を取り出し、n-1 回繰り返す
    for i in nums.indices.dropFirst().reversed() {
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        nums.swapAt(0, i)
        // 根ノードを起点に、上から下へヒープ化
        siftDown(nums: &nums, n: i, i: 0)
    }
}

@main
enum HeapSort {
    /* Driver Code */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        heapSort(nums: &nums)
        print("ヒープソート完了後 nums = \(nums)")
    }
}
