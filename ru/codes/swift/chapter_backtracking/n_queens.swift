/**
 * File: n_queens.swift
 * Created Time: 2023-05-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Алгоритм бэктрекинга: n ферзей */
func backtrack(row: Int, n: Int, state: inout [[String]], res: inout [[[String]]], cols: inout [Bool], diags1: inout [Bool], diags2: inout [Bool]) {
    // Когда все строки уже обработаны, записать решение
    if row == n {
        res.append(state)
        return
    }
    // Обойти все столбцы
    for col in 0 ..< n {
        // Вычислить главную и побочную диагонали, соответствующие этой клетке
        let diag1 = row - col + n - 1
        let diag2 = row + col
        // Отсечение: в столбце, главной диагонали и побочной диагонали этой клетки не должно быть ферзей
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // Попытка: поставить ферзя в эту клетку
            state[row][col] = "Q"
            cols[col] = true
            diags1[diag1] = true
            diags2[diag2] = true
            // Перейти к размещению следующей строки
            backtrack(row: row + 1, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)
            // Откат: восстановить эту клетку как пустую
            state[row][col] = "#"
            cols[col] = false
            diags1[diag1] = false
            diags2[diag2] = false
        }
    }
}

/* Решить задачу о n ферзях */
func nQueens(n: Int) -> [[[String]]] {
    // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
    var state = Array(repeating: Array(repeating: "#", count: n), count: n)
    var cols = Array(repeating: false, count: n) // Отмечать, есть ли ферзь в столбце
    var diags1 = Array(repeating: false, count: 2 * n - 1) // Отмечать наличие ферзя на главной диагонали
    var diags2 = Array(repeating: false, count: 2 * n - 1) // Отмечать наличие ферзя на побочной диагонали
    var res: [[[String]]] = []

    backtrack(row: 0, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)

    return res
}

@main
enum NQueens {
    /* Driver Code */
    static func main() {
        let n = 4
        let res = nQueens(n: n)

        print("Размер входной доски = \(n)")
        print("Количество способов расстановки ферзей: \(res.count)")
        for state in res {
            print("--------------------")
            for row in state {
                print(row)
            }
        }
    }
}
