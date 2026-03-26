/**
* File: climbing_stairs_constraint_dp.cs
* Created Time: 2023-07-03
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_constraint_dp {
    /* Подъем по лестнице с ограничениями: динамическое программирование */
    int ClimbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // Инициализировать таблицу dp для хранения решений подзадач
        int[,] dp = new int[n + 1, 3];
        // Начальное состояние: заранее задать решения для наименьших подзадач
        dp[1, 1] = 1;
        dp[1, 2] = 0;
        dp[2, 1] = 0;
        dp[2, 2] = 1;
        // Переход состояния: последовательно решать более крупные подзадачи, исходя из меньших
        for (int i = 3; i <= n; i++) {
            dp[i, 1] = dp[i - 1, 2];
            dp[i, 2] = dp[i - 2, 1] + dp[i - 2, 2];
        }
        return dp[n, 1] + dp[n, 2];
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsConstraintDP(n);
        Console.WriteLine($"Для подъема по лестнице из {n} ступеней существует {res} способов");
    }
}
