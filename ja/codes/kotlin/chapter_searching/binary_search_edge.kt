/**
 * File: binary_search_edge.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* 二分探索で最も左にある target を探す */
fun binarySearchLeftEdge(nums: IntArray, target: Int): Int {
    // target の挿入位置を探すことに等しい
    val i = binarySearchInsertion(nums, target)
    // target が見つからなかったので、-1 を返す
    if (i == nums.size || nums[i] != target) {
        return -1
    }
    // target が見つかったので、インデックス i を返す
    return i
}

/* 二分探索で最も右にある target を探す */
fun binarySearchRightEdge(nums: IntArray, target: Int): Int {
    // 最も左にある target + 1 を探す問題に変換する
    val i = binarySearchInsertion(nums, target + 1)
    // j は最も右にある target を指し、i は target より大きい最初の要素を指す
    val j = i - 1
    // target が見つからなかったので、-1 を返す
    if (j == -1 || nums[j] != target) {
        return -1
    }
    // target が見つかったので、インデックス j を返す
    return j
}

/* 実行用コード */
fun main() {
    // 重複要素を含む配列
    val nums = intArrayOf(1, 3, 6, 6, 6, 6, 6, 10, 12, 15)
    println("\n配列 nums = ${nums.contentToString()}")

    // 二分探索で左境界と右境界を求める
    for (target in intArrayOf(6, 7)) {
        var index = binarySearchLeftEdge(nums, target)
        println("最も左にある要素 $target のインデックスは $index")
        index = binarySearchRightEdge(nums, target)
        println("最も右にある要素 $target のインデックスは $index")
    }
}