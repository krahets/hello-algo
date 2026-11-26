/**
 * File: permutations_i.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.permutations_i

/* Поиск с возвратом: перестановки I */
fun backtrack(
    state: MutableList<Int>,
    choices: IntArray,
    selected: BooleanArray,
    res: MutableList<MutableList<Int>?>
) {
    // Когда длина текущей перестановки равна числу элементов, сохраняем решение
    if (state.size == choices.size) {
        res.add(state.toMutableList())
        return
    }
    // Перебираем все варианты
    for (i in choices.indices) {
        val choice = choices[i]
        // Отсечение: нельзя выбирать один элемент дважды
        if (!selected[i]) {
            // Пробуем вариант и обновляем состояние
            selected[i] = true
            state.add(choice)
            // Переходим к следующему выбору
            backtrack(state, choices, selected, res)
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            selected[i] = false
            state.removeAt(state.size - 1)
        }
    }
}

/* Перестановки I */
fun permutationsI(nums: IntArray): MutableList<MutableList<Int>?> {
    val res = mutableListOf<MutableList<Int>?>()
    backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
    return res
}

/* Основная программа */
fun main() {
    val nums = intArrayOf(1, 2, 3)

    val res = permutationsI(nums)

    println("Исходный массив nums = ${nums.contentToString()}")
    println("Все перестановки res = $res")
}