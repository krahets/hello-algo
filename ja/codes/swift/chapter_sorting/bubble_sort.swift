/**
 * File: bubble_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* バブルソート */
func bubbleSort(nums: inout [Int]) {
    // 外側のループ：未ソート区間は [0, i]
    for i in nums.indices.dropFirst().reversed() {
        // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // nums[j] と nums[j + 1] を交換する
                nums.swapAt(j, j + 1)
            }
        }
    }
}

/* バブルソート（フラグによる最適化）*/
func bubbleSortWithFlag(nums: inout [Int]) {
    // 外側のループ：未ソート区間は [0, i]
    for i in nums.indices.dropFirst().reversed() {
        var flag = false // フラグを初期化する
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // nums[j] と nums[j + 1] を交換する
                nums.swapAt(j, j + 1)
                flag = true // 要素を交換したことを記録する
            }
        }
        if !flag { // 今回の「バブル」で要素を一度も交換しなかった場合、直ちに終了する
            break
        }
    }
}

@main
enum BubbleSort {
    /* 実行用コード */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        bubbleSort(nums: &nums)
        print("バブルソート完了後 nums = \(nums)")

        var nums1 = [4, 1, 3, 1, 5, 2]
        bubbleSortWithFlag(nums: &nums1)
        print("バブルソート完了後 nums1 = \(nums1)")
    }
}
