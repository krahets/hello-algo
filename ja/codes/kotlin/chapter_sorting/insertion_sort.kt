/**
 * File: insertion_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 挿入ソート */
fun insertionSort(nums: IntArray) {
    //外側のループ：ソート済みの要素は 1, 2, ..., n
    for (i in nums.indices) {
        val base = nums[i]
        var j = i - 1
        // 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j] // nums[j] を右に 1 つずらす
            j--
        }
        nums[j + 1] = base        // 正しい位置に base を代入する
    }
}

/* 実行用コード */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    insertionSort(nums)
    println("挿入ソート完了後 nums = ${nums.contentToString()}")
}