/**
 * File: binary_search_insertion.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 挿入位置の二分探索（重複する要素がない場合） */
func binarySearchInsertionSimple(nums: [Int], target: Int) -> Int {
    // 閉区間 [0, n-1] で初期化する
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // 中央のインデックス m を求める
        if nums[m] < target {
            i = m + 1 // target の探索範囲は [m+1, j]
        } else if nums[m] > target {
            j = m - 1 // target の探索範囲は [i, m-1]
        } else {
            return m // target が見つかったので挿入位置 m を返す
        }
    }
    // target が見つからなかったので挿入位置 i を返す
    return i
}

/* 挿入位置の二分探索（重複する要素がある場合） */
public func binarySearchInsertion(nums: [Int], target: Int) -> Int {
    // 閉区間 [0, n-1] で初期化する
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // 中央のインデックス m を求める
        if nums[m] < target {
            i = m + 1 // target の探索範囲は [m+1, j]
        } else if nums[m] > target {
            j = m - 1 // target の探索範囲は [i, m-1]
        } else {
            j = m - 1 // target 未満の最も右の要素を [i, m-1] で探す
        }
    }
    // 挿入位置 i を返す
    return i
}

#if !TARGET

@main
enum BinarySearchInsertion {
    /* 実行例 */
    static func main() {
        // 重複する要素がない配列
        var nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
        print("\n配列 nums = \(nums)")
        // 挿入位置の二分探索
        for target in [6, 9] {
            let index = binarySearchInsertionSimple(nums: nums, target: target)
            print("要素 \(target) の挿入位置のインデックスは \(index)")
        }

        // 重複する要素がある配列
        nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\n配列 nums = \(nums)")
        // 挿入位置の二分探索
        for target in [2, 6, 20] {
            let index = binarySearchInsertion(nums: nums, target: target)
            print("要素 \(target) の挿入位置のインデックスは \(index)")
        }
    }
}

#endif
