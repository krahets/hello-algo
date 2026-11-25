/**
 * File: permutations_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.permutations_ii

/* Поиск с возвратом: перестановки II */
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
    val duplicated = HashSet<Int>()
    for (i in choices.indices) {
        val choice = choices[i]
        // Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
        if (!selected[i] && !duplicated.contains(choice)) {
            // Пробуем вариант и обновляем состояние
            duplicated.add(choice) // Отмечаем уже выбранные значения
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

/* Перестановки II */
fun permutationsII(nums: IntArray): MutableList<MutableList<Int>?> {
    val res = mutableListOf<MutableList<Int>?>()
    backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
    return res
}

/* Основная программа */
fun main() {
    val nums = intArrayOf(1, 2, 2)
    val res = permutationsII(nums)

    println("Исходный массив nums = ${nums.contentToString()}")
    println("Все перестановки res = $res")
}