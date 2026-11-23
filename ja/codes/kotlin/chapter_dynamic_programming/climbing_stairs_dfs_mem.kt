/**
 * File: climbing_stairs_dfs_mem.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* メモ化探索 */
fun dfs(i: Int, mem: IntArray): Int {
    // dp[1] と dp[2] は既知なので、その値を返す
    if (i == 1 || i == 2) return i
    // dp[i] が記録済みなら、その値をそのまま返す
    if (mem[i] != -1) return mem[i]
    // dp[i] = dp[i-1] + dp[i-2]
    val count = dfs(i - 1, mem) + dfs(i - 2, mem)
    // dp[i] を記録する
    mem[i] = count
    return count
}

/* 階段の上り方：メモ化探索 */
fun climbingStairsDFSMem(n: Int): Int {
    // mem[i] は i 段目まで上る方法の総数を記録し、-1 は未記録を表す
    val mem = IntArray(n + 1)
    mem.fill(-1)
    return dfs(n, mem)
}

/* 実行用コード */
fun main() {
    val n = 9

    val res = climbingStairsDFSMem(n)
    println("$n 段の階段を上る方法は全部で $res 通り")
}