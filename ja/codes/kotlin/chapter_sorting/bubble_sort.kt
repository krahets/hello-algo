/**
 * File: bubble_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* バブルソート */
fun bubbleSort(nums: IntArray) {
    // 外側のループ：未ソート区間は [0, i]
    for (i in nums.size - 1 downTo 1) {
        // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換する
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
            }
        }
    }
}

/* バブルソート（フラグによる最適化） */
fun bubbleSortWithFlag(nums: IntArray) {
    // 外側のループ：未ソート区間は [0, i]
    for (i in nums.size - 1 downTo 1) {
        var flag = false // フラグを初期化する
        // 内側のループ：未ソート区間 [0, i] の最大要素を区間の右端に移す
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換する
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                flag = true // 要素を交換したことを記録する
            }
        }
        if (!flag) break // 今回の「バブル」で要素を一度も交換しなかった場合、直ちに終了する
    }
}

/* 実行用コード */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    bubbleSort(nums)
    println("バブルソート完了後 nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(4, 1, 3, 1, 5, 2)
    bubbleSortWithFlag(nums1)
    println("バブルソート完了後 nums1 = ${nums1.contentToString()}")
}