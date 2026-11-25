/**
 * File: binary_search_edge.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* 最も左にある target の二分探索 */
fun binarySearchLeftEdge(nums: IntArray, target: Int): Int {
    // target の挿入位置を探すことと同じ
    val i = binarySearchInsertion(nums, target)
    // target が見つからなかったので -1 を返す
    if (i == nums.size || nums[i] != target) {
        return -1
    }
    // target が見つかったのでインデックス i を返す
    return i
}

/* 最も右にある target の二分探索 */
fun binarySearchRightEdge(nums: IntArray, target: Int): Int {
    // 最も左にある target + 1 の探索に置き換える
    val i = binarySearchInsertion(nums, target + 1)
    // j は最も右の target を、i は target より大きい最初の要素を指す
    val j = i - 1
    // target が見つからなかったので -1 を返す
    if (j == -1 || nums[j] != target) {
        return -1
    }
    // target が見つかったのでインデックス j を返す
    return j
}

/* 実行例 */
fun main() {
    // 重複する要素がある配列
    val nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\n配列 nums = ${nums.contentToString()}")

    // 左端と右端の二分探索
    for (target in intArrayOf(6, 7)) {
        var index = binarySearchLeftEdge(nums, target)
        println("最も左にある $target のインデックスは $index")
        index = binarySearchRightEdge(nums, target)
        println("最も右にある $target のインデックスは $index")
    }
}