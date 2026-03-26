/**
 * File: subset_sum_ii.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Алгоритм бэктрекинга: сумма подмножества II */
func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
    // Если сумма подмножества равна target, записать решение
    if target == 0 {
        res.append(state)
        return
    }
    // Обойти все варианты выбора
    // Отсечение 2: начинать обход с start, чтобы избежать генерации дублирующихся подмножеств
    // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
    for i in choices.indices.dropFirst(start) {
        // Отсечение 1: если сумма подмножества превышает target, сразу завершить цикл
        // Это связано с тем, что массив уже отсортирован, последующие элементы больше, поэтому сумма подмножества обязательно превысит target
        if target - choices[i] < 0 {
            break
        }
        // Отсечение 4: если этот элемент равен элементу слева, значит данная ветвь поиска дублируется, ее нужно сразу пропустить
        if i > start, choices[i] == choices[i - 1] {
            continue
        }
        // Попытка: сделать выбор и обновить target, start
        state.append(choices[i])
        // Перейти к следующему варианту выбора
        backtrack(state: &state, target: target - choices[i], choices: choices, start: i + 1, res: &res)
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.removeLast()
    }
}

/* Решить задачу суммы подмножества II */
func subsetSumII(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // Состояние (подмножество)
    let nums = nums.sorted() // Отсортировать nums
    let start = 0 // Обход начальной вершины
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

        print("Входмассив nums = \(nums), target = \(target)")
        print("Все подмножества с суммой \(target) res = \(res)")
    }
}
