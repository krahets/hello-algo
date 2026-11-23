/**
 * File: binary_search_recur.swift
 * Created Time: 2023-09-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 二分探索：問題 f(i, j) */
func dfs(nums: [Int], target: Int, i: Int, j: Int) -> Int {
    // 区間が空なら目的の要素が存在しないため、-1 を返す
    if i > j {
        return -1
    }
    // 中央のインデックス m を計算する
    let m = (i + j) / 2
    if nums[m] < target {
        // 部分問題 f(m+1, j) を再帰的に解く
        return dfs(nums: nums, target: target, i: m + 1, j: j)
    } else if nums[m] > target {
        // 部分問題 f(i, m-1) を再帰的に解く
        return dfs(nums: nums, target: target, i: i, j: m - 1)
    } else {
        // 目的の要素が見つかったので、そのインデックスを返す
        return m
    }
}

/* 二分探索 */
func binarySearch(nums: [Int], target: Int) -> Int {
    // 問題 f(0, n-1) を解く
    dfs(nums: nums, target: target, i: nums.startIndex, j: nums.endIndex - 1)
}

@main
enum BinarySearchRecur {
    /* 実行用コード */
    static func main() {
        let target = 6
        let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

        // 二分探索（閉区間）
        let index = binarySearch(nums: nums, target: target)
        print("目的の要素 6 のインデックス = \(index)")
    }
}
