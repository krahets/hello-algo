/**
 * File: binary_search_edge.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* 最も左の target を二分探索 */
fun binarySearchLeftEdge(nums: IntArray, target: Int): Int {
    // target の挿入位置を探すのと等価
    val i = binarySearchInsertion(nums, target)
    // target が見つからなければ、-1 を返す
    if (i == nums.size || nums[i] != target) {
        return -1
    }
    // target が見つかったら、インデックス i を返す
    return i
}

/* 最も右の target を二分探索 */
fun binarySearchRightEdge(nums: IntArray, target: Int): Int {
    // 最左の target + 1 を探す問題に変換する
    val i = binarySearchInsertion(nums, target + 1)
    // j は最も右の target を指し、i は target より大きい最初の要素を指す
    val j = i - 1
    // target が見つからなければ、-1 を返す
    if (j == -1 || nums[j] != target) {
        return -1
    }
    // target が見つかったら、インデックス j を返す
    return j
}

/* Driver Code */
fun main() {
    // 重複要素を含む配列
    val nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\n配列 nums = ${nums.contentToString()}")

    // 二分探索で左端と右端を探す
    for (target in intArrayOf(6, 7)) {
        var index = binarySearchLeftEdge(nums, target)
        println("最も左にある要素 $target のインデックスは $index")
        index = binarySearchRightEdge(nums, target)
        println("最も右にある要素 $target のインデックスは $index")
    }
}