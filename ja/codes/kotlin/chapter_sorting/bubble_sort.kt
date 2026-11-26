/**
 * File: bubble_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* バブルソート */
fun bubbleSort(nums: IntArray) {
    // 外側のループ：未整列区間は [0, i]
    for (i in nums.size - 1 downTo 1) {
        // 内側のループ：交換を繰り返し、未整列区間 [0, i] の最大要素を右端に移す
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
            }
        }
    }
}

/* バブルソート（フラグによる最適化） */
fun bubbleSortWithFlag(nums: IntArray) {
    // 外側のループ：未整列区間は [0, i]
    for (i in nums.size - 1 downTo 1) {
        var flag = false // フラグを初期化
        // 内側のループ：交換を繰り返し、未整列区間 [0, i] の最大要素を右端に移す
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // nums[j] と nums[j + 1] を交換
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                flag = true // 交換があったことを記録
            }
        }
        if (!flag) break // この走査で交換がなければループを終了
    }
}

/* 実行例 */
fun main() {
    val nums = intArrayOf(4, 1, 3, 1, 5, 2)
    bubbleSort(nums)
    println("バブルソート後の nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(4, 1, 3, 1, 5, 2)
    bubbleSortWithFlag(nums1)
    println("バブルソート後の nums1 = ${nums1.contentToString()}")
}