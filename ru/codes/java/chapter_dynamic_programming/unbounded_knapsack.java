/**
 * File: unbounded_knapsack.java
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class unbounded_knapsack {
    /* Полный рюкзак: динамическое программирование */
    static int unboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Инициализация таблицы dp
        int[][] dp = new int[n + 1][cap + 1];
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }

    /* Полный рюкзак: динамическое программирование с оптимизацией памяти */
    static int unboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Инициализация таблицы dp
        int[] dp = new int[cap + 1];
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[c] = dp[c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }

    public static void main(String[] args) {
        int[] wgt = { 1, 2, 3 };
        int[] val = { 5, 11, 15 };
        int cap = 4;

        // Динамическое программирование
        int res = unboundedKnapsackDP(wgt, val, cap);
        System.out.println("Максимальная стоимость предметов без превышения вместимости рюкзака = " + res);

        // Динамическое программирование с оптимизацией памяти
        res = unboundedKnapsackDPComp(wgt, val, cap);
        System.out.println("Максимальная стоимость предметов без превышения вместимости рюкзака = " + res);
    }
}
