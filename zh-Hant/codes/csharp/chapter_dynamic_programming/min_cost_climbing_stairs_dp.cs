/**
* File: min_cost_climbing_stairs_dp.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class min_cost_climbing_stairs_dp {
    /* 爬樓梯最小代價：動態規劃 */
    int MinCostClimbingStairsDP(int[] cost) {
        int n = cost.Length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // 初始化 dp 表，用於儲存子問題的解
        int[] dp = new int[n + 1];
        // 初始狀態：預設最小子問題的解
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 狀態轉移：從較小子問題逐步求解較大子問題
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.Min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }

    /* 爬樓梯最小代價：空間最佳化後的動態規劃 */
    int MinCostClimbingStairsDPComp(int[] cost) {
        int n = cost.Length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = Math.Min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }

    [Test]
    public void Test() {
        int[] cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
        Console.WriteLine("輸入樓梯的代價串列為");
        PrintUtil.PrintList(cost);

        int res = MinCostClimbingStairsDP(cost);
        Console.WriteLine($"爬完樓梯的最低代價為 {res}");

        res = MinCostClimbingStairsDPComp(cost);
        Console.WriteLine($"爬完樓梯的最低代價為 {res}");
    }
}
