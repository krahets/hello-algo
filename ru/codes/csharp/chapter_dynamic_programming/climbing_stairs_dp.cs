/**
* File: climbing_stairs_dp.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_dp {
    /* Подъем по лестнице: динамическое программирование */
    int ClimbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // Инициализация таблицы dp для хранения решений подзадач
        int[] dp = new int[n + 1];
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = 1;
        dp[2] = 2;
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }

    /* Подъем по лестнице: динамическое программирование с оптимизацией памяти */
    int ClimbingStairsDPComp(int n) {
        if (n == 1 || n == 2)
            return n;
        int a = 1, b = 2;
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }

    [Test]
    public void Test() {
        int n = 9;

        int res = ClimbingStairsDP(n);
        Console.WriteLine($"Количество способов подняться по лестнице из {n} ступеней = {res}");

        res = ClimbingStairsDPComp(n);
        Console.WriteLine($"Количество способов подняться по лестнице из {n} ступеней = {res}");
    }
}
