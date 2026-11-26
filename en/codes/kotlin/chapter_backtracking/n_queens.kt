/**
 * File: n_queens.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.n_queens

/* Backtracking: n-queens */
fun backtrack(
    row: Int,
    n: Int,
    state: MutableList<MutableList<String>>,
    res: MutableList<MutableList<MutableList<String>>?>,
    cols: BooleanArray,
    diags1: BooleanArray,
    diags2: BooleanArray
) {
    // Record the solution once every row has a queen
    if (row == n) {
        val copyState = mutableListOf<MutableList<String>>()
        for (sRow in state) {
            copyState.add(sRow.toMutableList())
        }
        res.add(copyState)
        return
    }
    // Try each column
    for (col in 0..<n) {
        // Find the two diagonals through this square
        val diag1 = row - col + n - 1
        val diag2 = row + col
        // Prune if the column or either diagonal already has a queen
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Try placing a queen on this square
            state[row][col] = "Q"
            diags2[diag2] = true
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
            // Place a queen in the next row
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            // Backtrack: clear this square
            state[row][col] = "#"
            diags2[diag2] = false
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
        }
    }
}

/* Solve the n-queens problem */
fun nQueens(n: Int): MutableList<MutableList<MutableList<String>>?> {
    // Set up an n-by-n board with 'Q' for a queen and '#' for an empty square
    val state = mutableListOf<MutableList<String>>()
    for (i in 0..<n) {
        val row = mutableListOf<String>()
        for (j in 0..<n) {
            row.add("#")
        }
        state.add(row)
    }
    val cols = BooleanArray(n) // Track occupied columns
    val diags1 = BooleanArray(2 * n - 1) // Track occupied main diagonals
    val diags2 = BooleanArray(2 * n - 1) // Track occupied secondary diagonals
    val res = mutableListOf<MutableList<MutableList<String>>?>()

    backtrack(0, n, state, res, cols, diags1, diags2)

    return res
}

/* Driver code */
fun main() {
    val n = 4
    val res = nQueens(n)

    println("Board side length: $n")
    println("Found ${res.size} queen arrangements")
    for (state in res) {
        println("--------------------")
        for (row in state!!) {
            println(row)
        }
    }
}