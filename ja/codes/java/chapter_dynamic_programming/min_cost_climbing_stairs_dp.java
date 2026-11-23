/**
 * File: min_cost_climbing_stairs_dp.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class min_cost_climbing_stairs_dp {
    /* 階段を上る最小コスト：動的計画法 */
    public static int minCostClimbingStairsDP(int[] cost) {
        int n = cost.length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // 部分問題の解を格納する dp テーブルを初期化する
        int[] dp = new int[n + 1];
        // 初期状態：最小の部分問題の解を設定する
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }

    /* 階段を上る最小コスト：空間を最適化した動的計画法 */
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
        System.out.println(String.format("入力した階段のコストのリストは %s", Arrays.toString(cost)));

        int res = minCostClimbingStairsDP(cost);
        System.out.println(String.format("階段を上り終える最小コストは %d", res));

        res = minCostClimbingStairsDPComp(cost);
        System.out.println(String.format("階段を上り終える最小コストは %d", res));
    }
}
