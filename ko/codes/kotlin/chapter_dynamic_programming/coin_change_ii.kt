/**
 * File: coin_change_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* 동전 교환 II: 동적 계획법 */
fun coinChangeIIDP(coins: IntArray, amt: Int): Int {
    val n = coins.size
    // dp 테이블을 초기화한다
    val dp = Array(n + 1) { IntArray(amt + 1) }
    // 첫 번째 열을 초기화한다
    for (i in 0..n) {
        dp[i][0] = 1
    }
    // 상태 전이
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[i][a] = dp[i - 1][a]
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
            }
        }
    }
    return dp[n][amt]
}

/* 동전 교환 II: 공간을 최적화한 동적 계획법 */
fun coinChangeIIDPComp(coins: IntArray, amt: Int): Int {
    val n = coins.size
    // dp 테이블을 초기화한다
    val dp = IntArray(amt + 1)
    dp[0] = 1
    // 상태 전이
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[a] = dp[a]
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                dp[a] = dp[a] + dp[a - coins[i - 1]]
            }
        }
    }
    return dp[amt]
}

/* 실행 코드 */
fun main() {
    val coins = intArrayOf(1, 2, 5)
    val amt = 5

    // 동적 계획법
    var res = coinChangeIIDP(coins, amt)
    println("목표 금액을 만드는 동전 조합의 수 = $res")

    // 공간을 최적화한 동적 계획법
    res = coinChangeIIDPComp(coins, amt)
    println("목표 금액을 만드는 동전 조합의 수 = $res")
}