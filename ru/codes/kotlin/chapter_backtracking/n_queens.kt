/**
 * File: n_queens.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.n_queens

/* Поиск с возвратом: задача о n ферзях */
fun backtrack(
    row: Int,
    n: Int,
    state: MutableList<MutableList<String>>,
    res: MutableList<MutableList<MutableList<String>>?>,
    cols: BooleanArray,
    diags1: BooleanArray,
    diags2: BooleanArray
) {
    // Когда ферзи расставлены во всех строках, сохраняем решение
    if (row == n) {
        val copyState = mutableListOf<MutableList<String>>()
        for (sRow in state) {
            copyState.add(sRow.toMutableList())
        }
        res.add(copyState)
        return
    }
    // Перебираем все столбцы
    for (col in 0..<n) {
        // Вычисляем индексы прямой и обратной диагоналей клетки
        val diag1 = row - col + n - 1
        val diag2 = row + col
        // Отсечение: в столбце и на обеих диагоналях клетки не должно быть ферзей
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Пробуем поставить ферзя на эту клетку
            state[row][col] = "Q"
            diags2[diag2] = true
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
            // Переходим к следующей строке
            backtrack(row + 1, n, state, res, cols, diags1, diags2)
            // Возврат: освобождаем клетку
            state[row][col] = "#"
            diags2[diag2] = false
            diags1[diag1] = diags2[diag2]
            cols[col] = diags1[diag1]
        }
    }
}

/* Решение задачи о n ферзях */
fun nQueens(n: Int): MutableList<MutableList<MutableList<String>>?> {
    // Создаём доску n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
    val state = mutableListOf<MutableList<String>>()
    for (i in 0..<n) {
        val row = mutableListOf<String>()
        for (j in 0..<n) {
            row.add("#")
        }
        state.add(row)
    }
    val cols = BooleanArray(n) // Отмечаем столбцы, занятые ферзями
    val diags1 = BooleanArray(2 * n - 1) // Отмечаем прямые диагонали, занятые ферзями
    val diags2 = BooleanArray(2 * n - 1) // Отмечаем обратные диагонали, занятые ферзями
    val res = mutableListOf<MutableList<MutableList<String>>?>()

    backtrack(0, n, state, res, cols, diags1, diags2)

    return res
}

/* Основная программа */
fun main() {
    val n = 4
    val res = nQueens(n)

    println("Длина стороны доски: $n")
    println("Число расстановок ферзей: ${res.size}.")
    for (state in res) {
        println("--------------------")
        for (row in state!!) {
            println(row)
        }
    }
}