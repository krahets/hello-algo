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
    // 當爬到第 n 階時，方案數量加 1
    if (state == n)
        res[0] = res[0] + 1
    // 走訪所有選擇
    for (choice in choices) {
        // 剪枝：不允許越過第 n 階
        if (state + choice > n) continue
        // 嘗試：做出選擇，更新狀態
        backtrack(choices, state + choice, n, res)
        // 回退
    }
}

/* 爬樓梯：回溯 */
fun climbingStairsBacktrack(n: Int): Int {
    val choices = mutableListOf(1, 2) // 可選擇向上爬 1 階或 2 階
    val state = 0 // 從第 0 階開始爬
    val res = mutableListOf<Int>()
    res.add(0) // 使用 res[0] 記錄方案數量
    backtrack(choices, state, n, res)
    return res[0]
}

/* Driver Code */
fun main() {
    val n = 9

    val res = climbingStairsBacktrack(n)
    println("爬 $n 階樓梯共有 $res 種方案")
}