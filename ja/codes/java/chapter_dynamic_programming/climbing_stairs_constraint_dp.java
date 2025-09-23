/**
 * File: climbing_stairs_constraint_dp.java
 * Created Time: 2023-07-01
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class climbing_stairs_constraint_dp {
    /* 制約付き階段登り：動的プログラミング */
    static int climbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // DPテーブルを初期化し、部分問題の解を格納するために使用
        int[][] dp = new int[n + 1][3];
        // 初期状態：最小の部分問題の解を事前設定
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 状態遷移：小さな問題から大きな部分問題を段階的に解く
        for (int i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsConstraintDP(n);
        System.out.println(String.format("%d段の階段を登る解は%d通りです", n, res));
    }
}