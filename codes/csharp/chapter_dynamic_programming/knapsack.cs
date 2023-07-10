/**
* File: knapsack.cs
* Created Time: 2023-07-07
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming; 

public class knapsack {
    /* 0-1 背包：暴力搜索 */
    public int knapsackDFS(int[] weight, int[] val, int i, int c) {
        // 若已选完所有物品或背包无容量，则返回价值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若超过背包容量，则只能不放入背包
        if (weight[i - 1] > c) {
            return knapsackDFS(weight, val, i - 1, c);
        }
        // 计算不放入和放入物品 i 的最大价值
        int no = knapsackDFS(weight, val, i - 1, c);
        int yes = knapsackDFS(weight, val, i - 1, c - weight[i - 1]) + val[i - 1];
        // 返回两种方案中价值更大的那一个
        return Math.Max(no, yes);
    }

    /* 0-1 背包：记忆化搜索 */
    public int knapsackDFSMem(int[] weight, int[] val, int[][] mem, int i, int c) {
        // 若已选完所有物品或背包无容量，则返回价值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若已有记录，则直接返回
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // 若超过背包容量，则只能不放入背包
        if (weight[i - 1] > c) {
            return knapsackDFSMem(weight, val, mem, i - 1, c);
        }
        // 计算不放入和放入物品 i 的最大价值
        int no = knapsackDFSMem(weight, val, mem, i - 1, c);
        int yes = knapsackDFSMem(weight, val, mem, i - 1, c - weight[i - 1]) + val[i - 1];
        // 记录并返回两种方案中价值更大的那一个
        mem[i][c] = Math.Max(no, yes);
        return mem[i][c];
    }

    /* 0-1 背包：动态规划 */
    public int knapsackDP(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // 初始化 dp 表
        int[,] dp = new int[n + 1, cap + 1];
        // 状态转移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (weight[i - 1] > c) {
                    // 若超过背包容量，则不选物品 i
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[i, c] = Math.Max(dp[i - 1, c - weight[i - 1]] + val[i - 1], dp[i - 1, c]);
                }
            }
        }
        return dp[n, cap];
    }

    /* 0-1 背包：状态压缩后的动态规划 */
    public int knapsackDPComp(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // 初始化 dp 表
        int[] dp = new int[cap + 1];
        // 状态转移
        for (int i = 1; i <= n; i++) {
            // 倒序遍历
            for (int c = cap; c > 0; c--) {
                if (weight[i - 1] > c) {
                    // 若超过背包容量，则不选物品 i
                    dp[c] = dp[c];
                } else {
                    // 不选和选物品 i 这两种方案的较大值
                    dp[c] = Math.Max(dp[c - weight[i - 1]] + val[i - 1], dp[c]);
                }
            }
        }
        return dp[cap];
    }

    [Test]
    public void Test() {
        int[] weight = { 10, 20, 30, 40, 50 };
        int[] val = { 60, 100, 120, 160, 200 };
        int cap = 50;
        int n = weight.Length;

        // 暴力搜索
        Console.WriteLine(knapsackDFS(weight, val, n, cap));

        // 记忆化搜索
        int[][] mem = new int[n + 1][];
        for (int i = 0; i <= n; i++) {
            mem[i] = new int[cap + 1];
            Array.Fill(mem[i], -1);
        }

        Console.WriteLine(knapsackDFSMem(weight, val, mem, n, cap));

        // 动态规划
        Console.WriteLine(knapsackDP(weight, val, cap));

        // 状态压缩后的动态规划
        Console.WriteLine(knapsackDPComp(weight, val, cap));
    }
}
