/**
 * File: n_queens.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.n_queens

/* バックトラッキング：N クイーン */
fun backtrack(
    row: Int,
    n: Int,
    state: MutableList<MutableList<String>>,
    res: MutableList<MutableList<MutableList<String>>?>,
    cols: BooleanArray,
    diags1: BooleanArray,
    diags2: BooleanArray
) {
    // すべての行への配置が完了したら、解を記録する
    if (row == n) {
        val copyState = mutableListOf<MutableList<String>>()
        for (sRow in state) {
            copyState.add(sRow.toMutableList())
        }
        res.add(copyState)
        return
    }
    // すべての列を走査
    for (col in 0..<n) {
        // このマスに対応する主対角線と副対角線を計算
        val diag1 = row - col + n - 1
        val diag2 = row + col
        // 枝刈り：そのマスの列、主対角線、副対角線にクイーンがあってはならない
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 試行：そのマスにクイーンを置く
            state[row][col] = "Q"
            diags2[diag2] = true
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
            // 次の行に配置する
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            // 戻す：そのマスを空きマスに戻す
            state[row][col] = "#"
            diags2[diag2] = false
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
        }
    }
}

/* N クイーンを解く */
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
    val cols = BooleanArray(n) // 列にクイーンがあるか記録
    val diags1 = BooleanArray(2 * n - 1) // 主対角線にクイーンがあるかを記録
    val diags2 = BooleanArray(2 * n - 1) // 副対角線にクイーンがあるかを記録
    val res = mutableListOf<MutableList<MutableList<String>>?>()

    backtrack(0, n, state, res, cols, diags1, diags2)

    return res
}

/* Driver Code */
fun main() {
    val n = 4
    val res = nQueens(n)

    println("入力された盤面の縦横は $n")
    println("クイーンの配置パターンは全部で ${res.size} 通り")
    for (state in res) {
        println("--------------------")
        for (row in state!!) {
            println(row)
        }
    }
}