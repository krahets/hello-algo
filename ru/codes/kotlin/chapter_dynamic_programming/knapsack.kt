/**
 * File: knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.max

/* Рюкзак 0-1: полный перебор */
fun knapsackDFS(
    wgt: IntArray,
    _val: IntArray,
    i: Int,
    c: Int
): Int {
    // Если все предметы уже рассмотрены или в рюкзаке не осталось вместимости, вернуть стоимость 0
    if (i == 0 || c == 0) {
        return 0
    }
    // Если вместимость рюкзака превышена, можно только выбрать вариант без добавления предмета
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, _val, i - 1, c)
    }
    // Вычислить максимальную стоимость для вариантов без помещения и с помещением предмета i
    val no = knapsackDFS(wgt, _val, i - 1, c)
    val yes = knapsackDFS(wgt, _val, i - 1, c - wgt[i - 1]) + _val[i - 1]
    // Вернуть вариант с большей стоимостью из двух возможных
    return max(no, yes)
}

/* Рюкзак 0-1: поиск с мемоизацией */
fun knapsackDFSMem(
    wgt: IntArray,
    _val: IntArray,
    mem: Array<IntArray>,
    i: Int,
    c: Int
): Int {
    // Если все предметы уже рассмотрены или в рюкзаке не осталось вместимости, вернуть стоимость 0
    if (i == 0 || c == 0) {
        return 0
    }
    // Если запись уже существует, вернуть ее напрямую
    if (mem[i][c] != -1) {
        return mem[i][c]
    }
    // Если вместимость рюкзака превышена, можно только выбрать вариант без добавления предмета
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, _val, mem, i - 1, c)
    }
    // Вычислить максимальную стоимость для вариантов без помещения и с помещением предмета i
    val no = knapsackDFSMem(wgt, _val, mem, i - 1, c)
    val yes = knapsackDFSMem(wgt, _val, mem, i - 1, c - wgt[i - 1]) + _val[i - 1]
    // Сохранить и вернуть более выгодный из двух вариантов
    mem[i][c] = max(no, yes)
    return mem[i][c]
}

/* Рюкзак 0-1: динамическое программирование */
fun knapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // Инициализировать таблицу dp
    val dp = Array(n + 1) { IntArray(cap + 1) }
    // Переход состояния
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // Если вместимость рюкзака превышена, не брать предмет i
                dp[i][c] = dp[i - 1][c]
            } else {
                // Выбрать большее из двух вариантов: не брать или взять предмет i
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
fun knapsackDPComp(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // Инициализировать таблицу dp
    val dp = IntArray(cap + 1)
    // Переход состояния
    for (i in 1..n) {
        // Обойти в обратном порядке
        for (c in cap downTo 1) {
            if (wgt[i - 1] <= c) {
                // Выбрать большее из двух вариантов: не брать или взять предмет i
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[cap]
}

/* Driver Code */
fun main() {
    val wgt = intArrayOf(10, 20, 30, 40, 50)
    val _val = intArrayOf(50, 120, 150, 210, 240)
    val cap = 50
    val n = wgt.size

    // Полный перебор
    var res = knapsackDFS(wgt, _val, n, cap)
    println("Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна $res")

    // Поиск с мемоизацией
    val mem = Array(n + 1) { IntArray(cap + 1) }
    for (row in mem) {
        row.fill(-1)
    }
    res = knapsackDFSMem(wgt, _val, mem, n, cap)
    println("Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна $res")

    // Динамическое программирование
    res = knapsackDP(wgt, _val, cap)
    println("Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна $res")

    // Динамическое программирование с оптимизацией по памяти
    res = knapsackDPComp(wgt, _val, cap)
    println("Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна $res")
}
