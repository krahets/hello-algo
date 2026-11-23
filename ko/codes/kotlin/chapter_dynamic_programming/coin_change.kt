/**
 * File: coin_change.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* 동전 교환: 동적 계획법 */
fun coinChangeDP(coins: IntArray, amt: Int): Int {
    val n = coins.size
    val MAX = amt + 1
    // dp 테이블을 초기화한다
    val dp = Array(n + 1) { IntArray(amt + 1) }
    // 상태 전이: 첫 번째 행과 첫 번째 열
    for (a in 1..amt) {
        dp[0][a] = MAX
    }
    // 상태 전이: 나머지 행과 열
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[i][a] = dp[i - 1][a]
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
            }
        }
    }
    return if (dp[n][amt] != MAX) dp[n][amt] else -1
}

/* 동전 교환: 공간을 최적화한 동적 계획법 */
fun coinChangeDPComp(coins: IntArray, amt: Int): Int {
    val n = coins.size
    val MAX = amt + 1
    // dp 테이블을 초기화한다
    val dp = IntArray(amt + 1)
    dp.fill(MAX)
    dp[0] = 0
    // 상태 전이
    for (i in 1..n) {
        for (a in 1..amt) {
            if (coins[i - 1] > a) {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[a] = dp[a]
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
            }
        }
    }
    return if (dp[amt] != MAX) dp[amt] else -1
}

/* 실행 코드 */
fun main() {
    val coins = intArrayOf(1, 2, 5)
    val amt = 4

    // 동적 계획법
    var res = coinChangeDP(coins, amt)
    println("목표 금액을 만드는 데 필요한 최소 동전 개수 = $res")

    // 공간을 최적화한 동적 계획법
    res = coinChangeDPComp(coins, amt)
    println("목표 금액을 만드는 데 필요한 최소 동전 개수 = $res")
}