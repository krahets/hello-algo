/**
 * File: knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.max

/* 0-1 배낭: 완전 탐색 */
fun knapsackDFS(
    wgt: IntArray,
    _val: IntArray,
    i: Int,
    c: Int
): Int {
    // 모든 물건을 검토했거나 남은 용량이 없으면 가치 0을 반환한다
    if (i == 0 || c == 0) {
        return 0
    }
    // 배낭 용량을 넘으면 물건을 넣지 않는 선택만 가능하다
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, _val, i - 1, c)
    }
    // 물건 i를 넣지 않을 때와 넣을 때 각각의 최대 가치를 구한다
    val no = knapsackDFS(wgt, _val, i - 1, c)
    val yes = knapsackDFS(wgt, _val, i - 1, c - wgt[i - 1]) + _val[i - 1]
    // 두 경우 중 큰 가치를 반환한다
    return max(no, yes)
}

/* 0-1 배낭: 메모이제이션 탐색 */
fun knapsackDFSMem(
    wgt: IntArray,
    _val: IntArray,
    mem: Array<IntArray>,
    i: Int,
    c: Int
): Int {
    // 모든 물건을 검토했거나 남은 용량이 없으면 가치 0을 반환한다
    if (i == 0 || c == 0) {
        return 0
    }
    // 기록이 있으면 바로 반환한다
    if (mem[i][c] != -1) {
        return mem[i][c]
    }
    // 배낭 용량을 넘으면 물건을 넣지 않는 선택만 가능하다
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, _val, mem, i - 1, c)
    }
    // 물건 i를 넣지 않을 때와 넣을 때 각각의 최대 가치를 구한다
    val no = knapsackDFSMem(wgt, _val, mem, i - 1, c)
    val yes = knapsackDFSMem(wgt, _val, mem, i - 1, c - wgt[i - 1]) + _val[i - 1]
    // 두 경우 중 큰 가치를 기록하고 반환한다
    mem[i][c] = max(no, yes)
    return mem[i][c]
}

/* 0-1 배낭: 동적 계획법 */
fun knapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // dp 테이블 초기화
    val dp = Array(n + 1) { IntArray(cap + 1) }
    // 상태 전이
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // 배낭 용량을 넘으면 물건 i를 선택하지 않는다
                dp[i][c] = dp[i - 1][c]
            } else {
                // 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 0-1 배낭: 공간 최적화 동적 계획법 */
fun knapsackDPComp(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // dp 테이블 초기화
    val dp = IntArray(cap + 1)
    // 상태 전이
    for (i in 1..n) {
        // 역순으로 순회
        for (c in cap downTo 1) {
            if (wgt[i - 1] <= c) {
                // 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[cap]
}

/* 실행 예제 */
fun main() {
    val wgt = intArrayOf(10, 20, 30, 40, 50)
    val _val = intArrayOf(50, 120, 150, 210, 240)
    val cap = 50
    val n = wgt.size

    // 완전 탐색
    var res = knapsackDFS(wgt, _val, n, cap)
    println("배낭 용량 내에서 얻는 최대 가치: $res")

    // 메모이제이션 탐색
    val mem = Array(n + 1) { IntArray(cap + 1) }
    for (row in mem) {
        row.fill(-1)
    }
    res = knapsackDFSMem(wgt, _val, mem, n, cap)
    println("배낭 용량 내에서 얻는 최대 가치: $res")

    // 동적 계획법
    res = knapsackDP(wgt, _val, cap)
    println("배낭 용량 내에서 얻는 최대 가치: $res")

    // 공간 최적화 동적 계획법
    res = knapsackDPComp(wgt, _val, cap)
    println("배낭 용량 내에서 얻는 최대 가치: $res")
}