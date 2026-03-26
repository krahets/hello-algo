/**
 * File: unbounded_knapsack.java
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class unbounded_knapsack {
    /* Неограниченный рюкзак: динамическое программирование */
    static int unboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Инициализировать таблицу dp
        int[][] dp = new int[n + 1][cap + 1];
        // Переход состояния
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, не брать предмет i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // Выбрать большее из двух вариантов: не брать или взять предмет i
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }

    /* Неограниченный рюкзак: динамическое программирование с оптимизацией памяти */
    static int unboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Инициализировать таблицу dp
        int[] dp = new int[cap + 1];
        // Переход состояния
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // Если вместимость рюкзака превышена, не брать предмет i
                    dp[c] = dp[c];
                } else {
                    // Выбрать большее из двух вариантов: не брать или взять предмет i
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
        System.out.println("Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна" + res);

        // Динамическое программирование с оптимизацией по памяти
        res = unboundedKnapsackDPComp(wgt, val, cap);
        System.out.println("Максимальная стоимость предметов, не превышающая вместимость рюкзака, равна" + res);
    }
}
