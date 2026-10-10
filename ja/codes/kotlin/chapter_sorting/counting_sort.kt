/**
 * File: counting_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

import kotlin.math.max

/* 計数ソート */
// 簡易実装のため、オブジェクトのソートには使えない
fun countingSortNaive(nums: IntArray) {
    // 1. 配列の最大要素 m を求める
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
    // 3. counter を走査し、各要素を元の配列 nums に書き戻す
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

/* 計数ソート */
// 完全な実装で、オブジェクトをソートでき、かつ安定ソートである
fun countingSort(nums: IntArray) {
    // 1. 配列の最大要素 m を求める
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
    // 3. counter の累積和を求めて、「出現回数」を「末尾インデックス」に変換する
    // つまり counter[num]-1 は、num が res に最後に現れるインデックス
    for (i in 0..<m) {
        counter[i + 1] += counter[i]
    }
    // 4. nums を逆順に走査し、各要素を結果配列 res に格納する
    // 結果を記録するための配列 res を初期化
    val n = nums.size
    val res = IntArray(n)
    for (i in n - 1 downTo 0) {
        val num = nums[i]
        res[counter[num] - 1] = num // num を対応するインデックスに配置
        counter[num]-- // 累積和を 1 減らして、次に num を配置するインデックスを得る
    }
    // 結果配列 res で元の配列 nums を上書きする
    for (i in 0..<n) {
        nums[i] = res[i]
    }
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSortNaive(nums)
    println("カウントソート（オブジェクトはソート不可）完了後 nums = ${nums.contentToString()}")

    val nums1 = intArrayOf(1, 0, 1, 2, 0, 4, 0, 2, 2, 4)
    countingSort(nums1)
    println("カウントソート完了後 nums1 = ${nums1.contentToString()}")
}