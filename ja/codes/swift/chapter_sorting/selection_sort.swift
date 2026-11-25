/**
 * File: selection_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 選択ソート */
func selectionSort(nums: inout [Int]) {
    // 外側のループ：未整列区間は [i, n-1]
    for i in nums.indices.dropLast() {
        // 内側のループ：未整列区間の最小要素を探す
        var k = i
        for j in nums.indices.dropFirst(i + 1) {
            if nums[j] < nums[k] {
                k = j // 最小要素のインデックスを記録
            }
        }
        // その最小要素と未整列区間の先頭要素を交換
        nums.swapAt(i, k)
    }
}

@main
enum SelectionSort {
    /* 実行例 */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        selectionSort(nums: &nums)
        print("選択ソート後の nums = \(nums)")
    }
}
