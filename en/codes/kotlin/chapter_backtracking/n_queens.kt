/**
 * File: n_queens.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.n_queens

/* Backtracking algorithm: n queens */
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
        // Calculate the main and minor diagonals corresponding to the cell
        val diag1 = row - col + n - 1
        val diag2 = row + col
        // Pruning: do not allow queens on the column, main diagonal, or minor diagonal of the cell
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Attempt: place the queen in the cell
            state[row][col] = "Q"
            diags2[diag2] = true
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
            // Place the next row
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            // Retract: restore the cell to an empty spot
            state[row][col] = "#"
            diags2[diag2] = false
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
        }
    }
}

/* Solve n queens */
fun nQueens(n: Int): MutableList<MutableList<MutableList<String>>?> {
    // Initialize an n*n size chessboard, where 'Q' represents the queen and '#' represents an empty spot
    val state = mutableListOf<MutableList<String>>()
    for (i in 0..<n) {
        val row = mutableListOf<String>()
        for (j in 0..<n) {
            row.add("#")
        }
        state.add(row)
    }
    val cols = BooleanArray(n) // Record columns with queens
    val diags1 = BooleanArray(2 * n - 1) // Record main diagonals with queens
    val diags2 = BooleanArray(2 * n - 1) // Record minor diagonals with queens
    val res = mutableListOf<MutableList<MutableList<String>>?>()

    backtrack(0, n, state, res, cols, diags1, diags2)

    return res
}

/* Driver Code */
fun main() {
    val n = 4
    val res = nQueens(n)

    println("Input chessboard dimensions as $n")
    println("Total of ${res.size} queen placement solutions")
    for (state in res) {
        println("--------------------")
        for (row in state!!) {
            println(row)
        }
    }
}