/**
 * File: min_path_sum.java
 * Created Time: 2023-07-10
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class min_path_sum {
    /* Минимальная сумма пути: полный перебор */
    static int minPathSumDFS(int[][] grid, int i, int j) {
        // Если это верхняя левая ячейка, завершить поиск
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // Вычислить минимальную стоимость пути из левого верхнего угла до (i-1, j) и (i, j-1)
        int up = minPathSumDFS(grid, i - 1, j);
        int left = minPathSumDFS(grid, i, j - 1);
        // Вернуть минимальную стоимость пути из левого верхнего угла до (i, j)
        return Math.min(left, up) + grid[i][j];
    }

    /* Минимальная сумма пути: поиск с мемоизацией */
    static int minPathSumDFSMem(int[][] grid, int[][] mem, int i, int j) {
        // Если это верхняя левая ячейка, завершить поиск
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // Если индексы строки или столбца выходят за границы, вернуть стоимость +∞
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // Если запись уже есть, вернуть сразу
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // Минимальная стоимость пути для левой и верхней ячеек
        int up = minPathSumDFSMem(grid, mem, i - 1, j);
        int left = minPathSumDFSMem(grid, mem, i, j - 1);
        // Сохранить и вернуть минимальную стоимость пути из левого верхнего угла до (i, j)
        mem[i][j] = Math.min(left, up) + grid[i][j];
        return mem[i][j];
    }

    /* Минимальная сумма пути: динамическое программирование */
    static int minPathSumDP(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        // Инициализация таблицы dp
        int[][] dp = new int[n][m];
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
                dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
            }
        }
        return dp[n - 1][m - 1];
    }

    /* Минимальная сумма пути: динамическое программирование с оптимизацией памяти */
    static int minPathSumDPComp(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        // Инициализация таблицы dp
        int[] dp = new int[m];
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
                dp[j] = Math.min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        return dp[m - 1];
    }

    public static void main(String[] args) {
        int[][] grid = {
                { 1, 3, 1, 5 },
                { 2, 2, 4, 2 },
                { 5, 3, 2, 1 },
                { 4, 3, 5, 2 }
        };
        int n = grid.length, m = grid[0].length;

        // Полный перебор
        int res = minPathSumDFS(grid, n - 1, m - 1);
        System.out.println("Минимальная сумма пути из левого верхнего угла в правый нижний = " + res);

        // Поиск с мемоизацией
        int[][] mem = new int[n][m];
        for (int[] row : mem) {
            Arrays.fill(row, -1);
        }
        res = minPathSumDFSMem(grid, mem, n - 1, m - 1);
        System.out.println("Минимальная сумма пути из левого верхнего угла в правый нижний = " + res);

        // Динамическое программирование
        res = minPathSumDP(grid);
        System.out.println("Минимальная сумма пути из левого верхнего угла в правый нижний = " + res);

        // Динамическое программирование с оптимизацией памяти
        res = minPathSumDPComp(grid);
        System.out.println("Минимальная сумма пути из левого верхнего угла в правый нижний = " + res);
    }
}
