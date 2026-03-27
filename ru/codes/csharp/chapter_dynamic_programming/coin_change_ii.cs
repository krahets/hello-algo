/**
* File: coin_change_ii.cs
* Created Time: 2023-07-12
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class coin_change_ii {
    /* Размен монет II: динамическое программирование */
    int CoinChangeIIDP(int[] coins, int amt) {
        int n = coins.Length;
        // Инициализировать таблицу dp
        int[,] dp = new int[n + 1, amt + 1];
        // Инициализировать первый столбец
        for (int i = 0; i <= n; i++) {
            dp[i, 0] = 1;
        }
        // Переход состояния
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если сумма превышает целевое значение, не брать монету i
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // Сумма двух вариантов: не выбирать монету i и выбрать монету i
                    dp[i, a] = dp[i - 1, a] + dp[i, a - coins[i - 1]];
                }
            }
        }
        return dp[n, amt];
    }

    /* Размен монет II: динамическое программирование с оптимизацией памяти */
    int CoinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.Length;
        // Инициализировать таблицу dp
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // Переход состояния
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если сумма превышает целевое значение, не брать монету i
                    dp[a] = dp[a];
                } else {
                    // Сумма двух вариантов: не выбирать монету i и выбрать монету i
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }

    [Test]
    public void Test() {
        int[] coins = [1, 2, 5];
        int amt = 5;

        // Динамическое программирование
        int res = CoinChangeIIDP(coins, amt);
        Console.WriteLine("Количество комбинаций монет для получения целевой суммы равно " + res);

        // Динамическое программирование с оптимизацией по памяти
        res = CoinChangeIIDPComp(coins, amt);
        Console.WriteLine("Количество комбинаций монет для получения целевой суммы равно " + res);
    }
}
