/**
 * File: knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.max

/* Рюкзак 0–1: полный перебор */
fun knapsackDFS(
    wgt: IntArray,
    _val: IntArray,
    i: Int,
    c: Int
): Int {
    // Если предметы закончились или места не осталось, вернуть стоимость 0
    if (i == 0 || c == 0) {
        return 0
    }
    // Если предмет тяжелее допустимого, остаётся только пропустить его
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, _val, i - 1, c)
    }
    // Вычислить максимальную стоимость без предмета i и с ним
    val no = knapsackDFS(wgt, _val, i - 1, c)
    val yes = knapsackDFS(wgt, _val, i - 1, c - wgt[i - 1]) + _val[i - 1]
    // Вернуть большую из двух стоимостей
    return max(no, yes)
}

/* Рюкзак 0–1: поиск с мемоизацией */
fun knapsackDFSMem(
    wgt: IntArray,
    _val: IntArray,
    mem: Array<IntArray>,
    i: Int,
    c: Int
): Int {
    // Если предметы закончились или места не осталось, вернуть стоимость 0
    if (i == 0 || c == 0) {
        return 0
    }
    // Если результат сохранён, сразу вернуть его
    if (mem[i][c] != -1) {
        return mem[i][c]
    }
    // Если предмет тяжелее допустимого, остаётся только пропустить его
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, _val, mem, i - 1, c)
    }
    // Вычислить максимальную стоимость без предмета i и с ним
    val no = knapsackDFSMem(wgt, _val, mem, i - 1, c)
    val yes = knapsackDFSMem(wgt, _val, mem, i - 1, c - wgt[i - 1]) + _val[i - 1]
    // Сохранить и вернуть большую из двух стоимостей
    mem[i][c] = max(no, yes)
    return mem[i][c]
}

/* Рюкзак 0–1: динамическое программирование */
fun knapsackDP(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // Инициализировать таблицу dp
    val dp = Array(n + 1) { IntArray(cap + 1) }
    // Переход между состояниями
    for (i in 1..n) {
        for (c in 1..cap) {
            if (wgt[i - 1] > c) {
                // Если предмет i тяжелее допустимого, пропустить его
                dp[i][c] = dp[i - 1][c]
            } else {
                // Взять максимум из двух вариантов: без предмета i и с ним
                dp[i][c] = max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[n][cap]
}

/* Рюкзак 0–1: динамическое программирование с экономией памяти */
fun knapsackDPComp(wgt: IntArray, _val: IntArray, cap: Int): Int {
    val n = wgt.size
    // Инициализировать таблицу dp
    val dp = IntArray(cap + 1)
    // Переход между состояниями
    for (i in 1..n) {
        // Обход в обратном порядке
        for (c in cap downTo 1) {
            if (wgt[i - 1] <= c) {
                // Взять максимум из двух вариантов: без предмета i и с ним
                dp[c] = max(dp[c], dp[c - wgt[i - 1]] + _val[i - 1])
            }
        }
    }
    return dp[cap]
}

/* Основная программа */
fun main() {
    val wgt = intArrayOf(10, 20, 30, 40, 50)
    val _val = intArrayOf(50, 120, 150, 210, 240)
    val cap = 50
    val n = wgt.size

    // Полный перебор
    var res = knapsackDFS(wgt, _val, n, cap)
    println("Максимальная стоимость предметов, помещающихся в рюкзак: $res")

    // Поиск с мемоизацией
    val mem = Array(n + 1) { IntArray(cap + 1) }
    for (row in mem) {
        row.fill(-1)
    }
    res = knapsackDFSMem(wgt, _val, mem, n, cap)
    println("Максимальная стоимость предметов, помещающихся в рюкзак: $res")

    // Динамическое программирование
    res = knapsackDP(wgt, _val, cap)
    println("Максимальная стоимость предметов, помещающихся в рюкзак: $res")

    // Динамическое программирование с экономией памяти
    res = knapsackDPComp(wgt, _val, cap)
    println("Максимальная стоимость предметов, помещающихся в рюкзак: $res")
}