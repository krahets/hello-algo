/**
 * File: binary_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 二分探索（閉区間） */
func binarySearch(nums: [Int], target: Int) -> Int {
    // 閉区間 [0, n-1] で初期化し、i は配列の先頭、j は末尾の要素を指す
    var i = nums.startIndex
    var j = nums.endIndex - 1
    // 探索区間が空になるまで繰り返す（i > j のとき空）
    while i <= j {
        let m = i + (j - i) / 2 // 中央のインデックス m を求める
        if nums[m] < target { // この場合、target の探索範囲は [m+1, j]
            i = m + 1
        } else if nums[m] > target { // この場合、target の探索範囲は [i, m-1]
            j = m - 1
        } else { // 目標の要素が見つかったので、そのインデックスを返す
            return m
        }
    }
    // 目標の要素が見つからなかったので -1 を返す
    return -1
}

/* 二分探索（左閉右開区間） */
func binarySearchLCRO(nums: [Int], target: Int) -> Int {
    // 左閉右開区間 [0, n) で初期化し、i は配列の先頭、j は末尾の一つ先を指す
    var i = nums.startIndex
    var j = nums.endIndex
    // 探索区間が空になるまで繰り返す（i = j のとき空）
    while i < j {
        let m = i + (j - i) / 2 // 中央のインデックス m を求める
        if nums[m] < target { // この場合、target の探索範囲は [m+1, j)
            i = m + 1
        } else if nums[m] > target { // この場合、target の探索範囲は [i, m)
            j = m
        } else { // 目標の要素が見つかったので、そのインデックスを返す
            return m
        }
    }
    // 目標の要素が見つからなかったので -1 を返す
    return -1
}

@main
enum BinarySearch {
    /* 実行例 */
    static func main() {
        let target = 6
        let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

        /* 二分探索（閉区間） */
        var index = binarySearch(nums: nums, target: target)
        print("目標値 6 のインデックス = \(index)")

        /* 二分探索（左閉右開区間） */
        index = binarySearchLCRO(nums: nums, target: target)
        print("目標値 6 のインデックス = \(index)")
    }
}
