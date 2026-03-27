/**
 * File: subset_sum_i.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Алгоритм бэктрекинга: сумма подмножеств I */
func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
    // Если сумма подмножества равна target, записать решение
    if target == 0 {
        res.append(state)
        return
    }
    // Обойти все варианты выбора
    // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
    for i in choices.indices.dropFirst(start) {
        // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
        // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
        if target - choices[i] < 0 {
            break
        }
        // Попытка: сделать выбор и обновить target и start
        state.append(choices[i])
        // Перейти к следующему выбору
        backtrack(state: &state, target: target - choices[i], choices: choices, start: i, res: &res)
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.removeLast()
    }
}

/* Решить задачу суммы подмножеств I */
func subsetSumI(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // Состояние (подмножество)
    let nums = nums.sorted() // Отсортировать nums
    let start = 0 // Стартовая вершина обхода
    var res: [[Int]] = [] // Список результатов (список подмножеств)
    backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
    return res
}

@main
enum SubsetSumI {
    /* Driver Code */
    static func main() {
        let nums = [3, 4, 5]
        let target = 9

        let res = subsetSumI(nums: nums, target: target)

        print("Входной массив nums = \(nums), target = \(target)")
        print("Все подмножества с суммой \(target): res = \(res)")
    }
}
