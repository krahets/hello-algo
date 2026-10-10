/**
 * File: min_path_sum.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

// Предположить, что максимальное число строк и столбцов матрицы равно 100
#define MAX_SIZE 100

/* Найти минимум */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* Минимальная сумма пути: полный перебор */
int minPathSumDFS(int grid[MAX_SIZE][MAX_SIZE], int i, int j) {
    // Если это верхняя левая ячейка, завершить поиск
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // Вычислить минимальную стоимость пути из левого верхнего угла до (i-1, j) и (i, j-1)
    int up = minPathSumDFS(grid, i - 1, j);
    int left = minPathSumDFS(grid, i, j - 1);
    // Вернуть минимальную стоимость пути из левого верхнего угла до (i, j)
    return myMin(left, up) != INT_MAX ? myMin(left, up) + grid[i][j] : INT_MAX;
}

/* Минимальная сумма пути: поиск с мемоизацией */
int minPathSumDFSMem(int grid[MAX_SIZE][MAX_SIZE], int mem[MAX_SIZE][MAX_SIZE], int i, int j) {
    // Если это верхняя левая ячейка, завершить поиск
    if (i == 0 && j == 0) {
        return grid[0][0];
    }
    // Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
    if (i < 0 || j < 0) {
        return INT_MAX;
    }
    // Если запись уже есть, вернуть сразу
    if (mem[i][j] != -1) {
        return mem[i][j];
    }
    // Минимальная стоимость пути для левой и верхней ячеек
    int up = minPathSumDFSMem(grid, mem, i - 1, j);
    int left = minPathSumDFSMem(grid, mem, i, j - 1);
    // Сохранить и вернуть минимальную стоимость пути из левого верхнего угла до (i, j)
    mem[i][j] = myMin(left, up) != INT_MAX ? myMin(left, up) + grid[i][j] : INT_MAX;
    return mem[i][j];
}

/* Минимальная сумма пути: динамическое программирование */
int minPathSumDP(int grid[MAX_SIZE][MAX_SIZE], int n, int m) {
    // Инициализация таблицы dp
    int **dp = malloc(n * sizeof(int *));
    for (int i = 0; i < n; i++) {
        dp[i] = calloc(m, sizeof(int));
    }
    dp[0][0] = grid[0][0];
    // Переход состояний: первая строка
    for (int j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // Переход состояний: первый столбец
    for (int i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // Переход состояний: остальные строки и столбцы
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

/* Минимальная сумма пути: динамическое программирование с оптимизацией памяти */
int minPathSumDPComp(int grid[MAX_SIZE][MAX_SIZE], int n, int m) {
    // Инициализация таблицы dp
    int *dp = calloc(m, sizeof(int));
    // Переход состояний: первая строка
    dp[0] = grid[0][0];
    for (int j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // Переход состояний: остальные строки
    for (int i = 1; i < n; i++) {
        // Переход состояний: первый столбец
        dp[0] = dp[0] + grid[i][0];
        // Переход состояний: остальные столбцы
        for (int j = 1; j < m; j++) {
            dp[j] = myMin(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    int res = dp[m - 1];
    // Освободить память
    free(dp);
    return res;
}

/* Driver Code */
int main() {
    int grid[MAX_SIZE][MAX_SIZE] = {{1, 3, 1, 5}, {2, 2, 4, 2}, {5, 3, 2, 1}, {4, 3, 5, 2}};
    int n = 4, m = 4; // Емкость матрицы равна MAX_SIZE * MAX_SIZE, число эффективных строк и столбцов — n * m

    // Полный перебор
    int res = minPathSumDFS(grid, n - 1, m - 1);
    printf("Минимальная сумма пути из левого верхнего в правый нижний угол = %d\n", res);

    // Поиск с мемоизацией
    int mem[MAX_SIZE][MAX_SIZE];
    memset(mem, -1, sizeof(mem));
    res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
    printf("Минимальная сумма пути из левого верхнего в правый нижний угол = %d\n", res);

    // Динамическое программирование
    res = minPathSumDP(grid, n, m);
    printf("Минимальная сумма пути из левого верхнего в правый нижний угол = %d\n", res);

    // Динамическое программирование с оптимизацией памяти
    res = minPathSumDPComp(grid, n, m);
    printf("Минимальная сумма пути из левого верхнего в правый нижний угол = %d\n", res);

    return 0;
}
