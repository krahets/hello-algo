/**
 * File: subset_sum_i_naive.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Алгоритм бэктрекинга: сумма подмножеств I */
func backtrack(state: inout [Int], target: Int, total: Int, choices: [Int], res: inout [[Int]]) {
    // Если сумма подмножества равна target, записать решение
    if total == target {
        res.append(state)
        return
    }
    // Перебор всех вариантов выбора
    for i in choices.indices {
        // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
        if total + choices[i] > target {
            continue
        }
        // Попытка: сделать выбор и обновить элемент и total
        state.append(choices[i])
        // Перейти к следующему выбору
        backtrack(state: &state, target: target, total: total + choices[i], choices: choices, res: &res)
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.removeLast()
    }
}

/* Решить задачу суммы подмножеств I (с повторяющимися подмножествами) */
func subsetSumINaive(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // Состояние (подмножество)
    let total = 0 // Сумма подмножеств
    var res: [[Int]] = [] // Список результатов (список подмножеств)
    backtrack(state: &state, target: target, total: total, choices: nums, res: &res)
    return res
}

@main
enum SubsetSumINaive {
    /* Driver Code */
    static func main() {
        let nums = [3, 4, 5]
        let target = 9

        let res = subsetSumINaive(nums: nums, target: target)

        print("Входной массив nums = \(nums), target = \(target)")
        print("Все подмножества с суммой \(target): res = \(res)")
        print("Обратите внимание: результат этого метода содержит повторяющиеся множества")
    }
}
