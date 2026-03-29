/**
 * File: binary_search_insertion.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 二分探索で挿入位置を探す（重複要素なし） */
func binarySearchInsertionSimple(nums: [Int], target: Int) -> Int {
    // 両閉区間 [0, n-1] を初期化
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // 中点インデックス m を計算
        if nums[m] < target {
            i = m + 1 // target は区間 [m+1, j] にある
        } else if nums[m] > target {
            j = m - 1 // target は区間 [i, m-1] にある
        } else {
            return m // target が見つかったら、挿入位置 m を返す
        }
    }
    // target が見つからなければ、挿入位置 i を返す
    return i
}

/* 二分探索で挿入位置を探す（重複要素あり） */
public func binarySearchInsertion(nums: [Int], target: Int) -> Int {
    // 両閉区間 [0, n-1] を初期化
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // 中点インデックス m を計算
        if nums[m] < target {
            i = m + 1 // target は区間 [m+1, j] にある
        } else if nums[m] > target {
            j = m - 1 // target は区間 [i, m-1] にある
        } else {
            j = m - 1 // target より小さい最初の要素は区間 [i, m-1] にある
        }
    }
    // 挿入位置 i を返す
    return i
}

#if !TARGET

@main
enum BinarySearchInsertion {
    /* Driver Code */
    static func main() {
        // 重複要素のない配列
        var nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
        print("\n配列 nums = \(nums)")
        // 二分探索で挿入位置を探す
        for target in [6, 9] {
            let index = binarySearchInsertionSimple(nums: nums, target: target)
            print("要素 \(target) の挿入位置のインデックスは \(index)")
        }

        // 重複要素を含む配列
        nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\n配列 nums = \(nums)")
        // 二分探索で挿入位置を探す
        for target in [2, 6, 20] {
            let index = binarySearchInsertion(nums: nums, target: target)
            print("要素 \(target) の挿入位置のインデックスは \(index)")
        }
    }
}

#endif
