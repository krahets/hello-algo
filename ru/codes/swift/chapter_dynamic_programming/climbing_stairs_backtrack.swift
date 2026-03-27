/**
 * File: climbing_stairs_backtrack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Бэктрекинг */
func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
    // Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
    if state == n {
        res[0] += 1
    }
    // Перебор всех вариантов выбора
    for choice in choices {
        // Отсечение: нельзя выходить за n-ю ступень
        if state + choice > n {
            continue
        }
        // Попытка: сделать выбор и обновить состояние
        backtrack(choices: choices, state: state + choice, n: n, res: &res)
        // Откат
    }
}

/* Подъем по лестнице: бэктрекинг */
func climbingStairsBacktrack(n: Int) -> Int {
    let choices = [1, 2] // Можно подняться на 1 или 2 ступени
    let state = 0 // Начать подъем с 0-й ступени
    var res: [Int] = []
    res.append(0) // Использовать res[0] для хранения числа решений
    backtrack(choices: choices, state: state, n: n, res: &res)
    return res[0]
}

@main
enum ClimbingStairsBacktrack {
    /* Driver Code */
    static func main() {
        let n = 9

        let res = climbingStairsBacktrack(n: n)
        print("Количество способов подняться по лестнице из \(n) ступеней = \(res)")
    }
}
