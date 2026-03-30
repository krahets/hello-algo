/**
 * File: min_path_sum.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Минимальная сумма пути: полный перебор */
function minPathSumDFS(grid, i, j) {
    // Если это верхняя левая ячейка, завершить поиск
    if (i === 0 && j === 0) {
        return grid[0][0];
    }
    // Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // Вычислить минимальную стоимость пути из левого верхнего угла до (i-1, j) и (i, j-1)
    const up = minPathSumDFS(grid, i - 1, j);
    const left = minPathSumDFS(grid, i, j - 1);
    // Вернуть минимальную стоимость пути из левого верхнего угла до (i, j)
    return Math.min(left, up) + grid[i][j];
}

/* Минимальная сумма пути: поиск с мемоизацией */
function minPathSumDFSMem(grid, mem, i, j) {
    // Если это верхняя левая ячейка, завершить поиск
    if (i === 0 && j === 0) {
        return grid[0][0];
    }
    // Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
    if (i < 0 || j < 0) {
        return Infinity;
    }
    // Если запись уже есть, вернуть сразу
    if (mem[i][j] !== -1) {
        return mem[i][j];
    }
    // Минимальная стоимость пути для левой и верхней ячеек
    const up = minPathSumDFSMem(grid, mem, i - 1, j);
    const left = minPathSumDFSMem(grid, mem, i, j - 1);
    // Сохранить и вернуть минимальную стоимость пути из левого верхнего угла до (i, j)
    mem[i][j] = Math.min(left, up) + grid[i][j];
    return mem[i][j];
}

/* Минимальная сумма пути: динамическое программирование */
function minPathSumDP(grid) {
    const n = grid.length,
        m = grid[0].length;
    // Инициализация таблицы dp
    const dp = Array.from({ length: n }, () =>
        Array.from({ length: m }, () => 0)
    );
    dp[0][0] = grid[0][0];
    // Переход состояний: первая строка
    for (let j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // Переход состояний: первый столбец
    for (let i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // Переход состояний: остальные строки и столбцы
    for (let i = 1; i < n; i++) {
        for (let j = 1; j < m; j++) {
            dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

/* Минимальная сумма пути: динамическое программирование с оптимизацией памяти */
function minPathSumDPComp(grid) {
    const n = grid.length,
        m = grid[0].length;
    // Инициализация таблицы dp
    const dp = new Array(m);
    // Переход состояний: первая строка
    dp[0] = grid[0][0];
    for (let j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // Переход состояний: остальные строки
    for (let i = 1; i < n; i++) {
        // Переход состояний: первый столбец
        dp[0] = dp[0] + grid[i][0];
        // Переход состояний: остальные столбцы
        for (let j = 1; j < m; j++) {
            dp[j] = Math.min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    return dp[m - 1];
}

/* Driver Code */
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
console.log(`Минимальная сумма пути из левого верхнего угла в правый нижний = ${res}`);

// Поиск с мемоизацией
const mem = Array.from({ length: n }, () =>
    Array.from({ length: m }, () => -1)
);
res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
console.log(`Минимальная сумма пути из левого верхнего угла в правый нижний = ${res}`);

// Динамическое программирование
res = minPathSumDP(grid);
console.log(`Минимальная сумма пути из левого верхнего угла в правый нижний = ${res}`);

// Динамическое программирование с оптимизацией памяти
res = minPathSumDPComp(grid);
console.log(`Минимальная сумма пути из левого верхнего угла в правый нижний = ${res}`);
