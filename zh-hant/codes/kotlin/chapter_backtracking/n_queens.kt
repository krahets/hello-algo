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
    // 當放置完所有行時，記錄解
    if (row == n) {
        val copyState = mutableListOf<MutableList<String>>()
        for (sRow in state) {
            copyState.add(sRow.toMutableList())
        }
        res.add(copyState)
        return
    }
    // 走訪所有列
    for (col in 0..<n) {
        // 計算該格子對應的主對角線和次對角線
        val diag1 = row - col + n - 1
        val diag2 = row + col
        // 剪枝：不允許該格子所在列、主對角線、次對角線上存在皇后
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 嘗試：將皇后放置在該格子
            state[row][col] = "Q"
            diags2[diag2] = true
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
            // 放置下一行
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            // 回退：將該格子恢復為空位
            state[row][col] = "#"
            diags2[diag2] = false
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
        }
    }
}

/* 求解 n 皇后 */
fun nQueens(n: Int): MutableList<MutableList<MutableList<String>>?> {
    // 初始化 n*n 大小的棋盤，其中 'Q' 代表皇后，'#' 代表空位
    val state = mutableListOf<MutableList<String>>()
    for (i in 0..<n) {
        val row = mutableListOf<String>()
        for (j in 0..<n) {
            row.add("#")
        }
        state.add(row)
    }
    val cols = BooleanArray(n) // 記錄列是否有皇后
    val diags1 = BooleanArray(2 * n - 1) // 記錄主對角線上是否有皇后
    val diags2 = BooleanArray(2 * n - 1) // 記錄次對角線上是否有皇后
    val res = mutableListOf<MutableList<MutableList<String>>?>()

    backtrack(0, n, state, res, cols, diags1, diags2)

    return res
}

/* Driver Code */
fun main() {
    val n = 4
    val res = nQueens(n)

    println("輸入棋盤長寬為 $n")
    println("皇后放置方案共有 ${res.size} 種")
    for (state in res) {
        println("--------------------")
        for (row in state!!) {
            println(row)
        }
    }
}