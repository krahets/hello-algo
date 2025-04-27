/**
 * File: edit_distance.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* 编辑距离：暴力搜索 */
fun editDistanceDFS(
    s: String,
    t: String,
    i: Int,
    j: Int
): Int {
    // 若 s 和 t 都为空，则返回 0
    if (i == 0 && j == 0) return 0
    // 若 s 为空，则返回 t 长度
    if (i == 0) return j
    // 若 t 为空，则返回 s 长度
    if (j == 0) return i
    // 若两字符相等，则直接跳过此两字符
    if (s[i - 1] == t[j - 1]) return editDistanceDFS(s, t, i - 1, j - 1)
    // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
    val insert = editDistanceDFS(s, t, i, j - 1)
    val delete = editDistanceDFS(s, t, i - 1, j)
    val replace = editDistanceDFS(s, t, i - 1, j - 1)
    // 返回最少编辑步数
    return min(min(insert, delete), replace) + 1
}

/* 编辑距离：记忆化搜索 */
fun editDistanceDFSMem(
    s: String,
    t: String,
    mem: Array<IntArray>,
    i: Int,
    j: Int
): Int {
    // 若 s 和 t 都为空，则返回 0
    if (i == 0 && j == 0) return 0
    // 若 s 为空，则返回 t 长度
    if (i == 0) return j
    // 若 t 为空，则返回 s 长度
    if (j == 0) return i
    // 若已有记录，则直接返回之
    if (mem[i][j] != -1) return mem[i][j]
    // 若两字符相等，则直接跳过此两字符
    if (s[i - 1] == t[j - 1]) return editDistanceDFSMem(s, t, mem, i - 1, j - 1)
    // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
    val insert = editDistanceDFSMem(s, t, mem, i, j - 1)
    val delete = editDistanceDFSMem(s, t, mem, i - 1, j)
    val replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1)
    // 记录并返回最少编辑步数
    mem[i][j] = min(min(insert, delete), replace) + 1
    return mem[i][j]
}

/* 编辑距离：动态规划 */
fun editDistanceDP(s: String, t: String): Int {
    val n = s.length
    val m = t.length
    val dp = Array(n + 1) { IntArray(m + 1) }
    // 状态转移：首行首列
    for (i in 1..n) {
        dp[i][0] = i
    }
    for (j in 1..m) {
        dp[0][j] = j
    }
    // 状态转移：其余行和列
    for (i in 1..n) {
        for (j in 1..m) {
            if (s[i - 1] == t[j - 1]) {
                // 若两字符相等，则直接跳过此两字符
                dp[i][j] = dp[i - 1][j - 1]
            } else {
                // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
                dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1
            }
        }
    }
    return dp[n][m]
}

/* 编辑距离：空间优化后的动态规划 */
fun editDistanceDPComp(s: String, t: String): Int {
    val n = s.length
    val m = t.length
    val dp = IntArray(m + 1)
    // 状态转移：首行
    for (j in 1..m) {
        dp[j] = j
    }
    // 状态转移：其余行
    for (i in 1..n) {
        // 状态转移：首列
        var leftup = dp[0] // 暂存 dp[i-1, j-1]
        dp[0] = i
        // 状态转移：其余列
        for (j in 1..m) {
            val temp = dp[j]
            if (s[i - 1] == t[j - 1]) {
                // 若两字符相等，则直接跳过此两字符
                dp[j] = leftup
            } else {
                // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
                dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1
            }
            leftup = temp // 更新为下一轮的 dp[i-1, j-1]
        }
    }
    return dp[m]
}

/* Driver Code */
fun main() {
    val s = "bag"
    val t = "pack"
    val n = s.length
    val m = t.length

    // 暴力搜索
    var res = editDistanceDFS(s, t, n, m)
    println("将 $s 更改为 $t 最少需要编辑 $res 步")

    // 记忆化搜索
    val mem = Array(n + 1) { IntArray(m + 1) }
    for (row in mem)
        row.fill(-1)
    res = editDistanceDFSMem(s, t, mem, n, m)
    println("将 $s 更改为 $t 最少需要编辑 $res 步")

    // 动态规划
    res = editDistanceDP(s, t)
    println("将 $s 更改为 $t 最少需要编辑 $res 步")

    // 空间优化后的动态规划
    res = editDistanceDPComp(s, t)
    println("将 $s 更改为 $t 最少需要编辑 $res 步")
}