/**
 * File: subset_sum_i_naive.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Поиск с возвратом: сумма подмножества I */
func backtrack(state: inout [Int], target: Int, total: Int, choices: [Int], res: inout [[Int]]) {
    // Если сумма подмножества равна target, сохраняем решение
    if total == target {
        res.append(state)
        return
    }
    // Перебираем все варианты
    for i in choices.indices {
        // Отсечение: если сумма подмножества превысит target, пропускаем этот вариант
        if total + choices[i] > target {
            continue
        }
        // Пробуем вариант и обновляем сумму элементов total
        state.append(choices[i])
        // Переходим к следующему выбору
        backtrack(state: &state, target: target, total: total + choices[i], choices: choices, res: &res)
        // Возврат: отменяем выбор и восстанавливаем прежнее состояние
        state.removeLast()
    }
}

/* Задача о сумме подмножества I (с повторяющимися подмножествами) */
func subsetSumINaive(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // Состояние (подмножество)
    let total = 0 // Сумма подмножества
    var res: [[Int]] = [] // Список результатов (список подмножеств)
    backtrack(state: &state, target: target, total: total, choices: nums, res: &res)
    return res
}

@main
enum SubsetSumINaive {
    /* Основная программа */
    static func main() {
        let nums = [3, 4, 5]
        let target = 9

        let res = subsetSumINaive(nums: nums, target: target)

        print("Исходный массив nums = \(nums), target = \(target)")
        print("Все подмножества с суммой \(target): res = \(res)")
        print("Обратите внимание: результат этого метода содержит повторяющиеся множества")
    }
}
