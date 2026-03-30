/**
 * File: climbing_stairs_dfs_mem.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Поиск с мемоизацией */
fun dfs(i: Int, mem: IntArray): Int {
    // dp[1] и dp[2] уже известны, вернуть их
    if (i == 1 || i == 2) return i
    // Если запись dp[i] существует, сразу вернуть ее
    if (mem[i] != -1) return mem[i]
    // dp[i] = dp[i-1] + dp[i-2]
    val count = dfs(i - 1, mem) + dfs(i - 2, mem)
    // Сохранить dp[i]
    mem[i] = count
    return count
}

/* Подъем по лестнице: поиск с мемоизацией */
fun climbingStairsDFSMem(n: Int): Int {
    // mem[i] хранит число способов подняться на i-ю ступень, -1 означает отсутствие записи
    val mem = IntArray(n + 1)
    mem.fill(-1)
    return dfs(n, mem)
}

/* Driver Code */
fun main() {
    val n = 9

    val res = climbingStairsDFSMem(n)
    println("Количество способов подняться по лестнице из $n ступеней = $res")
}