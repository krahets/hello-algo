/**
 * File: climbing_stairs_dfs_mem.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* 記憶化搜尋 */
fun dfs(i: Int, mem: IntArray): Int {
    // 已知 dp[1] 和 dp[2] ，返回之
    if (i == 1 || i == 2) return i
    // 若存在記錄 dp[i] ，則直接返回之
    if (mem[i] != -1) return mem[i]
    // dp[i] = dp[i-1] + dp[i-2]
    val count = dfs(i - 1, mem) + dfs(i - 2, mem)
    // 記錄 dp[i]
    mem[i] = count
    return count
}

/* 爬樓梯：記憶化搜尋 */
fun climbingStairsDFSMem(n: Int): Int {
    // mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
    val mem = IntArray(n + 1)
    mem.fill(-1)
    return dfs(n, mem)
}

/* Driver Code */
fun main() {
    val n = 9

    val res = climbingStairsDFSMem(n)
    println("爬 $n 階樓梯共有 $res 種方案")
}