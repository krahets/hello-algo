/**
 * File: binary_search_edge.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

import binary_search_insertion_target

/* 最も左にある target の二分探索 */
func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
    // target の挿入位置を探すことと同じ
    let i = binarySearchInsertion(nums: nums, target: target)
    // target が見つからなかったので -1 を返す
    if i == nums.endIndex || nums[i] != target {
        return -1
    }
    // target が見つかったのでインデックス i を返す
    return i
}

/* 最も右にある target の二分探索 */
func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
    // 最も左にある target + 1 の探索に置き換える
    let i = binarySearchInsertion(nums: nums, target: target + 1)
    // j は最も右の target を、i は target より大きい最初の要素を指す
    let j = i - 1
    // target が見つからなかったので -1 を返す
    if j == -1 || nums[j] != target {
        return -1
    }
    // target が見つかったのでインデックス j を返す
    return j
}

@main
enum BinarySearchEdge {
    /* 実行例 */
    static func main() {
        // 重複する要素がある配列
        let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\n配列 nums = \(nums)")

        // 左端と右端の二分探索
        for target in [6, 7] {
            var index = binarySearchLeftEdge(nums: nums, target: target)
            print("最も左にある \(target) のインデックスは \(index)")
            index = binarySearchRightEdge(nums: nums, target: target)
            print("最も右にある \(target) のインデックスは \(index)")
        }
    }
}
