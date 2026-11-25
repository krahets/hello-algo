/**
 * File: coin_change_ii.java
 * Created Time: 2023-07-11
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class coin_change_ii {
    /* 零錢兌換 II：動態規劃 */
    static int coinChangeIIDP(int[] coins, int amt) {
        int n = coins.length;
        // 初始化 dp 表
        int[][] dp = new int[n + 1][amt + 1];
        // 初始化第一欄
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若面額超過目標金額，就不選硬幣 i
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 將不選與選取硬幣 i 兩種情況的組合數相加
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }

    /* 零錢兌換 II：空間最佳化後的動態規劃 */
    static int coinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.length;
        // 初始化 dp 表
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // 狀態轉移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 若面額超過目標金額，就不選硬幣 i
                    dp[a] = dp[a];
                } else {
                    // 將不選與選取硬幣 i 兩種情況的組合數相加
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }

    public static void main(String[] args) {
        int[] coins = { 1, 2, 5 };
        int amt = 5;

        // 動態規劃
        int res = coinChangeIIDP(coins, amt);
        System.out.println("湊出目標金額的硬幣組合數為 " + res);

        // 空間最佳化後的動態規劃
        res = coinChangeIIDPComp(coins, amt);
        System.out.println("湊出目標金額的硬幣組合數為 " + res);
    }
}
