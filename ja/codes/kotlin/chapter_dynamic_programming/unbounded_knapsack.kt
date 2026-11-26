/**
 * File: unbounded_knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.max

/* 個数制限なしナップサック問題：動的計画法 */
fun unboundedKnapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // dp テーブルを初期化する
    val dp = Array(n + 1) { IntArray(cap + 1) }
    // 状態遷移
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // 容量を超える場合は品物 i を選ばない
                dp[i][c] = dp[i - 1][c]
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きい方を取る
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 個数制限なしナップサック問題：使用メモリを削減した動的計画法 */
fun unboundedKnapsackDPComp(
    wgt: IntArray,
    _val: IntArray,
    cap: Int
): Int {
    val n = wgt.size
    // dp テーブルを初期化する
    val dp = IntArray(cap + 1)
    // 状態遷移
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // 容量を超える場合は品物 i を選ばない
                dp[c] = dp[c]
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きい方を取る
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[cap]
}

/* 実行例 */
fun main() {
    val wgt = intArrayOf(1, 2, 3)
    val _val = intArrayOf(5, 11, 15)
    val cap = 4

    // 動的計画法
    var res = unboundedKnapsackDP(wgt, _val, cap)
    println("容量内でナップサックに入る品物の最大価値は $res")

    // 使用メモリを削減した動的計画法
    res = unboundedKnapsackDPComp(wgt, _val, cap)
    println("容量内でナップサックに入る品物の最大価値は $res")
}