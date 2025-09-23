/**
 * File: min_cost_climbing_stairs_dp.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class min_cost_climbing_stairs_dp {
    /* 最小コスト階段登り：動的プログラミング */
    public static int minCostClimbingStairsDP(int[] cost) {
        int n = cost.length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // DPテーブルを初期化し、部分問題の解を格納するために使用
        int[] dp = new int[n + 1];
        // 初期状態：最小の部分問題の解を事前設定
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 状態遷移：小さな問題から大きな部分問題を段階的に解く
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }

    /* 最小コスト階段登り：空間最適化動的プログラミング */
    public static int minCostClimbingStairsDPComp(int[] cost) {
        int n = cost.length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = Math.min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }

    public static void main(String[] args) {
        int[] cost = { 0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1 };
        System.out.println(String.format("階段のコストリストを %s として入力", Arrays.toString(cost)));

        int res = minCostClimbingStairsDP(cost);
        System.out.println(String.format("階段を登るための最小コスト %d", res));

        res = minCostClimbingStairsDPComp(cost);
        System.out.println(String.format("階段を登るための最小コスト %d", res));
    }
}