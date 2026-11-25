/**
 * File: counting_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

import kotlin.math.max

/* カウントソート */
// 簡易版。オブジェクトのソートには使えない
fun countingSortNaive(nums: IntArray) {
    // 1. 配列の最大値 m を求める
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. 各数値の出現回数を数える
    // counter[num] は num の出現回数を表す
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. counter を走査し、各要素を元の配列 nums に書き込む
    var i = 0
    for (num in 0..<m + 1) {
        var j = 0
        while (j < counter[num]) {
            nums[i] = num
            j++
            i++
        }
    }
}

/* カウントソート */
// 完全版。オブジェクトもソートでき、安定性を保つ
fun countingSort(nums: IntArray) {
    // 1. 配列の最大値 m を求める
    var m = 0
    for (num in nums) {
        m = max(m, num)
    }
    // 2. 各数値の出現回数を数える
    // counter[num] は num の出現回数を表す
    val counter = IntArray(m + 1)
    for (num in nums) {
        counter[num]++
    }
    // 3. counter の累積和を求め、出現回数から各値の末尾位置を求められるようにする
    // つまり counter[num]-1 は res 内で num が最後に現れるインデックス
    for (i in 0..<m) {
        counter[i + 1] += counter[i]
    }
    // 4. nums を逆順に走査し、各要素を結果配列 res に書き込む
    // 結果を格納する配列 res を初期化
    val n = nums.size
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val num = nums[i]
        res[counter[num] - 1] = num // num を対応するインデックスに配置
        counter[num]-- // 累積和を 1 減らして、次に num を置く位置を求める
    }
    // 結果配列 res で元の配列 nums を上書き
    for (i in 0..<n) {
        nums[i] = res[i]
    }
}

/* 実行例 */
fun main() {
    val nums = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSortNaive(nums)
    println("カウントソート（オブジェクトは対象外）後の nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSort(nums1)
    println("カウントソート後の nums1 = ${nums1.contentToString()}")
}