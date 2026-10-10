/**
 * File: n_queens.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.n_queens

/* Backtracking algorithm: N queens */
fun backtrack(
    row: Int,
    n: Int,
    state: MutableList<MutableList<String>>,
    res: MutableList<MutableList<MutableList<String>>?>,
    cols: BooleanArray,
    diags1: BooleanArray,
    diags2: BooleanArray
) {
    // When all rows are placed, record the solution
    if (row == n) {
        val copyState = mutableListOf<MutableList<String>>()
        for (sRow in state) {
            copyState.add(sRow.toMutableList())
        }
        res.add(copyState)
        return
    }
    // Traverse all columns
    for (col in 0..<n) {
        // Calculate the main diagonal and anti-diagonal corresponding to this cell
        val diag1 = row - col + n - 1
        val diag2 = row + col
        // Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Attempt: place the queen in this cell
            state[row][col] = "Q"
            diags2[diag2] = true
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
            // Place the next row
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            // Backtrack: restore this cell to an empty cell
            state[row][col] = "#"
            diags2[diag2] = false
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
        }
    }
}

/* Solve N queens */
fun nQueens(n: Int): MutableList<MutableList<MutableList<String>>?> {
    // Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
    val state = mutableListOf<MutableList<String>>()
    for (i in 0..<n) {
        val row = mutableListOf<String>()
        for (j in 0..<n) {
            row.add("#")
        }
        state.add(row)
    }
    val cols = BooleanArray(n) // Record whether there is a queen in the column
    val diags1 = BooleanArray(2 * n - 1) // Record whether there is a queen on the main diagonal
    val diags2 = BooleanArray(2 * n - 1) // Record whether there is a queen on the anti-diagonal
    val res = mutableListOf<MutableList<MutableList<String>>?>()

    backtrack(0, n, state, res, cols, diags1, diags2)

    return res
}

/* Driver Code */
fun main() {
    val n = 4
    val res = nQueens(n)

    println("Input board size is $n")
    println("Total queen placement solutions: ${res.size}")
    for (state in res) {
        println("--------------------")
        for (row in state!!) {
            println(row)
        }
    }
}