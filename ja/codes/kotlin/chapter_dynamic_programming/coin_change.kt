/**
 * File: coin_change.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* コイン両替：動的計画法 */
fun coinChangeDP(coins: IntArray, amt: Int): Int {
    val n = coins.size
    val MAX = amt + 1
    // dp テーブルを初期化
    val dp = Array(n + 1) { IntArray(amt + 1) }
    // 状態遷移：先頭行と先頭列
    for (a in 1..amt) {
        dp[0][a] = MAX
    }
    // 状態遷移: 残りの行と列
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // 目標金額を超えるなら硬貨 i は選ばない
                dp[i][a] = dp[i - 1][a]
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の小さい方
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
            }
        }
    }
    return if (dp[n][amt] != MAX) dp[n][amt] else -1
}

/* コイン交換：空間最適化後の動的計画法 */
fun coinChangeDPComp(coins: IntArray, amt: Int): Int {
    val n = coins.size
    val MAX = amt + 1
    // dp テーブルを初期化
    val dp = IntArray(amt + 1)
    dp.fill(MAX)
    dp[0] = 0
    // 状態遷移
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // 目標金額を超えるなら硬貨 i は選ばない
                dp[a] = dp[a]
            } else {
                // 硬貨 i を選ばない場合と選ぶ場合の小さい方
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
            }
        }
    }
    return if (dp[amt] != MAX) dp[amt] else -1
}

/* Driver Code */
fun main() {
    val coins = intArrayOf(1, 2, 5)
    val amt = 4

    // 動的計画法
    var res = coinChangeDP(coins, amt)
    println("目標金額を作るのに必要な最小硬貨枚数は $res")

    // 空間最適化後の動的計画法
    res = coinChangeDPComp(coins, amt)
    println("目標金額を作るのに必要な最小硬貨枚数は $res")
}