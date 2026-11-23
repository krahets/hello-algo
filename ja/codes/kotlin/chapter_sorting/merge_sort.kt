/**
 * File: merge_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 左部分配列と右部分配列をマージする */
fun merge(nums: IntArray, left: Int, mid: Int, right: Int) {
    // 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
    // マージ後の結果を格納する一時配列 tmp を作成する
    val tmp = IntArray(right - left + 1)
    // 左部分配列と右部分配列の開始インデックスを初期化する
    var i = left
    var j = mid + 1
    var k = 0
    // 左右両方の部分配列に要素が残っている間、比較して小さいほうの要素を一時配列にコピーする
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j])
            tmp[k++] = nums[i++]
        else
            tmp[k++] = nums[j++]
    }
    // 左部分配列と右部分配列の残りの要素を一時配列にコピーする
    while (i <= mid) {
        tmp[k++] = nums[i++]
    }
    while (j <= right) {
        tmp[k++] = nums[j++]
    }
    // 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーし戻す
    for (l in tmp.indices) {
        nums[left + l] = tmp[l]
    }
}

/* マージソート */
fun mergeSort(nums: IntArray, left: Int, right: Int) {
    // 終了条件
    if (left >= right) return  // 部分配列の長さが 1 になったら再帰を終了する
    // 分割段階
    val mid = left + (right - left) / 2 // 中央を計算する
    mergeSort(nums, left, mid) // 左部分配列を再帰的に処理する
    mergeSort(nums, mid + 1, right) // 右部分配列を再帰的に処理する
    // マージ段階
    merge(nums, left, mid, right)
}

/* 実行用コード */
fun main() {
    /* マージソート */
    val nums = intArrayOf(7, 3, 2, 6, 0, 1, 5, 4)
    mergeSort(nums, 0, nums.size - 1)
    println("マージソート完了後 nums = ${nums.contentToString()}")
}
