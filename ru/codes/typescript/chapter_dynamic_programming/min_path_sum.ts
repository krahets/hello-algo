/**
 * File: min_path_sum.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Минимальная сумма на пути: полный перебор */
function minPathSumDFS(
    grid: Array<Array<number>>,
    i: number,
    j: number
): number {
    // При достижении верхней левой ячейки завершить поиск
    if (i === 0 && j == 0) {
        return grid[0][0];
    }
    // Если индекс строки или столбца вне матрицы, вернуть стоимость +∞
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // Найти минимальные стоимости путей из верхнего левого угла до (i-1, j) и (i, j-1)
    const up = minPathSumDFS(grid, i - 1, j);
    const left = minPathSumDFS(grid, i, j - 1);
    // Вернуть минимальную стоимость пути из верхнего левого угла до (i, j)
    return Math.min(left, up) + grid[i][j];
}

/* Минимальная сумма на пути: поиск с мемоизацией */
function minPathSumDFSMem(
    grid: Array<Array<number>>,
    mem: Array<Array<number>>,
    i: number,
    j: number
): number {
    // При достижении верхней левой ячейки завершить поиск
    if (i === 0 && j === 0) {
        return grid[0][0];
    }
    // Если индекс строки или столбца вне матрицы, вернуть стоимость +∞
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // Если результат сохранён, сразу вернуть его
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // Минимальные стоимости путей до ячеек слева и сверху
    const up = minPathSumDFSMem(grid, mem, i - 1, j);
    const left = minPathSumDFSMem(grid, mem, i, j - 1);
    // Сохранить и вернуть минимальную стоимость пути из верхнего левого угла до (i, j)
    mem[i][j] = Math.min(left, up) + grid[i][j];
    return mem[i][j];
}

/* Минимальная сумма на пути: динамическое программирование */
function minPathSumDP(grid: Array<Array<number>>): number {
    const n = grid.length,
        m = grid[0].length;
    // Инициализировать таблицу dp
    const dp = Array.from({ length: n }, () =>
        Array.from({ length: m }, () => 0)
    );
    dp[0][0] = grid[0][0];
    // Переход: первая строка
    for (let j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // Переход: первый столбец
    for (let i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // Переход: остальные строки и столбцы
    for (let i = 1; i < n; i++) {
        for (let j: number = 1; j < m; j++) {
            dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

/* Минимальная сумма на пути: динамическое программирование с экономией памяти */
function minPathSumDPComp(grid: Array<Array<number>>): number {
    const n = grid.length,
        m = grid[0].length;
    // Инициализировать таблицу dp
    const dp = new Array(m);
    // Переход: первая строка
    dp[0] = grid[0][0];
    for (let j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // Переход: остальные строки
    for (let i = 1; i < n; i++) {
        // Переход: первый столбец
        dp[0] = dp[0] + grid[i][0];
        // Переход: остальные столбцы
        for (let j = 1; j < m; j++) {
            dp[j] = Math.min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    return dp[m - 1];
}

/* Основная программа */
const grid = [
    [1, 3, 1, 5],
    [2, 2, 4, 2],
    [5, 3, 2, 1],
    [4, 3, 5, 2],
];
const n = grid.length,
    m = grid[0].length;
// Полный перебор
let res = minPathSumDFS(grid, n - 1, m - 1);
console.log(`Минимальная сумма на пути из верхнего левого в нижний правый угол: ${res}`);

// Поиск с мемоизацией
const mem = Array.from({ length: n }, () =>
    Array.from({ length: m }, () => -1)
);
res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
console.log(`Минимальная сумма на пути из верхнего левого в нижний правый угол: ${res}`);

// Динамическое программирование
res = minPathSumDP(grid);
console.log(`Минимальная сумма на пути из верхнего левого в нижний правый угол: ${res}`);

// Динамическое программирование с экономией памяти
res = minPathSumDPComp(grid);
console.log(`Минимальная сумма на пути из верхнего левого в нижний правый угол: ${res}`);

export {};
