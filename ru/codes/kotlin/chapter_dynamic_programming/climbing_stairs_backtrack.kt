/**
 * File: climbing_stairs_backtrack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Поиск с возвратом */
fun backtrack(
    choices: MutableList<Int>,
    state: Int,
    n: Int,
    res: MutableList<Int>
) {
    // На ступени n увеличить число способов на 1
    if (state == n)
        res[0] = res[0] + 1
    // Перебрать все варианты
    for (choice in choices) {
        // Отсечь шаги за ступень n
        if (state + choice > n) continue
        // Сделать выбор и обновить состояние
        backtrack(choices, state + choice, n, res)
        // Отменить выбор
    }
}

/* Подъём по лестнице: поиск с возвратом */
fun climbingStairsBacktrack(n: Int): Int {
    val choices = mutableListOf(1, 2) // Можно подняться на 1 или 2 ступени
    val state = 0 // Начать со ступени 0
    val res = mutableListOf<Int>()
    res.add(0) // Хранить число способов в res[0]
    backtrack(choices, state, n, res)
    return res[0]
}

/* Основная программа */
fun main() {
    val n = 9

    val res = climbingStairsBacktrack(n)
    println("Число способов подняться на лестницу из $n ступеней: $res.")
}