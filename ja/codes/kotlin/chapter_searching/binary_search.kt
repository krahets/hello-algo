/**
 * File: binary_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

/* 二分探索（両閉区間） */
fun binarySearch(nums: IntArray, target: Int): Int {
    // 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
    var i = 0
    var j = nums.size - 1
    // ループし、探索区間が空になったら終了する（i > j で空）
    while (i <= j) {
        val m = i + (j - i) / 2 // 中点インデックス m を計算
        if (nums[m] < target) // この場合、target は区間 [m+1, j] にある
            i = m + 1
        else if (nums[m] > target) // この場合、target は区間 [i, m-1] にある
            j = m - 1
        else  // 目標要素が見つかったらそのインデックスを返す
            return m
    }
    // 目標要素が見つからなければ -1 を返す
    return -1
}

/* 二分探索（左閉右開区間） */
fun binarySearchLCRO(nums: IntArray, target: Int): Int {
    // 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
    var i = 0
    var j = nums.size
    // ループし、探索区間が空になったら終了する（i = j で空）
    while (i < j) {
        val m = i + (j - i) / 2 // 中点インデックス m を計算
        if (nums[m] < target) // この場合、target は区間 [m+1, j) にある
            i = m + 1
        else if (nums[m] > target) // この場合、target は区間 [i, m) にある
            j = m
        else  // 目標要素が見つかったらそのインデックスを返す
            return m
    }
    // 目標要素が見つからなければ -1 を返す
    return -1
}

/* Driver Code */
fun main() {
    val target = 6
    val nums = intArrayOf(1, 3, 6, 8, 12, 15, 23, 26, 31, 35)

    /* 二分探索（両閉区間） */
    var index = binarySearch(nums, target)
    println("対象要素 6 のインデックス = $index")

    /* 二分探索（左閉右開区間） */
    index = binarySearchLCRO(nums, target)
    println("対象要素 6 のインデックス = $index")
}