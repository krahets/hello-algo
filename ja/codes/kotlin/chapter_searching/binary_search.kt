/**
 * File: binary_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* 二分探索（閉区間） */
fun binarySearch(nums: IntArray, target: Int): Int {
    // 閉区間 [0, n-1] を初期化する。i, j は配列の先頭要素と末尾要素をそれぞれ指す
    var i = 0
    var j = nums.size - 1
    // 探索区間が空になるまで繰り返す（i > j のとき空になる）
    while (i <= j) {
        val m = i + (j - i) / 2 // 中央のインデックス m を計算する
        if (nums[m] < target) // この場合、target は区間 [m+1, j] に存在する
            i = m + 1
        else if (nums[m] > target) // この場合、target は区間 [i, m-1] に存在する
            j = m - 1
        else  // 目的の要素が見つかったので、そのインデックスを返す
            return m
    }
    // 目的の要素が見つからなかったので、-1 を返す
    return -1
}

/* 二分探索（左閉右開区間） */
fun binarySearchLCRO(nums: IntArray, target: Int): Int {
    // 左閉右開区間 [0, n) を初期化する。i, j は配列の先頭要素と末尾要素の次をそれぞれ指す
    var i = 0
    var j = nums.size
    // 探索区間が空になるまで繰り返す（i = j のとき空になる）
    while (i < j) {
        val m = i + (j - i) / 2 // 中央のインデックス m を計算する
        if (nums[m] < target) // この場合、target は区間 [m+1, j) に存在する
            i = m + 1
        else if (nums[m] > target) // この場合、target は区間 [i, m) に存在する
            j = m
        else  // 目的の要素が見つかったので、そのインデックスを返す
            return m
    }
    // 目的の要素が見つからなかったので、-1 を返す
    return -1
}

/* 実行用コード */
fun main() {
    val target = 6
    val nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)

    /* 二分探索（閉区間） */
    var index = binarySearch(nums, target)
    println("目的の要素 6 のインデックス = $index")

    /* 二分探索（左閉右開区間） */
    index = binarySearchLCRO(nums, target)
    println("目的の要素 6 のインデックス = $index")
}