/**
 * File: unbounded_knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.max

/* 무한 배낭: 동적 계획법 */
fun unboundedKnapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // dp 테이블을 초기화한다
    val dp = Array(n + 1) { IntArray(cap + 1) }
    // 상태 전이
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                dp[i][c] = dp[i - 1][c]
            } else {
                // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 무한 배낭: 공간을 최적화한 동적 계획법 */
fun unboundedKnapsackDPComp(
    wgt: IntArray,
    _val: IntArray,
    cap: Int
): Int {
    val n = wgt.size
    // dp 테이블을 초기화한다
    val dp = IntArray(cap + 1)
    // 상태 전이
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                dp[c] = dp[c]
            } else {
                // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[cap]
}

/* 실행 코드 */
fun main() {
    val wgt = intArrayOf(1, 2, 3)
    val _val = intArrayOf(5, 11, 15)
    val cap = 4

    // 동적 계획법
    var res = unboundedKnapsackDP(wgt, _val, cap)
    println("배낭 용량을 넘지 않게 담을 수 있는 물건의 최대 가치 = $res")

    // 공간을 최적화한 동적 계획법
    res = unboundedKnapsackDPComp(wgt, _val, cap)
    println("배낭 용량을 넘지 않게 담을 수 있는 물건의 최대 가치 = $res")
}