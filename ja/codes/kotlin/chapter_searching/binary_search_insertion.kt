/**
 * File: binary_search_insertion.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* 挿入位置の二分探索（重複する要素がない場合） */
fun binarySearchInsertionSimple(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // 閉区間 [0, n-1] で初期化する
    while (i <= j) {
        val m = i + (j - i) / 2 // 中央のインデックス m を求める
        if (nums[m] < target) {
            i = m + 1 // target の探索範囲は [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1 // target の探索範囲は [i, m-1]
        } else {
            return m // target が見つかったので挿入位置 m を返す
        }
    }
    // target が見つからなかったので挿入位置 i を返す
    return i
}

/* 挿入位置の二分探索（重複する要素がある場合） */
fun binarySearchInsertion(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // 閉区間 [0, n-1] で初期化する
    while (i <= j) {
        val m = i + (j - i) / 2 // 中央のインデックス m を求める
        if (nums[m] < target) {
            i = m + 1 // target の探索範囲は [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1 // target の探索範囲は [i, m-1]
        } else {
            j = m - 1 // target 未満の最も右の要素を [i, m-1] で探す
        }
    }
    // 挿入位置 i を返す
    return i
}

/* 実行例 */
fun main() {
    // 重複する要素がない配列
    var nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)
    println("\n配列 nums = ${nums.contentToString()}")
    // 挿入位置の二分探索
    for (target in intArrayOf(6, 9)) {
        val index = binarySearchInsertionSimple(nums, target)
        println("要素 $target の挿入位置のインデックスは $index")
    }

    // 重複する要素がある配列
    nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\n配列 nums = ${nums.contentToString()}")

    // 挿入位置の二分探索
    for (target in intArrayOf(2, 6, 20)) {
        val index = binarySearchInsertion(nums, target)
        println("要素 $target の挿入位置のインデックスは $index")
    }
}
