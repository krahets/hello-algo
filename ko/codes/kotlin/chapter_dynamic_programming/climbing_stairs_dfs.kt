/**
 * File: climbing_stairs_dfs.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* 탐색 */
fun dfs(i: Int): Int {
    // dp[1]과 dp[2]는 이미 알고 있으므로 해당 값을 반환한다
    if (i == 1 || i == 2) return i
    // dp[i] = dp[i-1] + dp[i-2]
    val count = dfs(i - 1) + dfs(i - 2)
    return count
}

/* 계단 오르기: 탐색 */
fun climbingStairsDFS(n: Int): Int {
    return dfs(n)
}

/* 실행 코드 */
fun main() {
    val n = 9

    val res = climbingStairsDFS(n)
    println("계단 수 n = $n, 오르는 방법의 수 = $res")
}