/**
 * File: selection_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 選択ソート */
func selectionSort(nums: inout [Int]) {
    // 外側ループ：未整列区間は [i, n-1]
    for i in nums.indices.dropLast() {
        // 内側のループ：未ソート区間の最小要素を見つける
        var k = i
        for j in nums.indices.dropFirst(i + 1) {
            if nums[j] < nums[k] {
                k = j // 最小要素のインデックスを記録
            }
        }
        // その最小要素を未整列区間の先頭要素と交換する
        nums.swapAt(i, k)
    }
}

@main
enum SelectionSort {
    /* Driver Code */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        selectionSort(nums: &nums)
        print("選択ソート完了後 nums = \(nums)")
    }
}
