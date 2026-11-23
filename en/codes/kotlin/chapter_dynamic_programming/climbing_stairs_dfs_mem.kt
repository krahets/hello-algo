/**
 * File: climbing_stairs_dfs_mem.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Memoized search */
fun dfs(i: Int, mem: IntArray): Int {
    // The values of dp[1] and dp[2] are known; return them
    if (i == 1 || i == 2) return i
    // If dp[i] has been recorded, return it directly
    if (mem[i] != -1) return mem[i]
    // dp[i] = dp[i-1] + dp[i-2]
    val count = dfs(i - 1, mem) + dfs(i - 2, mem)
    // Record dp[i]
    mem[i] = count
    return count
}

/* Climbing stairs: memoized search */
fun climbingStairsDFSMem(n: Int): Int {
    // mem[i] stores the number of ways to reach step i; -1 means no result has been recorded
    val mem = IntArray(n + 1)
    mem.fill(-1)
    return dfs(n, mem)
}

/* Driver code */
fun main() {
    val n = 9

    val res = climbingStairsDFSMem(n)
    println("There are $res ways to climb $n stairs")
}