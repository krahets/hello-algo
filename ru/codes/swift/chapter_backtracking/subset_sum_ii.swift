/**
 * File: subset_sum_ii.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Алгоритм бэктрекинга: сумма подмножеств II */
func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
    // Если сумма подмножества равна target, записать решение
    if target == 0 {
        res.append(state)
        return
    }
    // Обойти все варианты выбора
    // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
    // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
    for i in choices.indices.dropFirst(start) {
        // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
        // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
        if target - choices[i] < 0 {
            break
        }
        // Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
        if i > start, choices[i] == choices[i - 1] {
            continue
        }
        // Попытка: сделать выбор и обновить target и start
        state.append(choices[i])
        // Перейти к следующему выбору
        backtrack(state: &state, target: target - choices[i], choices: choices, start: i + 1, res: &res)
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.removeLast()
    }
}

/* Решить задачу суммы подмножеств II */
func subsetSumII(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // Состояние (подмножество)
    let nums = nums.sorted() // Отсортировать nums
    let start = 0 // Стартовая вершина обхода
    var res: [[Int]] = [] // Список результатов (список подмножеств)
    backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
    return res
}

@main
enum SubsetSumII {
    /* Driver Code */
    static func main() {
        let nums = [4, 4, 5]
        let target = 9

        let res = subsetSumII(nums: nums, target: target)

        print("Входной массив nums = \(nums), target = \(target)")
        print("Все подмножества с суммой \(target): res = \(res)")
    }
}
