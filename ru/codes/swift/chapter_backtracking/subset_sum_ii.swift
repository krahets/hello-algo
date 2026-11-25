/**
 * File: subset_sum_ii.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Поиск с возвратом: сумма подмножества II */
func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
    // Если сумма подмножества равна target, сохраняем решение
    if target == 0 {
        res.append(state)
        return
    }
    // Перебираем все варианты
    // Отсечение 2: начинаем перебор с start, чтобы не получать одинаковые подмножества
    // Отсечение 3: начинаем перебор с start, чтобы не брать один и тот же элемент дважды
    for i in choices.indices.dropFirst(start) {
        // Отсечение 1: если сумма подмножества превышает target, выходим из цикла
        // Массив отсортирован: следующие элементы не меньше текущего, поэтому сумма тоже превысит target
        if target - choices[i] < 0 {
            break
        }
        // Отсечение 4: если значение совпало с уже проверенным на этом шаге соседом слева, пропускаем повторную ветвь
        if i > start, choices[i] == choices[i - 1] {
            continue
        }
        // Пробуем вариант и обновляем target и start
        state.append(choices[i])
        // Переходим к следующему выбору
        backtrack(state: &state, target: target - choices[i], choices: choices, start: i + 1, res: &res)
        // Возврат: отменяем выбор и восстанавливаем прежнее состояние
        state.removeLast()
    }
}

/* Задача о сумме подмножества II */
func subsetSumII(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // Состояние (подмножество)
    let nums = nums.sorted() // Сортируем nums
    let start = 0 // Начальная позиция перебора
    var res: [[Int]] = [] // Список результатов (список подмножеств)
    backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
    return res
}

@main
enum SubsetSumII {
    /* Основная программа */
    static func main() {
        let nums = [4, 4, 5]
        let target = 9

        let res = subsetSumII(nums: nums, target: target)

        print("Исходный массив nums = \(nums), target = \(target)")
        print("Все подмножества с суммой \(target): res = \(res)")
    }
}
