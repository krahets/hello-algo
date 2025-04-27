/**
 * File: climbing_stairs_backtrack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* 回溯 */
fun backtrack(
    choices: MutableList<Int>,
    state: Int,
    n: Int,
    res: MutableList<Int>
) {
    // 当爬到第 n 阶时，方案数量加 1
    if (state == n)
        res[0] = res[0] + 1
    // 遍历所有选择
    for (choice in choices) {
        // 剪枝：不允许越过第 n 阶
        if (state + choice > n) continue
        // 尝试：做出选择，更新状态
        backtrack(choices, state + choice, n, res)
        // 回退
    }
}

/* 爬楼梯：回溯 */
fun climbingStairsBacktrack(n: Int): Int {
    val choices = mutableListOf(1, 2) // 可选择向上爬 1 阶或 2 阶
    val state = 0 // 从第 0 阶开始爬
    val res = mutableListOf<Int>()
    res.add(0) // 使用 res[0] 记录方案数量
    backtrack(choices, state, n, res)
    return res[0]
}

/* Driver Code */
fun main() {
    val n = 9

    val res = climbingStairsBacktrack(n)
    println("爬 $n 阶楼梯共有 $res 种方案")
}