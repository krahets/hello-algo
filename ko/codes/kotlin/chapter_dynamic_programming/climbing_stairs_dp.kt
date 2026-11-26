/**
 * File: climbing_stairs_dp.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* 계단 오르기: 동적 계획법 */
fun climbingStairsDP(n: Int): Int {
    if (n == 1 || n == 2) return n
    // 부분 문제의 해를 저장할 dp 테이블 초기화
    val dp = IntArray(n + 1)
    // 초기 상태: 가장 작은 부분 문제의 해를 설정한다
    dp[1] = 1
    dp[2] = 2
    // 상태 전이: 작은 부분 문제부터 큰 부분 문제까지 차례로 푼다
    for (i in 3..n) {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

/* 계단 오르기: 공간 최적화 동적 계획법 */
fun climbingStairsDPComp(n: Int): Int {
    if (n == 1 || n == 2) return n
    var a = 1
    var b = 2
    for (i in 3..n) {
        val temp = b
        b += a
        a = temp
    }
    return b
}

/* 실행 예제 */
fun main() {
    val n = 9

    var res = climbingStairsDP(n)
    println("계단 수: $n, 오르는 방법 수: $res")

    res = climbingStairsDPComp(n)
    println("계단 수: $n, 오르는 방법 수: $res")
}