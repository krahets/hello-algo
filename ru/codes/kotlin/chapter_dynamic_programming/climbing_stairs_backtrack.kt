/**
 * File: climbing_stairs_backtrack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Бэктрекинг */
fun backtrack(
    choices: MutableList<Int>,
    state: Int,
    n: Int,
    res: MutableList<Int>
) {
    // Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
    if (state == n)
        res[0] = res[0] + 1
    // Перебор всех вариантов выбора
    for (choice in choices) {
        // Отсечение: нельзя выходить за n-ю ступень
        if (state + choice > n) continue
        // Попытка: сделать выбор и обновить состояние
        backtrack(choices, state + choice, n, res)
        // Откат
    }
}

/* Подъем по лестнице: бэктрекинг */
fun climbingStairsBacktrack(n: Int): Int {
    val choices = mutableListOf(1, 2) // Можно подняться на 1 или 2 ступени
    val state = 0 // Начать подъем с 0-й ступени
    val res = mutableListOf<Int>()
    res.add(0) // Использовать res[0] для хранения числа решений
    backtrack(choices, state, n, res)
    return res[0]
}

/* Driver Code */
fun main() {
    val n = 9

    val res = climbingStairsBacktrack(n)
    println("Количество способов подняться по лестнице из $n ступеней = $res")
}