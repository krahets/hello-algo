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
        // Переход состояния: первая строка и первый столбец
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // Переход состояния: остальные строки и столбцы
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если сумма превышает целевое значение, не брать монету i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Выбрать меньшее из двух вариантов: не брать или взять монету i
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }

    /* Размен монет: динамическое программирование с оптимизацией памяти */
    static int coinChangeDPComp(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // Инициализировать таблицу dp
        int[] dp = new int[amt + 1];
        Arrays.fill(dp, MAX);
        dp[0] = 0;
        // Переход состояния
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если сумма превышает целевое значение, не брать монету i
                    dp[a] = dp[a];
                } else {
                    // Выбрать меньшее из двух вариантов: не брать или взять монету i
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
        System.out.println("Минимальное число монет, необходимое для получения целевой суммы, равно" + res);

        // Динамическое программирование с оптимизацией по памяти
        res = coinChangeDPComp(coins, amt);
        System.out.println("Минимальное число монет, необходимое для получения целевой суммы, равно" + res);
    }
}
