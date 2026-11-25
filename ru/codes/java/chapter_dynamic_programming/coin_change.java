/**
 * File: coin_change.java
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class coin_change {
    /* Размен монет: динамическое программирование */
    static int coinChangeDP(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // Инициализировать таблицу dp
        int[][] dp = new int[n + 1][amt + 1];
        // Переход: первая строка и первый столбец
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // Переход: остальные строки и столбцы
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если номинал превышает нужную сумму, не брать монету i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Взять минимум из двух вариантов: без монеты i и с ней
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }

    /* Размен монет: динамическое программирование с экономией памяти */
    static int coinChangeDPComp(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // Инициализировать таблицу dp
        int[] dp = new int[amt + 1];
        Arrays.fill(dp, MAX);
        dp[0] = 0;
        // Переход между состояниями
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если номинал превышает нужную сумму, не брать монету i
                    dp[a] = dp[a];
                } else {
                    // Взять минимум из двух вариантов: без монеты i и с ней
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }

    public static void main(String[] args) {
        int[] coins = { 1, 2, 5 };
        int amt = 4;

        // Динамическое программирование
        int res = coinChangeDP(coins, amt);
        System.out.println("Минимальное число монет для заданной суммы: " + res);

        // Динамическое программирование с экономией памяти
        res = coinChangeDPComp(coins, amt);
        System.out.println("Минимальное число монет для заданной суммы: " + res);
    }
}
