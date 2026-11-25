/**
 * File: coin_change_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* 零錢兌換 II：動態規劃 */
fun coinChangeIIDP(coins: IntArray, amt: Int): Int {
    val n = coins.size
    // 初始化 dp 表
    val dp = Array(n + 1) { IntArray(amt + 1) }
    // 初始化第一欄
    for (i in 0..n) {
        dp[i][0] = 1
    }
    // 狀態轉移
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // 若面額超過目標金額，就不選硬幣 i
                dp[i][a] = dp[i - 1][a]
            } else {
                // 將不選與選取硬幣 i 兩種情況的組合數相加
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
            }
        }
    }
    return dp[n][amt]
}

/* 零錢兌換 II：空間最佳化後的動態規劃 */
fun coinChangeIIDPComp(coins: IntArray, amt: Int): Int {
    val n = coins.size
    // 初始化 dp 表
    val dp = IntArray(amt + 1)
    dp[0] = 1
    // 狀態轉移
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // 若面額超過目標金額，就不選硬幣 i
                dp[a] = dp[a]
            } else {
                // 將不選與選取硬幣 i 兩種情況的組合數相加
                dp[a] = dp[a] + dp[a - coins[i - 1]]
            }
        }
    }
    return dp[amt]
}

/* 主程式 */
fun main() {
    val coins = intArrayOf(1, 2, 5)
    val amt = 5

    // 動態規劃
    var res = coinChangeIIDP(coins, amt)
    println("湊出目標金額的硬幣組合數為 $res")

    // 空間最佳化後的動態規劃
    res = coinChangeIIDPComp(coins, amt)
    println("湊出目標金額的硬幣組合數為 $res")
}