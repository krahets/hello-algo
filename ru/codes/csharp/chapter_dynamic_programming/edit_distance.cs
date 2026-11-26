/**
* File: edit_distance.cs
* Created Time: 2023-07-14
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class edit_distance {
    /* Редакционное расстояние: полный перебор */
    int EditDistanceDFS(string s, string t, int i, int j) {
        // Если s и t пусты, вернуть 0
        if (i == 0 && j == 0)
            return 0;
        // Если s пуста, вернуть длину t
        if (i == 0)
            return j;
        // Если t пуста, вернуть длину s
        if (j == 0)
            return i;
        // Если символы совпадают, пропустить оба
        if (s[i - 1] == t[j - 1])
            return EditDistanceDFS(s, t, i - 1, j - 1);
        // Минимум правок равен 1 плюс минимум по трём вариантам: вставка, удаление и замена
        int insert = EditDistanceDFS(s, t, i, j - 1);
        int delete = EditDistanceDFS(s, t, i - 1, j);
        int replace = EditDistanceDFS(s, t, i - 1, j - 1);
        // Вернуть минимальное число правок
        return Math.Min(Math.Min(insert, delete), replace) + 1;
    }

    /* Редакционное расстояние: поиск с мемоизацией */
    int EditDistanceDFSMem(string s, string t, int[][] mem, int i, int j) {
        // Если s и t пусты, вернуть 0
        if (i == 0 && j == 0)
            return 0;
        // Если s пуста, вернуть длину t
        if (i == 0)
            return j;
        // Если t пуста, вернуть длину s
        if (j == 0)
            return i;
        // Если результат сохранён, сразу вернуть его
        if (mem[i][j] != -1)
            return mem[i][j];
        // Если символы совпадают, пропустить оба
        if (s[i - 1] == t[j - 1])
            return EditDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // Минимум правок равен 1 плюс минимум по трём вариантам: вставка, удаление и замена
        int insert = EditDistanceDFSMem(s, t, mem, i, j - 1);
        int delete = EditDistanceDFSMem(s, t, mem, i - 1, j);
        int replace = EditDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // Сохранить и вернуть минимальное число правок
        mem[i][j] = Math.Min(Math.Min(insert, delete), replace) + 1;
        return mem[i][j];
    }

    /* Редакционное расстояние: динамическое программирование */
    int EditDistanceDP(string s, string t) {
        int n = s.Length, m = t.Length;
        int[,] dp = new int[n + 1, m + 1];
        // Переход: первая строка и первый столбец
        for (int i = 1; i <= n; i++) {
            dp[i, 0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0, j] = j;
        }
        // Переход: остальные строки и столбцы
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s[i - 1] == t[j - 1]) {
                    // Если символы совпадают, пропустить оба
                    dp[i, j] = dp[i - 1, j - 1];
                } else {
                    // Минимум правок равен 1 плюс минимум по трём вариантам: вставка, удаление и замена
                    dp[i, j] = Math.Min(Math.Min(dp[i, j - 1], dp[i - 1, j]), dp[i - 1, j - 1]) + 1;
                }
            }
        }
        return dp[n, m];
    }

    /* Редакционное расстояние: динамическое программирование с экономией памяти */
    int EditDistanceDPComp(string s, string t) {
        int n = s.Length, m = t.Length;
        int[] dp = new int[m + 1];
        // Переход: первая строка
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // Переход: остальные строки
        for (int i = 1; i <= n; i++) {
            // Переход: первый столбец
            int leftup = dp[0]; // Временно сохранить dp[i-1, j-1]
            dp[0] = i;
            // Переход: остальные столбцы
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s[i - 1] == t[j - 1]) {
                    // Если символы совпадают, пропустить оба
                    dp[j] = leftup;
                } else {
                    // Минимум правок равен 1 плюс минимум по трём вариантам: вставка, удаление и замена
                    dp[j] = Math.Min(Math.Min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // Обновить значение dp[i-1, j-1] для следующей итерации
            }
        }
        return dp[m];
    }

    [Test]
    public void Test() {
        string s = "bag";
        string t = "pack";
        int n = s.Length, m = t.Length;

        // Полный перебор
        int res = EditDistanceDFS(s, t, n, m);
        Console.WriteLine("Для преобразования " + s + " в " + t + " результат равен " + res + " (минимальное число правок).");

        // Поиск с мемоизацией
        int[][] mem = new int[n + 1][];
        for (int i = 0; i <= n; i++) {
            mem[i] = new int[m + 1];
            Array.Fill(mem[i], -1);
        }

        res = EditDistanceDFSMem(s, t, mem, n, m);
        Console.WriteLine("Для преобразования " + s + " в " + t + " результат равен " + res + " (минимальное число правок).");

        // Динамическое программирование
        res = EditDistanceDP(s, t);
        Console.WriteLine("Для преобразования " + s + " в " + t + " результат равен " + res + " (минимальное число правок).");

        // Динамическое программирование с экономией памяти
        res = EditDistanceDPComp(s, t);
        Console.WriteLine("Для преобразования " + s + " в " + t + " результат равен " + res + " (минимальное число правок).");
    }
}
