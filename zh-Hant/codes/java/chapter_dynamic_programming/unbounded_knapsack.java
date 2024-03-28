/**
 * File: unbounded_knapsack.java
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class unbounded_knapsack {
    /* 完全背包：動態規劃 */
    static int unboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // 初始化 dp 表
        int[][] dp = new int[n + 1][cap + 1];
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }

    /* 完全背包：空間最佳化後的動態規劃 */
    static int unboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // 初始化 dp 表
        int[] dp = new int[cap + 1];
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 若超過背包容量，則不選物品 i
                    dp[c] = dp[c];
                } else {
                    // 不選和選物品 i 這兩種方案的較大值
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }

    public static void main(String[] args) {
        int[] wgt = { 1, 2, 3 };
        int[] val = { 5, 11, 15 };
        int cap = 4;

        // 動態規劃
        int res = unboundedKnapsackDP(wgt, val, cap);
        System.out.println("不超過背包容量的最大物品價值為 " + res);

        // 空間最佳化後的動態規劃
        res = unboundedKnapsackDPComp(wgt, val, cap);
        System.out.println("不超過背包容量的最大物品價值為 " + res);
    }
}
