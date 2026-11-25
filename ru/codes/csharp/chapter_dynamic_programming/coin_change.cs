/**
* File: coin_change.cs
* Created Time: 2023-07-12
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class coin_change {
    /* Размен монет: динамическое программирование */
    int CoinChangeDP(int[] coins, int amt) {
        int n = coins.Length;
        int MAX = amt + 1;
        // Инициализировать таблицу dp
        int[,] dp = new int[n + 1, amt + 1];
        // Переход: первая строка и первый столбец
        for (int a = 1; a <= amt; a++) {
            dp[0, a] = MAX;
        }
        // Переход: остальные строки и столбцы
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если номинал превышает нужную сумму, не брать монету i
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // Взять минимум из двух вариантов: без монеты i и с ней
                    dp[i, a] = Math.Min(dp[i - 1, a], dp[i, a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n, amt] != MAX ? dp[n, amt] : -1;
    }

    /* Размен монет: динамическое программирование с экономией памяти */
    int CoinChangeDPComp(int[] coins, int amt) {
        int n = coins.Length;
        int MAX = amt + 1;
        // Инициализировать таблицу dp
        int[] dp = new int[amt + 1];
        Array.Fill(dp, MAX);
        dp[0] = 0;
        // Переход между состояниями
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если номинал превышает нужную сумму, не брать монету i
                    dp[a] = dp[a];
                } else {
                    // Взять минимум из двух вариантов: без монеты i и с ней
                    dp[a] = Math.Min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }

    [Test]
    public void Test() {
        int[] coins = [1, 2, 5];
        int amt = 4;

        // Динамическое программирование
        int res = CoinChangeDP(coins, amt);
        Console.WriteLine("Минимальное число монет для заданной суммы: " + res);

        // Динамическое программирование с экономией памяти
        res = CoinChangeDPComp(coins, amt);
        Console.WriteLine("Минимальное число монет для заданной суммы: " + res);
    }
}
