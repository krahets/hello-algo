/**
 * File: min_cost_climbing_stairs_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* 계단 오르기의 최소 비용: 동적 계획법 */
fun minCostClimbingStairsDP(cost: IntArray): Int {
    val n = cost.size - 1
    if (n == 1 || n == 2) return cost[n]
    // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
    val dp = IntArray(n + 1)
    // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
    dp[1] = cost[1]
    dp[2] = cost[2]
    // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
    for (i in 3..n) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    }
    return dp[n]
}

/* 계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법 */
fun minCostClimbingStairsDPComp(cost: IntArray): Int {
    val n = cost.size - 1
    if (n == 1 || n == 2) return cost[n]
    var a = cost[1]
    var b = cost[2]
    for (i in 3..n) {
        val tmp = b
        b = min(a, tmp) + cost[i]
        a = tmp
    }
    return b
}

/* 실행 코드 */
fun main() {
    val cost = intArrayOf(0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1)
    println("입력한 계단별 비용 리스트 = ${cost.contentToString()}")

    var res = minCostClimbingStairsDP(cost)
    println("계단을 모두 오르는 최소 비용 = $res")

    res = minCostClimbingStairsDPComp(cost)
    println("계단을 모두 오르는 최소 비용 = $res")
}