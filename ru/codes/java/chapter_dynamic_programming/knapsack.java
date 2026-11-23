/**
 * File: knapsack.java
 * Created Time: 2023-07-10
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class knapsack {

    /* Рюкзак 0-1: полный перебор */
    static int knapsackDFS(int[] wgt, int[] val, int i, int c) {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Вернуть вариант с большей стоимостью из двух возможных
        return Math.max(no, yes);
    }

    /* Рюкзак 0-1: поиск с мемоизацией */
    static int knapsackDFSMem(int[] wgt, int[] val, int[][] mem, int i, int c) {
        // Если все предметы уже рассмотрены или в рюкзаке не осталось места, вернуть стоимость 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // Если запись уже есть, вернуть сразу
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // Если вместимость рюкзака превышена, можно только не класть предмет в рюкзак
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // Вычислить максимальную стоимость для случаев, когда предмет i не кладут и кладут
        int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Сохранить и вернуть вариант с большей стоимостью из двух решений
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }

    /* Рюкзак 0-1: динамическое программирование */
    static int knapsackDP(int[] wgt, int[] val, int cap) {
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
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }

    /* Рюкзак 0-1: динамическое программирование с оптимизацией памяти */
    static int knapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Инициализация таблицы dp
        int[] dp = new int[cap + 1];
        // Переход состояний
        for (int i = 1; i <= n; i++) {
            // Обход в обратном порядке
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // Большее из двух решений: не брать или взять предмет i
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }

    public static void main(String[] args) {
        int[] wgt = { 10, 20, 30, 40, 50 };
        int[] val = { 50, 120, 150, 210, 240 };
        int cap = 50;
        int n = wgt.length;

        // Полный перебор
        int res = knapsackDFS(wgt, val, n, cap);
        System.out.println("Максимальная стоимость предметов без превышения вместимости рюкзака = " + res);

        // Поиск с мемоизацией
        int[][] mem = new int[n + 1][cap + 1];
        for (int[] row : mem) {
            Arrays.fill(row, -1);
        }
        res = knapsackDFSMem(wgt, val, mem, n, cap);
        System.out.println("Максимальная стоимость предметов без превышения вместимости рюкзака = " + res);

        // Динамическое программирование
        res = knapsackDP(wgt, val, cap);
        System.out.println("Максимальная стоимость предметов без превышения вместимости рюкзака = " + res);

        // Динамическое программирование с оптимизацией памяти
        res = knapsackDPComp(wgt, val, cap);
        System.out.println("Максимальная стоимость предметов без превышения вместимости рюкзака = " + res);
    }
}
