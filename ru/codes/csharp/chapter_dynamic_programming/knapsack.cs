/**
* File: knapsack.cs
* Created Time: 2023-07-07
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class knapsack {
    /* Рюкзак 0-1: полный перебор */
    int KnapsackDFS(int[] weight, int[] val, int i, int c) {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if (weight[i - 1] > c) {
            return KnapsackDFS(weight, val, i - 1, c);
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        int no = KnapsackDFS(weight, val, i - 1, c);
        int yes = KnapsackDFS(weight, val, i - 1, c - weight[i - 1]) + val[i - 1];
        // Вернуть вариант с большей стоимостью из двух возможных
        return Math.Max(no, yes);
    }

    /* Рюкзак 0-1: поиск с мемоизацией */
    int KnapsackDFSMem(int[] weight, int[] val, int[][] mem, int i, int c) {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // Если запись уже есть, вернуть сразу
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if (weight[i - 1] > c) {
            return KnapsackDFSMem(weight, val, mem, i - 1, c);
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        int no = KnapsackDFSMem(weight, val, mem, i - 1, c);
        int yes = KnapsackDFSMem(weight, val, mem, i - 1, c - weight[i - 1]) + val[i - 1];
        // Сохранить и вернуть вариант с большей стоимостью из двух решений
        mem[i][c] = Math.Max(no, yes);
        return mem[i][c];
    }

    /* Рюкзак 0-1: динамическое программирование */
    int KnapsackDP(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // Инициализация таблицы dp
        int[,] dp = new int[n + 1, cap + 1];
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (weight[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[i, c] = Math.Max(dp[i - 1, c - weight[i - 1]] + val[i - 1], dp[i - 1, c]);
                }
            }
        }
        return dp[n, cap];
    }

    /* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
    int KnapsackDPComp(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // Инициализация таблицы dp
        int[] dp = new int[cap + 1];
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            // Обход в обратном порядке
            for (int c = cap; c > 0; c--) {
                if (weight[i - 1] > c) {
                    // Если вместимость рюкзака превышена, предмет i не выбирать
                    dp[c] = dp[c];
                } else {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = Math.Max(dp[c], dp[c - weight[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }

    [Test]
    public void Test() {
        int[] weight = [10, 20, 30, 40, 50];
        int[] val = [50, 120, 150, 210, 240];
        int cap = 50;
        int n = weight.Length;

        // Полный перебор
        int res = KnapsackDFS(weight, val, n, cap);
        Console.WriteLine("Максимальная стоимость предметов без превышения вместимости рюкзака = " + res);

        // Поиск с мемоизацией
        int[][] mem = new int[n + 1][];
        for (int i = 0; i <= n; i++) {
            mem[i] = new int[cap + 1];
            Array.Fill(mem[i], -1);
        }
        res = KnapsackDFSMem(weight, val, mem, n, cap);
        Console.WriteLine("Максимальная стоимость предметов без превышения вместимости рюкзака = " + res);

        // Динамическое программирование
        res = KnapsackDP(weight, val, cap);
        Console.WriteLine("Максимальная стоимость предметов без превышения вместимости рюкзака = " + res);

        // Динамическое программирование с оптимизацией памяти
        res = KnapsackDPComp(weight, val, cap);
        Console.WriteLine("Максимальная стоимость предметов без превышения вместимости рюкзака = " + res);
    }
}
