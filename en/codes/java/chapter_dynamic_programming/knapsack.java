/**
 * File: knapsack.java
 * Created Time: 2023-07-10
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class knapsack {

    /* 0-1 Knapsack: Brute force search */
    static int knapsackDFS(int[] wgt, int[] val, int i, int c) {
        // If all items have been chosen or the knapsack has no remaining capacity, return value 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // If exceeding the knapsack capacity, can only choose not to put it in the knapsack
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // Calculate the maximum value of not putting in and putting in item i
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Return the greater value of the two options
        return Math.max(no, yes);
    }

    /* 0-1 Knapsack: Memoized search */
    static int knapsackDFSMem(int[] wgt, int[] val, int[][] mem, int i, int c) {
        // If all items have been chosen or the knapsack has no remaining capacity, return value 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // If there is a record, return it
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // If exceeding the knapsack capacity, can only choose not to put it in the knapsack
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // Calculate the maximum value of not putting in and putting in item i
        int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Record and return the greater value of the two options
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }

    /* 0-1 Knapsack: Dynamic programming */
    static int knapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Initialize dp table
        int[][] dp = new int[n + 1][cap + 1];
        // State transition
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // If exceeding the knapsack capacity, do not choose item i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // The greater value between not choosing and choosing item i
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }

    /* 0-1 Knapsack: Space-optimized dynamic programming */
    static int knapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // Initialize dp table
        int[] dp = new int[cap + 1];
        // State transition
        for (int i = 1; i <= n; i++) {
            // Traverse in reverse order
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // The greater value between not choosing and choosing item i
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

        // Brute force search
        int res = knapsackDFS(wgt, val, n, cap);
        System.out.println("The maximum value within the bag capacity is " + res);

        // Memoized search
        int[][] mem = new int[n + 1][cap + 1];
        for (int[] row : mem) {
            Arrays.fill(row, -1);
        }
        res = knapsackDFSMem(wgt, val, mem, n, cap);
        System.out.println("The maximum value within the bag capacity is " + res);

        // Dynamic programming
        res = knapsackDP(wgt, val, cap);
        System.out.println("The maximum value within the bag capacity is " + res);

        // Space-optimized dynamic programming
        res = knapsackDPComp(wgt, val, cap);
        System.out.println("The maximum value within the bag capacity is " + res);
    }
}
