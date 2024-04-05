/**
* File: knapsack.cs
* Created Time: 2023-07-07
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class knapsack {
    /* 0-1 背包：暴力搜尋 */
    int KnapsackDFS(int[] weight, int[] val, int i, int c) {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若超過背包容量，則只能選擇不放入背包
        if (weight[i - 1] > c) {
            return KnapsackDFS(weight, val, i - 1, c);
        }
        // 計算不放入和放入物品 i 的最大價值
        int no = KnapsackDFS(weight, val, i - 1, c);
        int yes = KnapsackDFS(weight, val, i - 1, c - weight[i - 1]) + val[i - 1];
        // 返回兩種方案中價值更大的那一個
        return Math.Max(no, yes);
    }

    /* 0-1 背包：記憶化搜尋 */
    int KnapsackDFSMem(int[] weight, int[] val, int[][] mem, int i, int c) {
        // 若已選完所有物品或背包無剩餘容量，則返回價值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若已有記錄，則直接返回
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // 若超過背包容量，則只能選擇不放入背包
        if (weight[i - 1] > c) {
            return KnapsackDFSMem(weight, val, mem, i - 1, c);
        }
        // 計算不放入和放入物品 i 的最大價值
        int no = KnapsackDFSMem(weight, val, mem, i - 1, c);
        int yes = KnapsackDFSMem(weight, val, mem, i - 1, c - weight[i - 1]) + val[i - 1];
        // 記錄並返回兩種方案中價值更大的那一個
        mem[i][c] = Math.Max(no, yes);
        return mem[i][c];
    }

    /* 0-1 背包：動態規劃 */
    int KnapsackDP(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // 初始化 dp 表
        int[,] dp = new int[n + 1, cap + 1];
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (weight[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[i, c] = Math.Max(dp[i - 1, c - weight[i - 1]] + val[i - 1], dp[i - 1, c]);
                }
            }
        }
        return dp[n, cap];
    }

    /* 0-1 背包：空間最佳化後的動態規劃 */
    int KnapsackDPComp(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // 初始化 dp 表
        int[] dp = new int[cap + 1];
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            // 倒序走訪
            for (int c = cap; c > 0; c--) {
                if (weight[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[c] = dp[c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
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

        // 暴力搜尋
        int res = KnapsackDFS(weight, val, n, cap);
        Console.WriteLine("不超過背包容量的最大物品價值為 " + res);

        // 記憶化搜尋
        int[][] mem = new int[n + 1][];
        for (int i = 0; i <= n; i++) {
            mem[i] = new int[cap + 1];
            Array.Fill(mem[i], -1);
        }
        res = KnapsackDFSMem(weight, val, mem, n, cap);
        Console.WriteLine("不超過背包容量的最大物品價值為 " + res);

        // 動態規劃
        res = KnapsackDP(weight, val, cap);
        Console.WriteLine("不超過背包容量的最大物品價值為 " + res);

        // 空間最佳化後的動態規劃
        res = KnapsackDPComp(weight, val, cap);
        Console.WriteLine("不超過背包容量的最大物品價值為 " + res);
    }
}
