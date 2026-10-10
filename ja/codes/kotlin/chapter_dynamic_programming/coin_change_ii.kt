/**
 * File: coin_change_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* コイン両替 II：動的計画法 */
fun coinChangeIIDP(coins: IntArray, amt: Int): Int {
    val n = coins.size
    // dp テーブルを初期化
    val dp = Array(n + 1) { IntArray(amt + 1) }
    // 先頭列を初期化する
    for (i in 0..n) {
        dp[i][0] = 1
    }
    // 状態遷移
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // 目標金額を超えるなら硬貨 i は選ばない
                dp[i][a] = dp[i - 1][a]
            } else {
                // コイン i を選ばない場合と選ぶ場合の和
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
            }
        }
    }
    return dp[n][amt]
}

/* コイン両替 II：空間最適化した動的計画法 */
fun coinChangeIIDPComp(coins: IntArray, amt: Int): Int {
    val n = coins.size
    // dp テーブルを初期化
    val dp = IntArray(amt + 1)
    dp[0] = 1
    // 状態遷移
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // 目標金額を超えるなら硬貨 i は選ばない
                dp[a] = dp[a]
            } else {
                // コイン i を選ばない場合と選ぶ場合の和
                dp[a] = dp[a] + dp[a - coins[i - 1]]
            }
        }
    }
    return dp[amt]
}

/* Driver Code */
fun main() {
    val coins = intArrayOf(1, 2, 5)
    val amt = 5

    // 動的計画法
    var res = coinChangeIIDP(coins, amt)
    println("目標金額を作る硬貨の組み合わせ数は $res")

    // 空間最適化後の動的計画法
    res = coinChangeIIDPComp(coins, amt)
    println("目標金額を作る硬貨の組み合わせ数は $res")
}