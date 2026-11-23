/**
 * File: binary_search_edge.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

import binary_search_insertion_target

/* 二分探索で最も左にある target を探す */
func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
    // target の挿入位置を探すことに等しい
    let i = binarySearchInsertion(nums: nums, target: target)
    // target が見つからなかったので、-1 を返す
    if i == nums.endIndex || nums[i] != target {
        return -1
    }
    // target が見つかったので、インデックス i を返す
    return i
}

/* 二分探索で最も右にある target を探す */
func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
    // 最も左にある target + 1 を探す問題に変換する
    let i = binarySearchInsertion(nums: nums, target: target + 1)
    // j は最も右にある target を指し、i は target より大きい最初の要素を指す
    let j = i - 1
    // target が見つからなかったので、-1 を返す
    if j == -1 || nums[j] != target {
        return -1
    }
    // target が見つかったので、インデックス j を返す
    return j
}

@main
enum BinarySearchEdge {
    /* 実行用コード */
    static func main() {
        // 重複要素を含む配列
        let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\n配列 nums = \(nums)")

        // 二分探索で左境界と右境界を求める
        for target in [6, 7] {
            var index = binarySearchLeftEdge(nums: nums, target: target)
            print("最も左にある要素 \(target) のインデックスは \(index)")
            index = binarySearchRightEdge(nums: nums, target: target)
            print("最も右にある要素 \(target) のインデックスは \(index)")
        }
    }
}
