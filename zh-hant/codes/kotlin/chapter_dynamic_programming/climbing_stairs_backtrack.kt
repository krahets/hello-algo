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
    // 爬到第 n 階時，將走法數加 1
    if (state == n)
        res[0] = res[0] + 1
    // 走訪所有選項
    for (choice in choices) {
        // 剪枝：不能越過第 n 階
        if (state + choice > n) continue
        // 嘗試：做出選擇，更新狀態
        backtrack(choices, state + choice, n, res)
        // 撤銷選擇
    }
}

/* 爬樓梯：回溯法 */
fun climbingStairsBacktrack(n: Int): Int {
    val choices = mutableListOf(1, 2) // 每次可以往上爬 1 階或 2 階
    val state = 0 // 從第 0 階開始爬
    val res = mutableListOf<Int>()
    res.add(0) // 用 res[0] 記錄走法數
    backtrack(choices, state, n, res)
    return res[0]
}

/* 主程式 */
fun main() {
    val n = 9

    val res = climbingStairsBacktrack(n)
    println("爬 $n 階樓梯共有 $res 種走法")
}