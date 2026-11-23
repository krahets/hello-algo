/**
 * File: min_path_sum.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Минимальная сумма пути: полный перебор */
func minPathSumDFS(grid: [[Int]], i: Int, j: Int) -> Int {
    // Если это верхняя левая ячейка, завершить поиск
    if i == 0, j == 0 {
        return grid[0][0]
    }
    // Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
    if i < 0 || j < 0 {
        return .max
    }
    // Вычислить минимальную стоимость пути из левого верхнего угла до (i-1, j) и (i, j-1)
    let up = minPathSumDFS(grid: grid, i: i - 1, j: j)
    let left = minPathSumDFS(grid: grid, i: i, j: j - 1)
    // Вернуть минимальную стоимость пути из левого верхнего угла до (i, j)
    return min(left, up) + grid[i][j]
}

/* Минимальная сумма пути: поиск с мемоизацией */
func minPathSumDFSMem(grid: [[Int]], mem: inout [[Int]], i: Int, j: Int) -> Int {
    // Если это верхняя левая ячейка, завершить поиск
    if i == 0, j == 0 {
        return grid[0][0]
    }
    // Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
    if i < 0 || j < 0 {
        return .max
    }
    // Если запись уже есть, вернуть сразу
    if mem[i][j] != -1 {
        return mem[i][j]
    }
    // Минимальная стоимость пути для левой и верхней ячеек
    let up = minPathSumDFSMem(grid: grid, mem: &mem, i: i - 1, j: j)
    let left = minPathSumDFSMem(grid: grid, mem: &mem, i: i, j: j - 1)
    // Сохранить и вернуть минимальную стоимость пути из левого верхнего угла до (i, j)
    mem[i][j] = min(left, up) + grid[i][j]
    return mem[i][j]
}

/* Минимальная сумма пути: динамическое программирование */
func minPathSumDP(grid: [[Int]]) -> Int {
    let n = grid.count
    let m = grid[0].count
    // Инициализация таблицы dp
    var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
    dp[0][0] = grid[0][0]
    // Переход состояний: первая строка
    for j in 1 ..< m {
        dp[0][j] = dp[0][j - 1] + grid[0][j]
    }
    // Переход состояний: первый столбец
    for i in 1 ..< n {
        dp[i][0] = dp[i - 1][0] + grid[i][0]
    }
    // Переход состояний: остальные строки и столбцы
    for i in 1 ..< n {
        for j in 1 ..< m {
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
        }
    }
    return dp[n - 1][m - 1]
}

/* Минимальная сумма пути: динамическое программирование с оптимизацией памяти */
func minPathSumDPComp(grid: [[Int]]) -> Int {
    let n = grid.count
    let m = grid[0].count
    // Инициализация таблицы dp
    var dp = Array(repeating: 0, count: m)
    // Переход состояний: первая строка
    dp[0] = grid[0][0]
    for j in 1 ..< m {
        dp[j] = dp[j - 1] + grid[0][j]
    }
    // Переход состояний: остальные строки
    for i in 1 ..< n {
        // Переход состояний: первый столбец
        dp[0] = dp[0] + grid[i][0]
        // Переход состояний: остальные столбцы
        for j in 1 ..< m {
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
        }
    }
    return dp[m - 1]
}

@main
enum MinPathSum {
    /* Driver Code */
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
        print("Минимальная сумма пути из левого верхнего угла в правый нижний = \(res)")

        // Поиск с мемоизацией
        var mem = Array(repeating: Array(repeating: -1, count: m), count: n)
        res = minPathSumDFSMem(grid: grid, mem: &mem, i: n - 1, j: m - 1)
        print("Минимальная сумма пути из левого верхнего угла в правый нижний = \(res)")

        // Динамическое программирование
        res = minPathSumDP(grid: grid)
        print("Минимальная сумма пути из левого верхнего угла в правый нижний = \(res)")

        // Динамическое программирование с оптимизацией памяти
        res = minPathSumDPComp(grid: grid)
        print("Минимальная сумма пути из левого верхнего угла в правый нижний = \(res)")
    }
}
