/**
 * File: selection_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 選択ソート */
fun selectionSort(nums: IntArray) {
    val n = nums.size
    // 外側ループ：未整列区間は [i, n-1]
    for (i in 0..<n - 1) {
        var k = i
        // 内側のループ：未ソート区間の最小要素を見つける
        for (j in i + 1..<n) {
            if (nums[j] < nums[k])
                k = j // 最小要素のインデックスを記録
        }
        // その最小要素を未整列区間の先頭要素と交換する
        val temp = nums[i]
        nums[i] = nums[k]
        nums[k] = temp
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    selectionSort(nums)
    println("選択ソート完了後 nums = ${nums.contentToString()}")
}