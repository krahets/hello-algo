/**
* File: min_cost_climbing_stairs_dp.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class min_cost_climbing_stairs_dp {
    /* Минимальная стоимость подъема по лестнице: динамическое программирование */
    int MinCostClimbingStairsDP(int[] cost) {
        int n = cost.Length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // Инициализация таблицы dp для хранения решений подзадач
        int[] dp = new int[n + 1];
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = cost[1];
        dp[2] = cost[2];
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.Min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }

    /* Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти */
    int MinCostClimbingStairsDPComp(int[] cost) {
        int n = cost.Length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = Math.Min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }

    [Test]
    public void Test() {
        int[] cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
        Console.WriteLine("Список стоимостей ступеней:");
        PrintUtil.PrintList(cost);

        int res = MinCostClimbingStairsDP(cost);
        Console.WriteLine($"Минимальная стоимость подъема по лестнице = {res}");

        res = MinCostClimbingStairsDPComp(cost);
        Console.WriteLine($"Минимальная стоимость подъема по лестнице = {res}");
    }
}
