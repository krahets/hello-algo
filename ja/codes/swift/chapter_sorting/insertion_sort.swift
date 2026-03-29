/**
 * File: insertion_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 挿入ソート */
func insertionSort(nums: inout [Int]) {
    // 外側ループ：整列済み区間は [0, i-1]
    for i in nums.indices.dropFirst() {
        let base = nums[i]
        var j = i - 1
        // 内側ループ: base をソート済み区間 [0, i-1] の正しい位置に挿入する
        while j >= 0, nums[j] > base {
            nums[j + 1] = nums[j] // nums[j] を 1 つ右へ移動する
            j -= 1
        }
        nums[j + 1] = base // base を正しい位置に配置する
    }
}

@main
enum InsertionSort {
    /* Driver Code */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        insertionSort(nums: &nums)
        print("挿入ソート完了後 nums = \(nums)")
    }
}
