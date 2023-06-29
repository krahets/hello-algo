/**
 * File: min_cost_climbing_stairs_dp.java
 * Created Time: 2023-06-30
 * Author: Krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class min_cost_climbing_stairs_dp {
    /* 爬楼梯最小代价：动态规划 */
    public static int minCostClimbingStairsDP(int[] cost) {
        int n = cost.length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int[] dp = new int[n + 1];
        dp[1] = cost[1];
        dp[2] = cost[2];
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }

    /* 爬楼梯最小代价：状态压缩后的动态规划 */
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
        System.out.println(String.format("输入楼梯的代价列表为 %s", Arrays.toString(cost)));

        int res = minCostClimbingStairsDP(cost);
        System.out.println(String.format("爬完楼梯的最低代价为 %d", res));

        res = minCostClimbingStairsDPComp(cost);
        System.out.println(String.format("爬完楼梯的最低代价为 %d", res));
    }
}
