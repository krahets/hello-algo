/**
 * File: edit_distance.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* Редакционное расстояние: полный перебор */
fun editDistanceDFS(
    s: String,
    t: String,
    i: Int,
    j: Int
): Int {
    // Если s и t пусты, вернуть 0
    if (i == 0 && j == 0) return 0
    // Если s пусто, вернуть длину t
    if (i == 0) return j
    // Если t пусто, вернуть длину s
    if (j == 0) return i
    // Если два символа равны, сразу пропустить их
    if (s[i - 1] == t[j - 1]) return editDistanceDFS(s, t, i - 1, j - 1)
    // Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
    val insert = editDistanceDFS(s, t, i, j - 1)
    val delete = editDistanceDFS(s, t, i - 1, j)
    val replace = editDistanceDFS(s, t, i - 1, j - 1)
    // Вернуть минимальное число шагов редактирования
    return min(min(insert, delete), replace) + 1
}

/* Редакционное расстояние: поиск с мемоизацией */
fun editDistanceDFSMem(
    s: String,
    t: String,
    mem: Array<IntArray>,
    i: Int,
    j: Int
): Int {
    // Если s и t пусты, вернуть 0
    if (i == 0 && j == 0) return 0
    // Если s пусто, вернуть длину t
    if (i == 0) return j
    // Если t пусто, вернуть длину s
    if (j == 0) return i
    // Если запись уже есть, сразу вернуть ее
    if (mem[i][j] != -1) return mem[i][j]
    // Если два символа равны, сразу пропустить их
    if (s[i - 1] == t[j - 1]) return editDistanceDFSMem(s, t, mem, i - 1, j - 1)
    // Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
    val insert = editDistanceDFSMem(s, t, mem, i, j - 1)
    val delete = editDistanceDFSMem(s, t, mem, i - 1, j)
    val replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1)
    // Сохранить и вернуть минимальное число шагов редактирования
    mem[i][j] = min(min(insert, delete), replace) + 1
    return mem[i][j]
}

/* Редакционное расстояние: динамическое программирование */
fun editDistanceDP(s: String, t: String): Int {
    val n = s.length
    val m = t.length
    val dp = Array(n + 1) { IntArray(m + 1) }
    // Переход состояний: первая строка и первый столбец
    for (i in 1..n) {
        dp[i][0] = i
    }
    for (j in 1..m) {
        dp[0][j] = j
    }
    // Переход состояний: остальные строки и столбцы
    for (i in 1..n) {
        for (j in 1..m) {
            if (s[i - 1] == t[j - 1]) {
                // Если два символа равны, сразу пропустить их
                dp[i][j] = dp[i - 1][j - 1]
            } else {
                // Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
                dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1
            }
        }
    }
    return dp[n][m]
}

/* Редакционное расстояние: динамическое программирование с оптимизацией памяти */
fun editDistanceDPComp(s: String, t: String): Int {
    val n = s.length
    val m = t.length
    val dp = IntArray(m + 1)
    // Переход состояний: первая строка
    for (j in 1..m) {
        dp[j] = j
    }
    // Переход состояний: остальные строки
    for (i in 1..n) {
        // Переход состояний: первый столбец
        var leftup = dp[0] // Временно сохранить dp[i-1, j-1]
        dp[0] = i
        // Переход состояний: остальные столбцы
        for (j in 1..m) {
            val temp = dp[j]
            if (s[i - 1] == t[j - 1]) {
                // Если два символа равны, сразу пропустить их
                dp[j] = leftup
            } else {
                // Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
                dp[j] = min(min(dp[j - 1], dp[j]), leftup) + 1
            }
            leftup = temp // Обновить до значения dp[i-1, j-1] для следующей итерации
        }
    }
    return dp[m]
}

/* Driver Code */
fun main() {
    val s = "bag"
    val t = "pack"
    val n = s.length
    val m = t.length

    // Полный перебор
    var res = editDistanceDFS(s, t, n, m)
    println("Чтобы преобразовать $s в $t, нужно минимум $res шагов")

    // Поиск с мемоизацией
    val mem = Array(n + 1) { IntArray(m + 1) }
    for (row in mem)
        row.fill(-1)
    res = editDistanceDFSMem(s, t, mem, n, m)
    println("Чтобы преобразовать $s в $t, нужно минимум $res шагов")

    // Динамическое программирование
    res = editDistanceDP(s, t)
    println("Чтобы преобразовать $s в $t, нужно минимум $res шагов")

    // Динамическое программирование с оптимизацией памяти
    res = editDistanceDPComp(s, t)
    println("Чтобы преобразовать $s в $t, нужно минимум $res шагов")
}