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
    // 모든 물건의 선택을 마쳤거나 배낭에 남은 용량이 없으면 가치 0을 반환한다
    if (i == 0 || c == 0) {
        return 0
    }
    // 배낭 용량을 초과하면 배낭에 넣지 않는 선택만 가능하다
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, _val, i - 1, c)
    }
    // 물건 i를 넣지 않는 경우와 넣는 경우의 최대 가치를 계산한다
    val no = knapsackDFS(wgt, _val, i - 1, c)
    val yes = knapsackDFS(wgt, _val, i - 1, c - wgt[i - 1]) + _val[i - 1]
    // 두 경우 중 더 큰 가치를 반환한다
    return max(no, yes)
}

/* 0-1 배낭: 메모이제이션을 이용한 탐색 */
fun knapsackDFSMem(
    wgt: IntArray,
    _val: IntArray,
    mem: Array<IntArray>,
    i: Int,
    c: Int
): Int {
    // 모든 물건의 선택을 마쳤거나 배낭에 남은 용량이 없으면 가치 0을 반환한다
    if (i == 0 || c == 0) {
        return 0
    }
    // 기록이 이미 있으면 바로 반환한다
    if (mem[i][c] != -1) {
        return mem[i][c]
    }
    // 배낭 용량을 초과하면 배낭에 넣지 않는 선택만 가능하다
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, _val, mem, i - 1, c)
    }
    // 물건 i를 넣지 않는 경우와 넣는 경우의 최대 가치를 계산한다
    val no = knapsackDFSMem(wgt, _val, mem, i - 1, c)
    val yes = knapsackDFSMem(wgt, _val, mem, i - 1, c - wgt[i - 1]) + _val[i - 1]
    // 두 경우 중 더 큰 가치를 기록하고 반환한다
    mem[i][c] = max(no, yes)
    return mem[i][c]
}

/* 0-1 배낭: 동적 계획법 */
fun knapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
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
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* 0-1 배낭: 공간을 최적화한 동적 계획법 */
fun knapsackDPComp(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // dp 테이블을 초기화한다
    val dp = IntArray(cap + 1)
    // 상태 전이
    for (i in 1..n) {
        // 역방향 순회
        for (c in cap downTo 1) {
            if (wgt[i - 1] <= c) {
                // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[cap]
}

/* 실행 코드 */
fun main() {
    val wgt = intArrayOf(10, 20, 30, 40, 50)
    val _val = intArrayOf(50, 120, 150, 210, 240)
    val cap = 50
    val n = wgt.size

    // 완전 탐색
    var res = knapsackDFS(wgt, _val, n, cap)
    println("배낭 용량을 넘지 않게 담을 수 있는 물건의 최대 가치 = $res")

    // 메모이제이션을 이용한 탐색
    val mem = Array(n + 1) { IntArray(cap + 1) }
    for (row in mem) {
        row.fill(-1)
    }
    res = knapsackDFSMem(wgt, _val, mem, n, cap)
    println("배낭 용량을 넘지 않게 담을 수 있는 물건의 최대 가치 = $res")

    // 동적 계획법
    res = knapsackDP(wgt, _val, cap)
    println("배낭 용량을 넘지 않게 담을 수 있는 물건의 최대 가치 = $res")

    // 공간을 최적화한 동적 계획법
    res = knapsackDPComp(wgt, _val, cap)
    println("배낭 용량을 넘지 않게 담을 수 있는 물건의 최대 가치 = $res")
}