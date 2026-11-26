/**
 * File: bubble_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* バブルソート */
func bubbleSort(nums: inout [Int]) {
    // 外側のループ：未整列区間は [0, i]
    for i in nums.indices.dropFirst().reversed() {
        // 内側のループ：交換を繰り返し、未整列区間 [0, i] の最大要素を右端に移す
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // nums[j] と nums[j + 1] を交換
                nums.swapAt(j, j + 1)
            }
        }
    }
}

/* バブルソート（フラグによる最適化）*/
func bubbleSortWithFlag(nums: inout [Int]) {
    // 外側のループ：未整列区間は [0, i]
    for i in nums.indices.dropFirst().reversed() {
        var flag = false // フラグを初期化
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // nums[j] と nums[j + 1] を交換
                nums.swapAt(j, j + 1)
                flag = true // 交換があったことを記録
            }
        }
        if !flag { // この走査で交換がなければループを終了
            break
        }
    }
}

@main
enum BubbleSort {
    /* 実行例 */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        bubbleSort(nums: &nums)
        print("バブルソート後の nums = \(nums)")

        var nums1 = [4, 1, 3, 1, 5, 2]
        bubbleSortWithFlag(nums: &nums1)
        print("バブルソート後の nums1 = \(nums1)")
    }
}
