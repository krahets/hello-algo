/**
 * File: subset_sum_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_ii

/* Алгоритм бэктрекинга: сумма подмножеств II */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    choices: IntArray,
    start: Int,
    res: MutableList<MutableList<Int>?>
) {
    // Если сумма подмножества равна target, записать решение
    if (target == 0) {
        res.add(state.toMutableList())
        return
    }
    // Обойти все варианты выбора
    // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
    // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
    for (i in start..<choices.size) {
        // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
        // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
        if (target - choices[i] < 0) {
            break
        }
        // Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
        if (i > start && choices[i] == choices[i - 1]) {
            continue
        }
        // Попытка: сделать выбор и обновить target и start
        state.add(choices[i])
        // Перейти к следующему выбору
        backtrack(state, target - choices[i], choices, i + 1, res)
        // Откат: отменить выбор и восстановить предыдущее состояние
        state.removeAt(state.size - 1)
    }
}

/* Решить задачу суммы подмножеств II */
fun subsetSumII(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // Состояние (подмножество)
    nums.sort() // Отсортировать nums
    val start = 0 // Стартовая вершина обхода
    val res = mutableListOf<MutableList<Int>?>() // Список результатов (список подмножеств)
    backtrack(state, target, nums, start, res)
    return res
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 4, 5)
    val target = 9
    val res = subsetSumII(nums, target)

    println("Входной массив nums = ${nums.contentToString()}, target = $target")
    println("Все подмножества с суммой $target: res = $res")
}