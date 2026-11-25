/**
 * File: climbing_stairs_backtrack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Поиск с возвратом */
func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
    // На ступени n увеличить число способов на 1
    if state == n {
        res[0] += 1
    }
    // Перебрать все варианты
    for choice in choices {
        // Отсечь шаги за ступень n
        if state + choice > n {
            continue
        }
        // Сделать выбор и обновить состояние
        backtrack(choices: choices, state: state + choice, n: n, res: &res)
        // Отменить выбор
    }
}

/* Подъём по лестнице: поиск с возвратом */
func climbingStairsBacktrack(n: Int) -> Int {
    let choices = [1, 2] // Можно подняться на 1 или 2 ступени
    let state = 0 // Начать со ступени 0
    var res: [Int] = []
    res.append(0) // Хранить число способов в res[0]
    backtrack(choices: choices, state: state, n: n, res: &res)
    return res[0]
}

@main
enum ClimbingStairsBacktrack {
    /* Основная программа */
    static func main() {
        let n = 9

        let res = climbingStairsBacktrack(n: n)
        print("Число способов подняться на лестницу из \(n) ступеней: \(res).")
    }
}
