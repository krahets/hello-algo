/**
 * File: merge_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 左部分配列と右部分配列をマージ */
fun merge(nums: IntArray, left: Int, mid: Int, right: Int) {
    // 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
    // マージ結果を格納する一時配列 tmp を作成
    val tmp = IntArray(right - left + 1)
    // 左右の部分配列の開始インデックスを初期化する
    var i = left
    var j = mid + 1
    var k = 0
    // 左右の部分配列にまだ要素がある間は比較し、小さいほうを一時配列にコピーする
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j])
            tmp[k++] = nums[i++]
        else
            tmp[k++] = nums[j++]
    }
    // 左右の部分配列の残り要素を一時配列にコピーする
    while (i <= mid) {
        tmp[k++] = nums[i++]
    }
    while (j <= right) {
        tmp[k++] = nums[j++]
    }
    // 一時配列 tmp の要素を元の配列 nums の対応区間にコピーする
    for (l in tmp.indices) {
        nums[left + l] = tmp[l]
    }
}

/* マージソート */
fun mergeSort(nums: IntArray, left: Int, right: Int) {
    // 終了条件
    if (left >= right) return  // 部分配列の長さが 1 になったら再帰を終了
    // 分割フェーズ
    val mid = left + (right - left) / 2 // 中点を計算
    mergeSort(nums, left, mid) // 左部分配列を再帰処理
    mergeSort(nums, mid + 1, right) // 右部分配列を再帰処理
    // マージフェーズ
    merge(nums, left, mid, right)
}

/* Driver Code */
fun main() {
    /* マージソート */
    val nums = intArrayOf(7, 3, 2, 6, 0, 1, 5, 4)
    mergeSort(nums, 0, nums.size - 1)
    println("マージソート完了後 nums = ${nums.contentToString()}")
}
