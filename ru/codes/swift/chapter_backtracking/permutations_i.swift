/**
 * File: permutations_i.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Поиск с возвратом: перестановки I */
func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
    // Когда длина текущей перестановки равна числу элементов, сохраняем решение
    if state.count == choices.count {
        res.append(state)
        return
    }
    // Перебираем все варианты
    for (i, choice) in choices.enumerated() {
        // Отсечение: нельзя выбирать один элемент дважды
        if !selected[i] {
            // Пробуем вариант и обновляем состояние
            selected[i] = true
            state.append(choice)
            // Переходим к следующему выбору
            backtrack(state: &state, choices: choices, selected: &selected, res: &res)
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            selected[i] = false
            state.removeLast()
        }
    }
}

/* Перестановки I */
func permutationsI(nums: [Int]) -> [[Int]] {
    var state: [Int] = []
    var selected = Array(repeating: false, count: nums.count)
    var res: [[Int]] = []
    backtrack(state: &state, choices: nums, selected: &selected, res: &res)
    return res
}

@main
enum PermutationsI {
    /* Основная программа */
    static func main() {
        let nums = [1, 2, 3]

        let res = permutationsI(nums: nums)

        print("Исходный массив nums = \(nums)")
        print("Все перестановки res = \(res)")
    }
}
