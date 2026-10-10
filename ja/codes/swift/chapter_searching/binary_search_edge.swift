/**
 * File: binary_search_edge.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

import binary_search_insertion_target

/* 最も左の target を二分探索 */
func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
    // target の挿入位置を探すのと等価
    let i = binarySearchInsertion(nums: nums, target: target)
    // target が見つからなければ、-1 を返す
    if i == nums.endIndex || nums[i] != target {
        return -1
    }
    // target が見つかったら、インデックス i を返す
    return i
}

/* 最も右の target を二分探索 */
func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
    // 最左の target + 1 を探す問題に変換する
    let i = binarySearchInsertion(nums: nums, target: target + 1)
    // j は最も右の target を指し、i は target より大きい最初の要素を指す
    let j = i - 1
    // target が見つからなければ、-1 を返す
    if j == -1 || nums[j] != target {
        return -1
    }
    // target が見つかったら、インデックス j を返す
    return j
}

@main
enum BinarySearchEdge {
    /* Driver Code */
    static func main() {
        // 重複要素を含む配列
        let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\n配列 nums = \(nums)")

        // 二分探索で左端と右端を探す
        for target in [6, 7] {
            var index = binarySearchLeftEdge(nums: nums, target: target)
            print("最も左にある要素 \(target) のインデックスは \(index)")
            index = binarySearchRightEdge(nums: nums, target: target)
            print("最も右にある要素 \(target) のインデックスは \(index)")
        }
    }
}
