/**
 * File: subset_sum_i.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_i

/* Поиск с возвратом: сумма подмножества I */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    choices: IntArray,
    start: Int,
    res: MutableList<MutableList<Int>?>
) {
    // Если сумма подмножества равна target, сохраняем решение
    if (target == 0) {
        res.add(state.toMutableList())
        return
    }
    // Перебираем все варианты
    // Отсечение 2: начинаем перебор с start, чтобы не получать одинаковые подмножества
    for (i in start..<choices.size) {
        // Отсечение 1: если сумма подмножества превышает target, выходим из цикла
        // Массив отсортирован: следующие элементы не меньше текущего, поэтому сумма тоже превысит target
        if (target - choices[i] < 0) {
            break
        }
        // Пробуем вариант и обновляем target и start
        state.add(choices[i])
        // Переходим к следующему выбору
        backtrack(state, target - choices[i], choices, i, res)
        // Возврат: отменяем выбор и восстанавливаем прежнее состояние
        state.removeAt(state.size - 1)
    }
}

/* Задача о сумме подмножества I */
fun subsetSumI(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // Состояние (подмножество)
    nums.sort() // Сортируем nums
    val start = 0 // Начальная позиция перебора
    val res = mutableListOf<MutableList<Int>?>() // Список результатов (список подмножеств)
    backtrack(state, target, nums, start, res)
    return res
}

/* Основная программа */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9

    val res = subsetSumI(nums, target)

    println("Исходный массив nums = ${nums.contentToString()}, target = $target")
    println("Все подмножества с суммой $target: res = $res")
}