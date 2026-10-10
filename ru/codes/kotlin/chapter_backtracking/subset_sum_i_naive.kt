/**
 * File: subset_sum_i_native.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_i_naive

/* Алгоритм бэктрекинга: сумма подмножеств I */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    total: Int,
    choices: IntArray,
    res: MutableList<MutableList<Int>?>
) {
    // Если сумма подмножества равна target, записать решение
    if (total == target) {
        res.add(state.toMutableList())
        return
    }
    // Перебор всех вариантов выбора
    for (i in choices.indices) {
        // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
        if (total + choices[i] > target) {
            continue
        }
        // Попытка: сделать выбор и обновить элемент и total
        state.add(choices[i])
        // Перейти к следующему выбору
        backtrack(state, target, total + choices[i], choices, res)
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.removeAt(state.size - 1)
    }
}

/* Решить задачу суммы подмножеств I (с повторяющимися подмножествами) */
fun subsetSumINaive(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // Состояние (подмножество)
    val total = 0 // Сумма подмножеств
    val res = mutableListOf<MutableList<Int>?>() // Список результатов (список подмножеств)
    backtrack(state, target, total, nums, res)
    return res
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9
    val res = subsetSumINaive(nums, target)

    println("Входной массив nums = ${nums.contentToString()}, target = $target")
    println("Все подмножества с суммой $target: res = $res")
    println("Обратите внимание: результат этого метода содержит повторяющиеся множества")
}