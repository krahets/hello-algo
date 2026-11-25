/**
 * File: min_path_sum.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

// Считаем, что у матрицы не более 100 строк и 100 столбцов
#define MAX_SIZE 100

/* Найти минимум */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* Минимальная сумма на пути: полный перебор */
int minPathSumDFS(int grid[MAX_SIZE][MAX_SIZE], int i, int j) {
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
    return myMin(left, up) != INT_MAX ? myMin(left, up) + grid[i][j] : INT_MAX;
}

/* Минимальная сумма на пути: поиск с мемоизацией */
int minPathSumDFSMem(int grid[MAX_SIZE][MAX_SIZE], int mem[MAX_SIZE][MAX_SIZE], int i, int j) {
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
    mem[i][j] = myMin(left, up) != INT_MAX ? myMin(left, up) + grid[i][j] : INT_MAX;
    return mem[i][j];
}

/* Минимальная сумма на пути: динамическое программирование */
int minPathSumDP(int grid[MAX_SIZE][MAX_SIZE], int n, int m) {
    // Инициализировать таблицу dp
    int **dp = malloc(n * sizeof(int *));
    for (int i = 0; i < n; i++) {
        dp[i] = calloc(m, sizeof(int));
    }
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
            dp[i][j] = myMin(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    int res = dp[n - 1][m - 1];
    // Освободить память
    for (int i = 0; i < n; i++) {
        free(dp[i]);
    }
    return res;
}

/* Минимальная сумма на пути: динамическое программирование с экономией памяти */
int minPathSumDPComp(int grid[MAX_SIZE][MAX_SIZE], int n, int m) {
    // Инициализировать таблицу dp
    int *dp = calloc(m, sizeof(int));
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
            dp[j] = myMin(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    int res = dp[m - 1];
    // Освободить память
    free(dp);
    return res;
}

/* Основная программа */
int main() {
    int grid[MAX_SIZE][MAX_SIZE] = {{1, 3, 1, 5}, {2, 2, 4, 2}, {5, 3, 2, 1}, {4, 3, 5, 2}};
    int n = 4, m = 4; // Матрица вмещает MAX_SIZE * MAX_SIZE элементов, используется n строк и m столбцов

    // Полный перебор
    int res = minPathSumDFS(grid, n - 1, m - 1);
    printf("Минимальная сумма на пути из верхнего левого в нижний правый угол: %d\n", res);

    // Поиск с мемоизацией
    int mem[MAX_SIZE][MAX_SIZE];
    memset(mem, -1, sizeof(mem));
    res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
    printf("Минимальная сумма на пути из верхнего левого в нижний правый угол: %d\n", res);

    // Динамическое программирование
    res = minPathSumDP(grid, n, m);
    printf("Минимальная сумма на пути из верхнего левого в нижний правый угол: %d\n", res);

    // Динамическое программирование с экономией памяти
    res = minPathSumDPComp(grid, n, m);
    printf("Минимальная сумма на пути из верхнего левого в нижний правый угол: %d\n", res);

    return 0;
}
