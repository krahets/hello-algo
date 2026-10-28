/**
 * File: climbing_stairs_dfs_mem.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* 메모이제이션을 이용한 탐색 */
fun dfs(i: Int, mem: IntArray): Int {
    // dp[1]과 dp[2]는 이미 알고 있으므로 해당 값을 반환한다
    if (i == 1 || i == 2) return i
    // dp[i]의 기록이 있으면 해당 값을 바로 반환한다
    if (mem[i] != -1) return mem[i]
    // dp[i] = dp[i-1] + dp[i-2]
    val count = dfs(i - 1, mem) + dfs(i - 2, mem)
    // dp[i]를 기록한다
    mem[i] = count
    return count
}

/* 계단 오르기: 메모이제이션을 이용한 탐색 */
fun climbingStairsDFSMem(n: Int): Int {
    // mem[i]는 i번째 계단까지 오르는 전체 방법의 수를 기록하며, -1은 기록이 없음을 나타낸다
    val mem = IntArray(n + 1)
    mem.fill(-1)
    return dfs(n, mem)
}

/* 실행 코드 */
fun main() {
    val n = 9

    val res = climbingStairsDFSMem(n)
    println("계단 수 n = $n, 오르는 방법의 수 = $res")
}