/**
* File: knapsack.cs
* Created Time: 2023-07-07
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class knapsack {
    /* 0-1 knapsack with brute-force search */
    int KnapsackDFS(int[] weight, int[] val, int i, int c) {
        // Return a value of 0 if all items have been considered or no capacity remains
        if (i == 0 || c == 0) {
            return 0;
        }
        // If the item exceeds the remaining capacity, we can only skip it
        if (weight[i - 1] > c) {
            return KnapsackDFS(weight, val, i - 1, c);
        }
        // Compute the maximum values for skipping and taking item i
        int no = KnapsackDFS(weight, val, i - 1, c);
        int yes = KnapsackDFS(weight, val, i - 1, c - weight[i - 1]) + val[i - 1];
        // Return the larger of the two values
        return Math.Max(no, yes);
    }

    /* 0-1 knapsack with memoized search */
    int KnapsackDFSMem(int[] weight, int[] val, int[][] mem, int i, int c) {
        // Return a value of 0 if all items have been considered or no capacity remains
        if (i == 0 || c == 0) {
            return 0;
        }
        // Return the cached result if available
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // If the item exceeds the remaining capacity, we can only skip it
        if (weight[i - 1] > c) {
            return KnapsackDFSMem(weight, val, mem, i - 1, c);
        }
        // Compute the maximum values for skipping and taking item i
        int no = KnapsackDFSMem(weight, val, mem, i - 1, c);
        int yes = KnapsackDFSMem(weight, val, mem, i - 1, c - weight[i - 1]) + val[i - 1];
        // Cache and return the larger of the two values
        mem[i][c] = Math.Max(no, yes);
        return mem[i][c];
    }

    /* 0-1 knapsack with dynamic programming */
    int KnapsackDP(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // Initialize the dp table
        int[,] dp = new int[n + 1, cap + 1];
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (weight[i - 1] > c) {
                    // Skip item i if its weight exceeds the capacity
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // Take the larger value from skipping or taking item i
                    dp[i, c] = Math.Max(dp[i - 1, c - weight[i - 1]] + val[i - 1], dp[i - 1, c]);
                }
            }
        }
        return dp[n, cap];
    }

    /* 0-1 knapsack with space-optimized dynamic programming */
    int KnapsackDPComp(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // Initialize the dp table
        int[] dp = new int[cap + 1];
        // State transition
        for (int i = 1; i <= n; i++) {
            // Iterate in descending order
            for (int c = cap; c > 0; c--) {
                if (weight[i - 1] > c) {
                    // Skip item i if its weight exceeds the capacity
                    dp[c] = dp[c];
                } else {
                    // Take the larger value from skipping or taking item i
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

        // Brute-force search
        int res = KnapsackDFS(weight, val, n, cap);
        Console.WriteLine("Maximum total item value within the weight limit: " + res);

        // Memoized search
        int[][] mem = new int[n + 1][];
        for (int i = 0; i <= n; i++) {
            mem[i] = new int[cap + 1];
            Array.Fill(mem[i], -1);
        }
        res = KnapsackDFSMem(weight, val, mem, n, cap);
        Console.WriteLine("Maximum total item value within the weight limit: " + res);

        // Dynamic programming
        res = KnapsackDP(weight, val, cap);
        Console.WriteLine("Maximum total item value within the weight limit: " + res);

        // Space-optimized dynamic programming
        res = KnapsackDPComp(weight, val, cap);
        Console.WriteLine("Maximum total item value within the weight limit: " + res);
    }
}
