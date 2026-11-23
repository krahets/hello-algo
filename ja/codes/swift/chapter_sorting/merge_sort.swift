/**
 * File: merge_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 左部分配列と右部分配列をマージする */
func merge(nums: inout [Int], left: Int, mid: Int, right: Int) {
    // 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
    // マージ後の結果を格納する一時配列 tmp を作成する
    var tmp = Array(repeating: 0, count: right - left + 1)
    // 左部分配列と右部分配列の開始インデックスを初期化する
    var i = left, j = mid + 1, k = 0
    // 左右両方の部分配列に要素が残っている間、比較して小さいほうの要素を一時配列にコピーする
    while i <= mid, j <= right {
        if nums[i] <= nums[j] {
            tmp[k] = nums[i]
            i += 1
        } else {
            tmp[k] = nums[j]
            j += 1
        }
        k += 1
    }
    // 左部分配列と右部分配列の残りの要素を一時配列にコピーする
    while i <= mid {
        tmp[k] = nums[i]
        i += 1
        k += 1
    }
    while j <= right {
        tmp[k] = nums[j]
        j += 1
        k += 1
    }
    // 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーし戻す
    for k in tmp.indices {
        nums[left + k] = tmp[k]
    }
}

/* マージソート */
func mergeSort(nums: inout [Int], left: Int, right: Int) {
    // 終了条件
    if left >= right { // 部分配列の長さが 1 になったら再帰を終了する
        return
    }
    // 分割段階
    let mid = left + (right - left) / 2 // 中央を計算する
    mergeSort(nums: &nums, left: left, right: mid) // 左部分配列を再帰的に処理する
    mergeSort(nums: &nums, left: mid + 1, right: right) // 右部分配列を再帰的に処理する
    // マージ段階
    merge(nums: &nums, left: left, mid: mid, right: right)
}

@main
enum MergeSort {
    /* 実行用コード */
    static func main() {
        /* マージソート */
        var nums = [7, 3, 2, 6, 0, 1, 5, 4]
        mergeSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("マージソート完了後 nums = \(nums)")
    }
}
