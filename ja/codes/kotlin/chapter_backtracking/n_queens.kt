/**
 * File: n_queens.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.n_queens

/* バックトラッキングによる n クイーン問題 */
fun backtrack(
    row: Int,
    n: Int,
    state: MutableList<MutableList<String>>,
    res: MutableList<MutableList<MutableList<String>>?>,
    cols: BooleanArray,
    diags1: BooleanArray,
    diags2: BooleanArray
) {
    // すべての行に置いたら解を記録する
    if (row == n) {
        val copyState = mutableListOf<MutableList<String>>()
        for (sRow in state) {
            copyState.add(sRow.toMutableList())
        }
        res.add(copyState)
        return
    }
    // すべての列を調べる
    for (col in 0..<n) {
        // このマスを通る主対角線と副対角線を求める
        val diag1 = row - col + n - 1
        val diag2 = row + col
        // 枝刈り：このマスと同じ列、主対角線、副対角線にクイーンがあってはならない
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 試行：このマスにクイーンを置く
            state[row][col] = "Q"
            diags2[diag2] = true
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
            // 次の行に置く
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            // 後戻り：このマスを空きに戻す
            state[row][col] = "#"
            diags2[diag2] = false
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
        }
    }
}

/* n クイーン問題を解く */
fun nQueens(n: Int): MutableList<MutableList<MutableList<String>>?> {
    // n*n の盤面を初期化する。'Q' はクイーン、'#' は空きマスを表す
    val state = mutableListOf<MutableList<String>>()
    for (i in 0..<n) {
        val row = mutableListOf<String>()
        for (j in 0..<n) {
            row.add("#")
        }
        state.add(row)
    }
    val cols = BooleanArray(n) // 各列にクイーンがあるか記録する
    val diags1 = BooleanArray(2 * n - 1) // 各主対角線にクイーンがあるか記録する
    val diags2 = BooleanArray(2 * n - 1) // 各副対角線にクイーンがあるか記録する
    val res = mutableListOf<MutableList<MutableList<String>>?>()

    backtrack(0, n, state, res, cols, diags1, diags2)

    return res
}

/* 実行例 */
fun main() {
    val n = 4
    val res = nQueens(n)

    println("盤面の一辺の長さ：$n")
    println("クイーンの配置は全部で ${res.size} 通り")
    for (state in res) {
        println("--------------------")
        for (row in state!!) {
            println(row)
        }
    }
}