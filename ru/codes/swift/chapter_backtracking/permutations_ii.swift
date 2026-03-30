/**
 * File: permutations_ii.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Алгоритм бэктрекинга: все перестановки II */
func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
    // Когда длина состояния равна числу элементов, записать решение
    if state.count == choices.count {
        res.append(state)
        return
    }
    // Перебор всех вариантов выбора
    var duplicated: Set<Int> = []
    for (i, choice) in choices.enumerated() {
        // Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
        if !selected[i], !duplicated.contains(choice) {
            // Попытка: сделать выбор и обновить состояние
            duplicated.insert(choice) // Записать значения уже выбранных элементов
            selected[i] = true
            state.append(choice)
            // Перейти к следующему выбору
            backtrack(state: &state, choices: choices, selected: &selected, res: &res)
            // Откат: отменить выбор и восстановить предыдущее состояние
            selected[i] = false
            state.removeLast()
        }
    }
}

/* Все перестановки II */
func permutationsII(nums: [Int]) -> [[Int]] {
    var state: [Int] = []
    var selected = Array(repeating: false, count: nums.count)
    var res: [[Int]] = []
    backtrack(state: &state, choices: nums, selected: &selected, res: &res)
    return res
}

@main
enum PermutationsII {
    /* Driver Code */
    static func main() {
        let nums = [1, 2, 3]

        let res = permutationsII(nums: nums)

        print("Входной массив nums = \(nums)")
        print("Все перестановки res = \(res)")
    }
}
