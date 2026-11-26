/**
 * File: subset_sum_i_native.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_i_naive

/* Поиск с возвратом: сумма подмножества I */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    total: Int,
    choices: IntArray,
    res: MutableList<MutableList<Int>?>
) {
    // Если сумма подмножества равна target, сохраняем решение
    if (total == target) {
        res.add(state.toMutableList())
        return
    }
    // Перебираем все варианты
    for (i in choices.indices) {
        // Отсечение: если сумма подмножества превысит target, пропускаем этот вариант
        if (total + choices[i] > target) {
            continue
        }
        // Пробуем вариант и обновляем сумму элементов total
        state.add(choices[i])
        // Переходим к следующему выбору
        backtrack(state, target, total + choices[i], choices, res)
        // Возврат: отменяем выбор и восстанавливаем прежнее состояние
        state.removeAt(state.size - 1)
    }
}

/* Задача о сумме подмножества I (с повторяющимися подмножествами) */
fun subsetSumINaive(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // Состояние (подмножество)
    val total = 0 // Сумма подмножества
    val res = mutableListOf<MutableList<Int>?>() // Список результатов (список подмножеств)
    backtrack(state, target, total, nums, res)
    return res
}

/* Основная программа */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9
    val res = subsetSumINaive(nums, target)

    println("Исходный массив nums = ${nums.contentToString()}, target = $target")
    println("Все подмножества с суммой $target: res = $res")
    println("Обратите внимание: результат этого метода содержит повторяющиеся множества")
}