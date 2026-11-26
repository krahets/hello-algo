/**
 * File: coin_change_ii.java
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class coin_change_ii {
    /* Размен монет II: динамическое программирование */
    static int coinChangeIIDP(int[] coins, int amt) {
        int n = coins.length;
        // Инициализировать таблицу dp
        int[][] dp = new int[n + 1][amt + 1];
        // Инициализировать первый столбец
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // Переход между состояниями
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если номинал превышает нужную сумму, не брать монету i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Сложить число комбинаций без монеты i и с ней
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }

    /* Размен монет II: динамическое программирование с экономией памяти */
    static int coinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.length;
        // Инициализировать таблицу dp
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // Переход между состояниями
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если номинал превышает нужную сумму, не брать монету i
                    dp[a] = dp[a];
                } else {
                    // Сложить число комбинаций без монеты i и с ней
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }

    public static void main(String[] args) {
        int[] coins = { 1, 2, 5 };
        int amt = 5;

        // Динамическое программирование
        int res = coinChangeIIDP(coins, amt);
        System.out.println("Число комбинаций монет для заданной суммы: " + res);

        // Динамическое программирование с экономией памяти
        res = coinChangeIIDPComp(coins, amt);
        System.out.println("Число комбинаций монет для заданной суммы: " + res);
    }
}
