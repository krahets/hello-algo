/**
 * File: subset_sum_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_ii

/* Поиск с возвратом: сумма подмножества II */
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
    // Отсечение 3: начинаем перебор с start, чтобы не брать один и тот же элемент дважды
    for (i in start..<choices.size) {
        // Отсечение 1: если сумма подмножества превышает target, выходим из цикла
        // Массив отсортирован: следующие элементы не меньше текущего, поэтому сумма тоже превысит target
        if (target - choices[i] < 0) {
            break
        }
        // Отсечение 4: если значение совпало с уже проверенным на этом шаге соседом слева, пропускаем повторную ветвь
        if (i > start && choices[i] == choices[i - 1]) {
            continue
        }
        // Пробуем вариант и обновляем target и start
        state.add(choices[i])
        // Переходим к следующему выбору
        backtrack(state, target - choices[i], choices, i + 1, res)
        // Возврат: отменяем выбор и восстанавливаем прежнее состояние
        state.removeAt(state.size - 1)
    }
}

/* Задача о сумме подмножества II */
fun subsetSumII(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // Состояние (подмножество)
    nums.sort() // Сортируем nums
    val start = 0 // Начальная позиция перебора
    val res = mutableListOf<MutableList<Int>?>() // Список результатов (список подмножеств)
    backtrack(state, target, nums, start, res)
    return res
}

/* Основная программа */
fun main() {
    val nums = intArrayOf(4, 4, 5)
    val target = 9
    val res = subsetSumII(nums, target)

    println("Исходный массив nums = ${nums.contentToString()}, target = $target")
    println("Все подмножества с суммой $target: res = $res")
}