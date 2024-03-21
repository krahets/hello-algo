/**
 * File: coin_change.java
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class coin_change {
    /* 零錢兌換：動態規劃 */
    static int coinChangeDP(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // 初始化 dp 表
        int[][] dp = new int[n + 1][amt + 1];
        // 狀態轉移：首行首列
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // 狀態轉移：其餘行和列
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }

    /* 零錢兌換：空間最佳化後的動態規劃 */
    static int coinChangeDPComp(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // 初始化 dp 表
        int[] dp = new int[amt + 1];
        Arrays.fill(dp, MAX);
        dp[0] = 0;
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若超過目標金額，則不選硬幣 i
                    dp[a] = dp[a];
                } else {
                    // 不選和選硬幣 i 這兩種方案的較小值
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }

    public static void main(String[] args) {
        int[] coins = { 1, 2, 5 };
        int amt = 4;

        // 動態規劃
        int res = coinChangeDP(coins, amt);
        System.out.println("湊到目標金額所需的最少硬幣數量為 " + res);

        // 空間最佳化後的動態規劃
        res = coinChangeDPComp(coins, amt);
        System.out.println("湊到目標金額所需的最少硬幣數量為 " + res);
    }
}
