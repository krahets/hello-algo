/**
* File: min_cost_climbing_stairs_dp.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class min_cost_climbing_stairs_dp {
    /* Минимальная стоимость подъёма: динамическое программирование */
    int MinCostClimbingStairsDP(int[] cost) {
        int n = cost.Length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // Создать таблицу dp для решений подзадач
        int[] dp = new int[n + 1];
        // Начальные состояния: задать решения простейших подзадач
        dp[1] = cost[1];
        dp[2] = cost[2];
        // Переход: решать подзадачи от меньших к большим
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.Min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }

    /* Минимальная стоимость подъёма: динамическое программирование с экономией памяти */
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
        Console.WriteLine("Стоимость ступеней:");
        PrintUtil.PrintList(cost);

        int res = MinCostClimbingStairsDP(cost);
        Console.WriteLine($"Минимальная стоимость подъёма: {res}");

        res = MinCostClimbingStairsDPComp(cost);
        Console.WriteLine($"Минимальная стоимость подъёма: {res}");
    }
}
