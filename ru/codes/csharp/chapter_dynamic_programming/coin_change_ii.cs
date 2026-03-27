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
        // Инициализация таблицы dp
        int[,] dp = new int[n + 1, amt + 1];
        // Инициализация первого столбца
        for (int i = 0; i <= n; i++) {
            dp[i, 0] = 1;
        }
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // Сумма двух решений: не брать или взять монету i
                    dp[i, a] = dp[i - 1, a] + dp[i, a - coins[i - 1]];
                }
            }
        }
        return dp[n, amt];
    }

    /* Размен монет II: динамическое программирование с оптимизацией памяти */
    int CoinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.Length;
        // Инициализация таблицы dp
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a];
                } else {
                    // Сумма двух решений: не брать или взять монету i
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
        Console.WriteLine("Количество комбинаций монет для набора целевой суммы = " + res);

        // Динамическое программирование с оптимизацией памяти
        res = CoinChangeIIDPComp(coins, amt);
        Console.WriteLine("Количество комбинаций монет для набора целевой суммы = " + res);
    }
}
