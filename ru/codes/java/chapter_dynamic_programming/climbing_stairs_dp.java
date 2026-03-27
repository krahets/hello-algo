/**
 * File: climbing_stairs_dp.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class climbing_stairs_dp {
    /* Подъем по лестнице: динамическое программирование */
    public static int climbingStairsDP(int n) {
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
    public static int climbingStairsDPComp(int n) {
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

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsDP(n);
        System.out.println(String.format("Количество способов подняться по лестнице из %d ступеней: %d", n, res));

        res = climbingStairsDPComp(n);
        System.out.println(String.format("Количество способов подняться по лестнице из %d ступеней: %d", n, res));
    }
}
