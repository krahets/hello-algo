/**
 * File: climbing_stairs_dfs_mem.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* 记忆化搜索 */
fun dfs(i: Int, mem: IntArray): Int {
    // 已知 dp[1] 和 dp[2] ，返回之
    if (i == 1 || i == 2) return i
    // 若存在记录 dp[i] ，则直接返回之
    if (mem[i] != -1) return mem[i]
    // dp[i] = dp[i-1] + dp[i-2]
    val count = dfs(i - 1, mem) + dfs(i - 2, mem)
    // 记录 dp[i]
    mem[i] = count
    return count
}

/* 爬楼梯：记忆化搜索 */
fun climbingStairsDFSMem(n: Int): Int {
    // mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
    val mem = IntArray(n + 1)
    mem.fill(-1)
    return dfs(n, mem)
}

/* Driver Code */
fun main() {
    val n = 9

    val res = climbingStairsDFSMem(n)
    println("爬 $n 阶楼梯共有 $res 种方案")
}