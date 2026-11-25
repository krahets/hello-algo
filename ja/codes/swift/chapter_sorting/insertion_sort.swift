/**
 * File: insertion_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 挿入ソート */
func insertionSort(nums: inout [Int]) {
    // 外側のループ：整列済み区間は [0, i-1]
    for i in nums.indices.dropFirst() {
        let base = nums[i]
        var j = i - 1
        // 内側のループ：整列済み区間 [0, i-1] の正しい位置に base を挿入
        while j >= 0, nums[j] > base {
            nums[j + 1] = nums[j] // nums[j] を 1 つ右に移動
            j -= 1
        }
        nums[j + 1] = base // 正しい位置に base を代入
    }
}

@main
enum InsertionSort {
    /* 実行例 */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        insertionSort(nums: &nums)
        print("挿入ソート後の nums = \(nums)")
    }
}
