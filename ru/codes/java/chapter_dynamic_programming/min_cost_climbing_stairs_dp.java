/**
 * File: min_cost_climbing_stairs_dp.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class min_cost_climbing_stairs_dp {
    /* Минимальная стоимость подъема по лестнице: динамическое программирование */
    public static int minCostClimbingStairsDP(int[] cost) {
        int n = cost.length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // Инициализация таблицы dp для хранения решений подзадач
        int[] dp = new int[n + 1];
        // Начальное состояние: заранее задать решения наименьших подзадач
        dp[1] = cost[1];
        dp[2] = cost[2];
        // Переход состояний: постепенное решение больших подзадач через меньшие
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }

    /* Минимальная стоимость подъема по лестнице: динамическое программирование с оптимизацией памяти */
    public static int minCostClimbingStairsDPComp(int[] cost) {
        int n = cost.length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = Math.min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }

    public static void main(String[] args) {
        int[] cost = { 0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1 };
        System.out.println(String.format("Список стоимостей ступеней = %s", Arrays.toString(cost)));

        int res = minCostClimbingStairsDP(cost);
        System.out.println(String.format("Минимальная стоимость подъема по лестнице = %d", res));

        res = minCostClimbingStairsDPComp(cost);
        System.out.println(String.format("Минимальная стоимость подъема по лестнице = %d", res));
    }
}
