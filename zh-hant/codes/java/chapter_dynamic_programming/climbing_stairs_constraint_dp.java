/**
 * File: climbing_stairs_constraint_dp.java
 * Created Time: 2023-07-01
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class climbing_stairs_constraint_dp {
    /* 帶約束爬樓梯：動態規劃 */
    static int climbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // 初始化 dp 表，用於儲存子問題的解
        int[][] dp = new int[n + 1][3];
        // 初始狀態：預設最小子問題的解
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 狀態轉移：從較小子問題逐步求解較大子問題
        for (int i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsConstraintDP(n);
        System.out.println(String.format("爬 %d 階樓梯共有 %d 種方案", n, res));
    }
}
