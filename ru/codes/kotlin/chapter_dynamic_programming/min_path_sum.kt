/**
 * File: min_path_sum.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

import kotlin.math.min

/* Минимальная сумма пути: полный перебор */
fun minPathSumDFS(grid: Array<IntArray>, i: Int, j: Int): Int {
    // Если это верхняя левая ячейка, завершить поиск
    if (i == 0 && j == 0) {
        return grid[0][0]
    }
    // Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
    if (i < 0 || j < 0) {
        return Int.MAX_VALUE
    }
    // Вычислить минимальную стоимость пути из левого верхнего угла до (i-1, j) и (i, j-1)
    val up = minPathSumDFS(grid, i - 1, j)
    val left = minPathSumDFS(grid, i, j - 1)
    // Вернуть минимальную стоимость пути из левого верхнего угла до (i, j)
    return min(left, up) + grid[i][j]
}

/* Минимальная сумма пути: поиск с мемоизацией */
fun minPathSumDFSMem(
    grid: Array<IntArray>,
    mem: Array<IntArray>,
    i: Int,
    j: Int
): Int {
    // Если это верхняя левая ячейка, завершить поиск
    if (i == 0 && j == 0) {
        return grid[0][0]
    }
    // Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
    if (i < 0 || j < 0) {
        return Int.MAX_VALUE
    }
    // Если запись уже есть, вернуть сразу
    if (mem[i][j] != -1) {
        return mem[i][j]
    }
    // Минимальная стоимость пути для левой и верхней ячеек
    val up = minPathSumDFSMem(grid, mem, i - 1, j)
    val left = minPathSumDFSMem(grid, mem, i, j - 1)
    // Сохранить и вернуть минимальную стоимость пути из левого верхнего угла до (i, j)
    mem[i][j] = min(left, up) + grid[i][j]
    return mem[i][j]
}

/* Минимальная сумма пути: динамическое программирование */
fun minPathSumDP(grid: Array<IntArray>): Int {
    val n = grid.size
    val m = grid[0].size
    // Инициализация таблицы dp
    val dp = Array(n) { IntArray(m) }
    dp[0][0] = grid[0][0]
    // Переход состояний: первая строка
    for (j in 1..<m) {
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    }
    // Переход состояний: первый столбец
    for (i in 1..<n) {
        dp[i][0] = dp[i - 1][0] + grid[i][0]
    }
    // Переход состояний: остальные строки и столбцы
    for (i in 1..<n) {
        for (j in 1..<m) {
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
        }
    }
    return dp[n - 1][m - 1]
}

/* Минимальная сумма пути: динамическое программирование с оптимизацией памяти */
fun minPathSumDPComp(grid: Array<IntArray>): Int {
    val n = grid.size
    val m = grid[0].size
    // Инициализация таблицы dp
    val dp = IntArray(m)
    // Переход состояний: первая строка
    dp[0] = grid[0][0]
    for (j in 1..<m) {
        dp[j] = dp[j - 1] + grid[0][j]
    }
    // Переход состояний: остальные строки
    for (i in 1..<n) {
        // Переход состояний: первый столбец
        dp[0] = dp[0] + grid[i][0]
        // Переход состояний: остальные столбцы
        for (j in 1..<m) {
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
        }
    }
    return dp[m - 1]
}

/* Driver Code */
fun main() {
    val grid = arrayOf(
        intArrayOf(1, 3, 1, 5),
        intArrayOf(2, 2, 4, 2),
        intArrayOf(5, 3, 2, 1),
        intArrayOf(4, 3, 5, 2)
    )
    val n = grid.size
    val m = grid[0].size

    // Полный перебор
    var res = minPathSumDFS(grid, n - 1, m - 1)
    println("Минимальная сумма пути из левого верхнего угла в правый нижний = $res")

    // Поиск с мемоизацией
    val mem = Array(n) { IntArray(m) }
    for (row in mem) {
        row.fill(-1)
    }
    res = minPathSumDFSMem(grid, mem, n - 1, m - 1)
    println("Минимальная сумма пути из левого верхнего угла в правый нижний = $res")

    // Динамическое программирование
    res = minPathSumDP(grid)
    println("Минимальная сумма пути из левого верхнего угла в правый нижний = $res")

    // Динамическое программирование с оптимизацией памяти
    res = minPathSumDPComp(grid)
    println("Минимальная сумма пути из левого верхнего угла в правый нижний = $res")
}