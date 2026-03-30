/**
 * File: merge_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 左部分配列と右部分配列をマージ */
func merge(nums: inout [Int], left: Int, mid: Int, right: Int) {
    // 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
    // マージ結果を格納する一時配列 tmp を作成
    var tmp = Array(repeating: 0, count: right - left + 1)
    // 左右の部分配列の開始インデックスを初期化する
    var i = left, j = mid + 1, k = 0
    // 左右の部分配列にまだ要素がある間は比較し、小さいほうを一時配列にコピーする
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
    // 左右の部分配列の残り要素を一時配列にコピーする
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
    // 一時配列 tmp の要素を元の配列 nums の対応区間にコピーする
    for k in tmp.indices {
        nums[left + k] = tmp[k]
    }
}

/* マージソート */
func mergeSort(nums: inout [Int], left: Int, right: Int) {
    // 終了条件
    if left >= right { // 部分配列の長さが 1 になったら再帰を終了
        return
    }
    // 分割フェーズ
    let mid = left + (right - left) / 2 // 中点を計算
    mergeSort(nums: &nums, left: left, right: mid) // 左部分配列を再帰処理
    mergeSort(nums: &nums, left: mid + 1, right: right) // 右部分配列を再帰処理
    // マージフェーズ
    merge(nums: &nums, left: left, mid: mid, right: right)
}

@main
enum MergeSort {
    /* Driver Code */
    static func main() {
        /* マージソート */
        var nums = [7, 3, 2, 6, 0, 1, 5, 4]
        mergeSort(nums: &nums, left: nums.startIndex, right: nums.endIndex - 1)
        print("マージソート完了後 nums = \(nums)")
    }
}
