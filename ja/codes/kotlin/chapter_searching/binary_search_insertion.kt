/**
 * File: binary_search_insertion.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* 二分探索で挿入位置を探す（重複要素なし） */
fun binarySearchInsertionSimple(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // 両閉区間 [0, n-1] を初期化
    while (i <= j) {
        val m = i + (j - i) / 2 // 中点インデックス m を計算
        if (nums[m] < target) {
            i = m + 1 // target は区間 [m+1, j] にある
        } else if (nums[m] > target) {
            j = m - 1 // target は区間 [i, m-1] にある
        } else {
            return m // target が見つかったら、挿入位置 m を返す
        }
    }
    // target が見つからなければ、挿入位置 i を返す
    return i
}

/* 二分探索で挿入位置を探す（重複要素あり） */
fun binarySearchInsertion(nums: IntArray, target: Int): Int {
    var i = 0
    var j = nums.size - 1 // 両閉区間 [0, n-1] を初期化
    while (i <= j) {
        val m = i + (j - i) / 2 // 中点インデックス m を計算
        if (nums[m] < target) {
            i = m + 1 // target は区間 [m+1, j] にある
        } else if (nums[m] > target) {
            j = m - 1 // target は区間 [i, m-1] にある
        } else {
            j = m - 1 // target より小さい最初の要素は区間 [i, m-1] にある
        }
    }
    // 挿入位置 i を返す
    return i
}

/* Driver Code */
fun main() {
    // 重複要素のない配列
    var nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)
    println("\n配列 nums = ${nums.contentToString()}")
    // 二分探索で挿入位置を探す
    for (target in intArrayOf(6, 9)) {
        val index = binarySearchInsertionSimple(nums, target)
        println("要素 $target の挿入位置のインデックスは $index")
    }

    // 重複要素を含む配列
    nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\n配列 nums = ${nums.contentToString()}")

    // 二分探索で挿入位置を探す
    for (target in intArrayOf(2, 6, 20)) {
        val index = binarySearchInsertion(nums, target)
        println("要素 $target の挿入位置のインデックスは $index")
    }
}