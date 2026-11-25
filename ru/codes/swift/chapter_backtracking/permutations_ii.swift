/**
 * File: permutations_ii.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Поиск с возвратом: перестановки II */
func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
    // Когда длина текущей перестановки равна числу элементов, сохраняем решение
    if state.count == choices.count {
        res.append(state)
        return
    }
    // Перебираем все варианты
    var duplicated: Set<Int> = []
    for (i, choice) in choices.enumerated() {
        // Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
        if !selected[i], !duplicated.contains(choice) {
            // Пробуем вариант и обновляем состояние
            duplicated.insert(choice) // Отмечаем уже выбранные значения
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

/* Перестановки II */
func permutationsII(nums: [Int]) -> [[Int]] {
    var state: [Int] = []
    var selected = Array(repeating: false, count: nums.count)
    var res: [[Int]] = []
    backtrack(state: &state, choices: nums, selected: &selected, res: &res)
    return res
}

@main
enum PermutationsII {
    /* Основная программа */
    static func main() {
        let nums = [1, 2, 3]

        let res = permutationsII(nums: nums)

        print("Исходный массив nums = \(nums)")
        print("Все перестановки res = \(res)")
    }
}
