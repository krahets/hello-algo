/**
 * File: min_path_sum.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Минимальная сумма на пути: полный перебор */
func minPathSumDFS(grid: [[Int]], i: Int, j: Int) -> Int {
    // При достижении верхней левой ячейки завершить поиск
    if i == 0, j == 0 {
        return grid[0][0]
    }
    // Если индекс строки или столбца вне матрицы, вернуть стоимость +∞
    if i < 0 || j < 0 {
        return .max
    }
    // Найти минимальные стоимости путей из верхнего левого угла до (i-1, j) и (i, j-1)
    let up = minPathSumDFS(grid: grid, i: i - 1, j: j)
    let left = minPathSumDFS(grid: grid, i: i, j: j - 1)
    // Вернуть минимальную стоимость пути из верхнего левого угла до (i, j)
    return min(left, up) + grid[i][j]
}

/* Минимальная сумма на пути: поиск с мемоизацией */
func minPathSumDFSMem(grid: [[Int]], mem: inout [[Int]], i: Int, j: Int) -> Int {
    // При достижении верхней левой ячейки завершить поиск
    if i == 0, j == 0 {
        return grid[0][0]
    }
    // Если индекс строки или столбца вне матрицы, вернуть стоимость +∞
    if i < 0 || j < 0 {
        return .max
    }
    // Если результат сохранён, сразу вернуть его
    if mem[i][j] != -1 {
        return mem[i][j]
    }
    // Минимальные стоимости путей до ячеек слева и сверху
    let up = minPathSumDFSMem(grid: grid, mem: &mem, i: i - 1, j: j)
    let left = minPathSumDFSMem(grid: grid, mem: &mem, i: i, j: j - 1)
    // Сохранить и вернуть минимальную стоимость пути из верхнего левого угла до (i, j)
    mem[i][j] = min(left, up) + grid[i][j]
    return mem[i][j]
}

/* Минимальная сумма на пути: динамическое программирование */
func minPathSumDP(grid: [[Int]]) -> Int {
    let n = grid.count
    let m = grid[0].count
    // Инициализировать таблицу dp
    var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
    dp[0][0] = grid[0][0]
    // Переход: первая строка
    for j in 1 ..< m {
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    }
    // Переход: первый столбец
    for i in 1 ..< n {
        dp[i][0] = dp[i - 1][0] + grid[i][0]
    }
    // Переход: остальные строки и столбцы
    for i in 1 ..< n {
        for j in 1 ..< m {
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
        }
    }
    return dp[n - 1][m - 1]
}

/* Минимальная сумма на пути: динамическое программирование с экономией памяти */
func minPathSumDPComp(grid: [[Int]]) -> Int {
    let n = grid.count
    let m = grid[0].count
    // Инициализировать таблицу dp
    var dp = Array(repeating: 0, count: m)
    // Переход: первая строка
    dp[0] = grid[0][0]
    for j in 1 ..< m {
        dp[j] = dp[j - 1] + grid[0][j]
    }
    // Переход: остальные строки
    for i in 1 ..< n {
        // Переход: первый столбец
        dp[0] = dp[0] + grid[i][0]
        // Переход: остальные столбцы
        for j in 1 ..< m {
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
        }
    }
    return dp[m - 1]
}

@main
enum MinPathSum {
    /* Основная программа */
    static func main() {
        let grid = [
            [1, 3, 1, 5],
            [2, 2, 4, 2],
            [5, 3, 2, 1],
            [4, 3, 5, 2],
        ]
        let n = grid.count
        let m = grid[0].count

        // Полный перебор
        var res = minPathSumDFS(grid: grid, i: n - 1, j: m - 1)
        print("Минимальная сумма на пути из верхнего левого в нижний правый угол: \(res)")

        // Поиск с мемоизацией
        var mem = Array(repeating: Array(repeating: -1, count: m), count: n)
        res = minPathSumDFSMem(grid: grid, mem: &mem, i: n - 1, j: m - 1)
        print("Минимальная сумма на пути из верхнего левого в нижний правый угол: \(res)")

        // Динамическое программирование
        res = minPathSumDP(grid: grid)
        print("Минимальная сумма на пути из верхнего левого в нижний правый угол: \(res)")

        // Динамическое программирование с экономией памяти
        res = minPathSumDPComp(grid: grid)
        print("Минимальная сумма на пути из верхнего левого в нижний правый угол: \(res)")
    }
}
