/**
 * File: insertion_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 挿入ソート */
func insertionSort(nums: inout [Int]) {
    // 外側のループ：ソート済み区間は [0, i-1]
    for i in nums.indices.dropFirst() {
        let base = nums[i]
        var j = i - 1
        // 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
        while j >= 0, nums[j] > base {
            nums[j + 1] = nums[j] // nums[j] を右に 1 つずらす
            j -= 1
        }
        nums[j + 1] = base // 正しい位置に base を代入する
    }
}

@main
enum InsertionSort {
    /* 実行用コード */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        insertionSort(nums: &nums)
        print("挿入ソート完了後 nums = \(nums)")
    }
}
