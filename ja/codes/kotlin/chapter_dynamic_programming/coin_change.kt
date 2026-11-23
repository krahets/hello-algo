/**
 * File: coin_change.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* 硬貨の両替：動的計画法 */
fun coinChangeDP(coins: IntArray, amt: Int): Int {
    val n = coins.size
    val MAX = amt + 1
    // dp テーブルを初期化する
    val dp = Array(n + 1) { IntArray(amt + 1) }
    // 状態遷移：先頭行と先頭列
    for (a in 1..amt) {
        dp[0][a] = MAX
    }
    // 状態遷移：残りの行と列
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // 目標金額を超える場合、硬貨 i を選ばない
                dp[i][a] = dp[i - 1][a]
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
            }
        }
    }
    return if (dp[n][amt] != MAX) dp[n][amt] else -1
}

/* 硬貨の両替：空間を最適化した動的計画法 */
fun coinChangeDPComp(coins: IntArray, amt: Int): Int {
    val n = coins.size
    val MAX = amt + 1
    // dp テーブルを初期化する
    val dp = IntArray(amt + 1)
    dp.fill(MAX)
    dp[0] = 0
    // 状態遷移
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // 目標金額を超える場合、硬貨 i を選ばない
                dp[a] = dp[a]
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の小さいほうの値
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
            }
        }
    }
    return if (dp[amt] != MAX) dp[amt] else -1
}

/* 実行用コード */
fun main() {
    val coins = intArrayOf(1, 2, 5)
    val amt = 4

    // 動的計画法
    var res = coinChangeDP(coins, amt)
    println("目標金額にするために必要な硬貨の最小枚数は $res")

    // 空間を最適化した動的計画法
    res = coinChangeDPComp(coins, amt)
    println("目標金額にするために必要な硬貨の最小枚数は $res")
}