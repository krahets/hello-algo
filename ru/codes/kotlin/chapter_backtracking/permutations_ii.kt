/**
 * File: permutations_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.permutations_ii

/* Алгоритм бэктрекинга: все перестановки II */
fun backtrack(
    state: MutableList<Int>,
    choices: IntArray,
    selected: BooleanArray,
    res: MutableList<MutableList<Int>?>
) {
    // Когда длина состояния равна числу элементов, записать решение
    if (state.size == choices.size) {
        res.add(state.toMutableList())
        return
    }
    // Перебор всех вариантов выбора
    val duplicated = HashSet<Int>()
    for (i in choices.indices) {
        val choice = choices[i]
        // Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
        if (!selected[i] && !duplicated.contains(choice)) {
            // Попытка: сделать выбор и обновить состояние
            duplicated.add(choice) // Записать значения уже выбранных элементов
            selected[i] = true
            state.add(choice)
            // Перейти к следующему выбору
            backtrack(state, choices, selected, res)
            // Откат: отменить выбор и восстановить предыдущее состояние
            selected[i] = false
            state.removeAt(state.size - 1)
        }
    }
}

/* Все перестановки II */
fun permutationsII(nums: IntArray): MutableList<MutableList<Int>?> {
    val res = mutableListOf<MutableList<Int>?>()
    backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
    return res
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(1, 2, 2)
    val res = permutationsII(nums)

    println("Входной массив nums = ${nums.contentToString()}")
    println("Все перестановки res = $res")
}