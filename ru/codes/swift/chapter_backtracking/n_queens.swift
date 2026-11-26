/**
 * File: n_queens.swift
 * Created Time: 2023-05-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Поиск с возвратом: задача о n ферзях */
func backtrack(row: Int, n: Int, state: inout [[String]], res: inout [[[String]]], cols: inout [Bool], diags1: inout [Bool], diags2: inout [Bool]) {
    // Когда ферзи расставлены во всех строках, сохраняем решение
    if row == n {
        res.append(state)
        return
    }
    // Перебираем все столбцы
    for col in 0 ..< n {
        // Вычисляем индексы прямой и обратной диагоналей клетки
        let diag1 = row - col + n - 1
        let diag2 = row + col
        // Отсечение: в столбце и на обеих диагоналях клетки не должно быть ферзей
        if !cols[col] && !diags1[diag1] && !diags2[diag2] {
            // Пробуем поставить ферзя на эту клетку
            state[row][col] = "Q"
            cols[col] = true
            diags1[diag1] = true
            diags2[diag2] = true
            // Переходим к следующей строке
            backtrack(row: row + 1, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)
            // Возврат: освобождаем клетку
            state[row][col] = "#"
            cols[col] = false
            diags1[diag1] = false
            diags2[diag2] = false
        }
    }
}

/* Решение задачи о n ферзях */
func nQueens(n: Int) -> [[[String]]] {
    // Создаём доску n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
    var state = Array(repeating: Array(repeating: "#", count: n), count: n)
    var cols = Array(repeating: false, count: n) // Отмечаем столбцы, занятые ферзями
    var diags1 = Array(repeating: false, count: 2 * n - 1) // Отмечаем прямые диагонали, занятые ферзями
    var diags2 = Array(repeating: false, count: 2 * n - 1) // Отмечаем обратные диагонали, занятые ферзями
    var res: [[[String]]] = []

    backtrack(row: 0, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)

    return res
}

@main
enum NQueens {
    /* Основная программа */
    static func main() {
        let n = 4
        let res = nQueens(n: n)

        print("Длина стороны доски: \(n)")
        print("Число расстановок ферзей: \(res.count).")
        for state in res {
            print("--------------------")
            for row in state {
                print(row)
            }
        }
    }
}
