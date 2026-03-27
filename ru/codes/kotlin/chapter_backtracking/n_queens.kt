/**
 * File: n_queens.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.n_queens

/* Алгоритм бэктрекинга: n ферзей */
fun backtrack(
    row: Int,
    n: Int,
    state: MutableList<MutableList<String>>,
    res: MutableList<MutableList<MutableList<String>>?>,
    cols: BooleanArray,
    diags1: BooleanArray,
    diags2: BooleanArray
) {
    // Когда все строки заполнены, записать решение
    if (row == n) {
        val copyState = mutableListOf<MutableList<String>>()
        for (sRow in state) {
            copyState.add(sRow.toMutableList())
        }
        res.add(copyState)
        return
    }
    // Обойти все столбцы
    for (col in 0..<n) {
        // Вычислить главную и побочную диагонали, соответствующие этой клетке
        val diag1 = row - col + n - 1
        val diag2 = row + col
        // Отсечение: не допускается наличие ферзя в этом столбце, на главной диагонали или на побочной диагонали
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Попытка: разместить ферзя в этой клетке
            state[row][col] = "Q"
            diags2[diag2] = true
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
            // Перейти к размещению следующей строки
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            // Откат: восстановить эту клетку в пустое состояние
            state[row][col] = "#"
            diags2[diag2] = false
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
        }
    }
}

/* Решить задачу n ферзей */
fun nQueens(n: Int): MutableList<MutableList<MutableList<String>>?> {
    // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' обозначает пустую клетку
    val state = mutableListOf<MutableList<String>>()
    for (i in 0..<n) {
        val row = mutableListOf<String>()
        for (j in 0..<n) {
            row.add("#")
        }
        state.add(row)
    }
    val cols = BooleanArray(n) // Записать, есть ли ферзь в столбце
    val diags1 = BooleanArray(2 * n - 1) // Записать, есть ли ферзь на главной диагонали
    val diags2 = BooleanArray(2 * n - 1) // Записать, есть ли ферзь на побочной диагонали
    val res = mutableListOf<MutableList<MutableList<String>>?>()

    backtrack(0, n, state, res, cols, diags1, diags2)

    return res
}

/* Driver Code */
fun main() {
    val n = 4
    val res = nQueens(n)

    println("Входдоскаразмерравно $n")
    println("Количество способов расстановки ферзей: ${res.size}")
    for (state in res) {
        println("--------------------")
        for (row in state!!) {
            println(row)
        }
    }
}
