/**
 * File: binary_search_insertion.swift
 * Created Time: 2023-08-06
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 二分探索による挿入位置の探索（重複要素がない場合） */
func binarySearchInsertionSimple(nums: [Int], target: Int) -> Int {
    // 閉区間 [0, n-1] を初期化する
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // 中央のインデックス m を計算する
        if nums[m] < target {
            i = m + 1 // target は区間 [m+1, j] に存在する
        } else if nums[m] > target {
            j = m - 1 // target は区間 [i, m-1] に存在する
        } else {
            return m // target が見つかったので、挿入位置 m を返す
        }
    }
    // target が見つからなかったので、挿入位置 i を返す
    return i
}

/* 二分探索による挿入位置の探索（重複要素がある場合） */
public func binarySearchInsertion(nums: [Int], target: Int) -> Int {
    // 閉区間 [0, n-1] を初期化する
    var i = nums.startIndex
    var j = nums.endIndex - 1
    while i <= j {
        let m = i + (j - i) / 2 // 中央のインデックス m を計算する
        if nums[m] < target {
            i = m + 1 // target は区間 [m+1, j] に存在する
        } else if nums[m] > target {
            j = m - 1 // target は区間 [i, m-1] に存在する
        } else {
            j = m - 1 // target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
        }
    }
    // 挿入位置 i を返す
    return i
}

#if !TARGET

@main
enum BinarySearchInsertion {
    /* 実行用コード */
    static func main() {
        // 重複要素のない配列
        var nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
        print("\n配列 nums = \(nums)")
        // 二分探索による挿入位置の探索
        for target in [6, 9] {
            let index = binarySearchInsertionSimple(nums: nums, target: target)
            print("要素 \(target) の挿入位置のインデックスは \(index)")
        }

        // 重複要素を含む配列
        nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
        print("\n配列 nums = \(nums)")
        // 二分探索による挿入位置の探索
        for target in [2, 6, 20] {
            let index = binarySearchInsertion(nums: nums, target: target)
            print("要素 \(target) の挿入位置のインデックスは \(index)")
        }
    }
}

#endif
