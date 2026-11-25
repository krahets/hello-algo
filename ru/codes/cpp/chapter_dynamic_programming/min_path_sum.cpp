/**
 * File: min_path_sum.cpp
 * Created Time: 2023-07-10
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Минимальная сумма на пути: полный перебор */
int minPathSumDFS(vector<vector<int>> &grid, int i, int j) {
    // При достижении верхней левой ячейки завершить поиск
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // Если индекс строки или столбца вне матрицы, вернуть стоимость +∞
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // Найти минимальные стоимости путей из верхнего левого угла до (i-1, j) и (i, j-1)
    int up = minPathSumDFS(grid, i - 1, j);
    int left = minPathSumDFS(grid, i, j - 1);
    // Вернуть минимальную стоимость пути из верхнего левого угла до (i, j)
    return min(left, up) != INT_MAX ? min(left, up) + grid[i][j] : INT_MAX;
}

/* Минимальная сумма на пути: поиск с мемоизацией */
int minPathSumDFSMem(vector<vector<int>> &grid, vector<vector<int>> &mem, int i, int j) {
    // При достижении верхней левой ячейки завершить поиск
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // Если индекс строки или столбца вне матрицы, вернуть стоимость +∞
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // Если результат сохранён, сразу вернуть его
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // Минимальные стоимости путей до ячеек слева и сверху
    int up = minPathSumDFSMem(grid, mem, i - 1, j);
    int left = minPathSumDFSMem(grid, mem, i, j - 1);
    // Сохранить и вернуть минимальную стоимость пути из верхнего левого угла до (i, j)
    mem[i][j] = min(left, up) != INT_MAX ? min(left, up) + grid[i][j] : INT_MAX;
    return mem[i][j];
}

/* Минимальная сумма на пути: динамическое программирование */
int minPathSumDP(vector<vector<int>> &grid) {
    int n = grid.size(), m = grid[0].size();
    // Инициализировать таблицу dp
    vector<vector<int>> dp(n, vector<int>(m));
    dp[0][0] = grid[0][0];
    // Переход: первая строка
    for (int j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // Переход: первый столбец
    for (int i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // Переход: остальные строки и столбцы
    for (int i = 1; i < n; i++) {
        for (int j = 1; j < m; j++) {
            dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    return dp[n - 1][m - 1];
}

/* Минимальная сумма на пути: динамическое программирование с экономией памяти */
int minPathSumDPComp(vector<vector<int>> &grid) {
    int n = grid.size(), m = grid[0].size();
    // Инициализировать таблицу dp
    vector<int> dp(m);
    // Переход: первая строка
    dp[0] = grid[0][0];
    for (int j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // Переход: остальные строки
    for (int i = 1; i < n; i++) {
        // Переход: первый столбец
        dp[0] = dp[0] + grid[i][0];
        // Переход: остальные столбцы
        for (int j = 1; j < m; j++) {
            dp[j] = min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    return dp[m - 1];
}

/* Основная программа */
int main() {
    vector<vector<int>> grid = {{1, 3, 1, 5}, {2, 2, 4, 2}, {5, 3, 2, 1}, {4, 3, 5, 2}};
    int n = grid.size(), m = grid[0].size();

    // Полный перебор
    int res = minPathSumDFS(grid, n - 1, m - 1);
    cout << "Минимальная сумма на пути из верхнего левого в нижний правый угол: " << res << endl;

    // Поиск с мемоизацией
    vector<vector<int>> mem(n, vector<int>(m, -1));
    res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
    cout << "Минимальная сумма на пути из верхнего левого в нижний правый угол: " << res << endl;

    // Динамическое программирование
    res = minPathSumDP(grid);
    cout << "Минимальная сумма на пути из верхнего левого в нижний правый угол: " << res << endl;

    // Динамическое программирование с экономией памяти
    res = minPathSumDPComp(grid);
    cout << "Минимальная сумма на пути из верхнего левого в нижний правый угол: " << res << endl;

    return 0;
}
