/**
 * File: knapsack.java
 * Created Time: 2023-07-10
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class knapsack {

    /* 0-1 背包：暴力搜尋 */
    static int knapsackDFS(int[] wgt, int[] val, int i, int c) {
        // 若已考慮所有物品，或背包沒有剩餘容量，就回傳價值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若重量超過背包容量，就只能選擇不放入
        if (wgt[i - 1] > c) {
            return knapsackDFS(wgt, val, i - 1, c);
        }
        // 分別計算不放入與放入物品 i 可取得的最大價值
        int no = knapsackDFS(wgt, val, i - 1, c);
        int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 回傳兩種選法中較大的價值
        return Math.max(no, yes);
    }

    /* 0-1 背包：記憶化搜尋 */
    static int knapsackDFSMem(int[] wgt, int[] val, int[][] mem, int i, int c) {
        // 若已考慮所有物品，或背包沒有剩餘容量，就回傳價值 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // 若已有紀錄，直接回傳該值
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // 若重量超過背包容量，就只能選擇不放入
        if (wgt[i - 1] > c) {
            return knapsackDFSMem(wgt, val, mem, i - 1, c);
        }
        // 分別計算不放入與放入物品 i 可取得的最大價值
        int no = knapsackDFSMem(wgt, val, mem, i - 1, c);
        int yes = knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // 記錄並回傳兩種選法中較大的價值
        mem[i][c] = Math.max(no, yes);
        return mem[i][c];
    }

    /* 0-1 背包：動態規劃 */
    static int knapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // 初始化 dp 表
        int[][] dp = new int[n + 1][cap + 1];
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若重量超過背包容量，就不選物品 i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 取不選與選取物品 i 兩種情況中的較大值
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }

    /* 0-1 背包：空間最佳化後的動態規劃 */
    static int knapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // 初始化 dp 表
        int[] dp = new int[cap + 1];
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            // 反向走訪
            for (int c = cap; c >= 1; c--) {
                if (wgt[i - 1] <= c) {
                    // 取不選與選取物品 i 兩種情況中的較大值
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

        // 暴力搜尋
        int res = knapsackDFS(wgt, val, n, cap);
        System.out.println("在背包容量限制內，物品的最大總價值為 " + res);

        // 記憶化搜尋
        int[][] mem = new int[n + 1][cap + 1];
        for (int[] row : mem) {
            Arrays.fill(row, -1);
        }
        res = knapsackDFSMem(wgt, val, mem, n, cap);
        System.out.println("在背包容量限制內，物品的最大總價值為 " + res);

        // 動態規劃
        res = knapsackDP(wgt, val, cap);
        System.out.println("在背包容量限制內，物品的最大總價值為 " + res);

        // 空間最佳化後的動態規劃
        res = knapsackDPComp(wgt, val, cap);
        System.out.println("在背包容量限制內，物品的最大總價值為 " + res);
    }
}
