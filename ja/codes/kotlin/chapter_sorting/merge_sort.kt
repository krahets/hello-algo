/**
 * File: merge_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 左右の部分配列をマージ */
fun merge(nums: IntArray, left: Int, mid: Int, right: Int) {
    // 左の部分配列は [left, mid]、右の部分配列は [mid+1, right]
    // マージ結果を格納する一時配列 tmp を作成
    val tmp = IntArray(right - left + 1)
    // 左右の部分配列の開始インデックスを初期化
    var i = left
    var j = mid + 1
    var k = 0
    // 両方の部分配列に要素が残っている間、値を比較し、小さいほうを一時配列にコピー
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j])
            tmp[k++] = nums[i++]
        else
            tmp[k++] = nums[j++]
    }
    // 左右の部分配列に残った要素を一時配列にコピー
    while (i <= mid) {
        tmp[k++] = nums[i++]
    }
    while (j <= right) {
        tmp[k++] = nums[j++]
    }
    // 一時配列 tmp の要素を元の配列 nums の対応区間に書き戻す
    for (l in tmp.indices) {
        nums[left + l] = tmp[l]
    }
}

/* マージソート */
fun mergeSort(nums: IntArray, left: Int, right: Int) {
    // 終了条件
    if (left >= right) return  // 部分配列の長さが 1 になったら再帰を終了
    // 分割段階
    val mid = left + (right - left) / 2 // 中央のインデックスを求める
    mergeSort(nums, left, mid) // 左の部分配列を再帰的に処理
    mergeSort(nums, mid + 1, right) // 右の部分配列を再帰的に処理
    // マージ段階
    merge(nums, left, mid, right)
}

/* 実行例 */
fun main() {
    /* マージソート */
    val nums = intArrayOf(7, 3, 2, 6, 0, 1, 5, 4)
    mergeSort(nums, 0, nums.size - 1)
    println("マージソート後の nums = ${nums.contentToString()}")
}
