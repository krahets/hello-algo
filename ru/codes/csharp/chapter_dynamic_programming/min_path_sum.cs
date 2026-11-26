/**
* File: min_path_sum.cs
* Created Time: 2023-07-10
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class min_path_sum {
    /* Минимальная сумма на пути: полный перебор */
    int MinPathSumDFS(int[][] grid, int i, int j) {
        // При достижении верхней левой ячейки завершить поиск
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // Если индекс строки или столбца вне матрицы, вернуть стоимость +∞
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // Найти минимальные стоимости путей из верхнего левого угла до (i-1, j) и (i, j-1)
        int up = MinPathSumDFS(grid, i - 1, j);
        int left = MinPathSumDFS(grid, i, j - 1);
        // Вернуть минимальную стоимость пути из верхнего левого угла до (i, j)
        return Math.Min(left, up) + grid[i][j];
    }

    /* Минимальная сумма на пути: поиск с мемоизацией */
    int MinPathSumDFSMem(int[][] grid, int[][] mem, int i, int j) {
        // При достижении верхней левой ячейки завершить поиск
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // Если индекс строки или столбца вне матрицы, вернуть стоимость +∞
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // Если результат сохранён, сразу вернуть его
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // Минимальные стоимости путей до ячеек слева и сверху
        int up = MinPathSumDFSMem(grid, mem, i - 1, j);
        int left = MinPathSumDFSMem(grid, mem, i, j - 1);
        // Сохранить и вернуть минимальную стоимость пути из верхнего левого угла до (i, j)
        mem[i][j] = Math.Min(left, up) + grid[i][j];
        return mem[i][j];
    }

    /* Минимальная сумма на пути: динамическое программирование */
    int MinPathSumDP(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        // Инициализировать таблицу dp
        int[,] dp = new int[n, m];
        dp[0, 0] = grid[0][0];
        // Переход: первая строка
        for (int j = 1; j < m; j++) {
            dp[0, j] = dp[0, j - 1] + grid[0][j];
        }
        // Переход: первый столбец
        for (int i = 1; i < n; i++) {
            dp[i, 0] = dp[i - 1, 0] + grid[i][0];
        }
        // Переход: остальные строки и столбцы
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                dp[i, j] = Math.Min(dp[i, j - 1], dp[i - 1, j]) + grid[i][j];
            }
        }
        return dp[n - 1, m - 1];
    }

    /* Минимальная сумма на пути: динамическое программирование с экономией памяти */
    int MinPathSumDPComp(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        // Инициализировать таблицу dp
        int[] dp = new int[m];
        dp[0] = grid[0][0];
        // Переход: первая строка
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // Переход: остальные строки
        for (int i = 1; i < n; i++) {
            // Переход: первый столбец
            dp[0] = dp[0] + grid[i][0];
            // Переход: остальные столбцы
            for (int j = 1; j < m; j++) {
                dp[j] = Math.Min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        return dp[m - 1];
    }

    [Test]
    public void Test() {
        int[][] grid =
        [
            [1, 3, 1, 5],
            [2, 2, 4, 2],
            [5, 3, 2, 1],
            [4, 3, 5, 2]
        ];

        int n = grid.Length, m = grid[0].Length;

        // Полный перебор
        int res = MinPathSumDFS(grid, n - 1, m - 1);
        Console.WriteLine("Минимальная сумма на пути из верхнего левого в нижний правый угол: " + res);

        // Поиск с мемоизацией
        int[][] mem = new int[n][];
        for (int i = 0; i < n; i++) {
            mem[i] = new int[m];
            Array.Fill(mem[i], -1);
        }
        res = MinPathSumDFSMem(grid, mem, n - 1, m - 1);
        Console.WriteLine("Минимальная сумма на пути из верхнего левого в нижний правый угол: " + res);

        // Динамическое программирование
        res = MinPathSumDP(grid);
        Console.WriteLine("Минимальная сумма на пути из верхнего левого в нижний правый угол: " + res);

        // Динамическое программирование с экономией памяти
        res = MinPathSumDPComp(grid);
        Console.WriteLine("Минимальная сумма на пути из верхнего левого в нижний правый угол: " + res);
    }
}
