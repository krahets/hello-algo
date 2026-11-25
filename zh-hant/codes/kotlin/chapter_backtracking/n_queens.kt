/**
 * File: n_queens.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.n_queens

/* 回溯演算法：n 皇后 */
fun backtrack(
    row: Int,
    n: Int,
    state: MutableList<MutableList<String>>,
    res: MutableList<MutableList<MutableList<String>>?>,
    cols: BooleanArray,
    diags1: BooleanArray,
    diags2: BooleanArray
) {
    // 每一列都放好皇后後，記錄此解
    if (row == n) {
        val copyState = mutableListOf<MutableList<String>>()
        for (sRow in state) {
            copyState.add(sRow.toMutableList())
        }
        res.add(copyState)
        return
    }
    // 逐一檢查各欄
    for (col in 0..<n) {
        // 計算這一格對應的主對角線與副對角線索引
        val diag1 = row - col + n - 1
        val diag2 = row + col
        // 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 嘗試：將皇后放在這一格
            state[row][col] = "Q"
            diags2[diag2] = true
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
            // 在下一列放置皇后
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            // 回溯：將這一格還原為空位
            state[row][col] = "#"
            diags2[diag2] = false
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
        }
    }
}

/* 求解 n 皇后問題 */
fun nQueens(n: Int): MutableList<MutableList<MutableList<String>>?> {
    // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
    val state = mutableListOf<MutableList<String>>()
    for (i in 0..<n) {
        val row = mutableListOf<String>()
        for (j in 0..<n) {
            row.add("#")
        }
        state.add(row)
    }
    val cols = BooleanArray(n) // 記錄各欄是否已有皇后
    val diags1 = BooleanArray(2 * n - 1) // 記錄各主對角線上是否已有皇后
    val diags2 = BooleanArray(2 * n - 1) // 記錄各副對角線上是否已有皇后
    val res = mutableListOf<MutableList<MutableList<String>>?>()

    backtrack(0, n, state, res, cols, diags1, diags2)

    return res
}

/* 主程式 */
fun main() {
    val n = 4
    val res = nQueens(n)

    println("輸入棋盤的邊長為 $n")
    println("皇后共有 ${res.size} 種擺法")
    for (state in res) {
        println("--------------------")
        for (row in state!!) {
            println(row)
        }
    }
}