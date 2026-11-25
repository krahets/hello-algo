/**
 * File: climbing_stairs_dfs_mem.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Memoized search */
fun dfs(i: Int, mem: IntArray): Int {
    // Return the known value for dp[1] or dp[2]
    if (i == 1 || i == 2) return i
    // Return dp[i] directly if it is cached
    if (mem[i] != -1) return mem[i]
    // dp[i] = dp[i-1] + dp[i-2]
    val count = dfs(i - 1, mem) + dfs(i - 2, mem)
    // Cache dp[i]
    mem[i] = count
    return count
}

/* Climbing stairs with memoized search */
fun climbingStairsDFSMem(n: Int): Int {
    // mem[i] stores the number of ways to reach stair i. A value of -1 means no result is cached
    val mem = IntArray(n + 1)
    mem.fill(-1)
    return dfs(n, mem)
}

/* Driver code */
fun main() {
    val n = 9

    val res = climbingStairsDFSMem(n)
    println("Climbing $n stairs: $res ways")
}