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
        // Инициализация таблицы dp
        int[,] dp = new int[n + 1, amt + 1];
        // Переход состояний: первая строка и первый столбец
        for (int a = 1; a <= amt; a++) {
            dp[0, a] = MAX;
        }
        // Переход состояний: остальные строки и столбцы
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
                    dp[i, a] = Math.Min(dp[i - 1, a], dp[i, a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n, amt] != MAX ? dp[n, amt] : -1;
    }

    /* Размен монет: динамическое программирование с оптимизацией памяти */
    int CoinChangeDPComp(int[] coins, int amt) {
        int n = coins.Length;
        int MAX = amt + 1;
        // Инициализация таблицы dp
        int[] dp = new int[amt + 1];
        Array.Fill(dp, MAX);
        dp[0] = 0;
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // Если целевая сумма превышена, монету i не выбирать
                    dp[a] = dp[a];
                } else {
                    // Меньшее из двух решений: не брать или взять монету i
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
        Console.WriteLine("Минимальное число монет для набора целевой суммы = " + res);

        // Динамическое программирование с оптимизацией памяти
        res = CoinChangeDPComp(coins, amt);
        Console.WriteLine("Минимальное число монет для набора целевой суммы = " + res);
    }
}
