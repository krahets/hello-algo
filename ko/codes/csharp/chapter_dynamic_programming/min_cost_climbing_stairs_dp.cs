/**
* File: min_cost_climbing_stairs_dp.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class min_cost_climbing_stairs_dp {
    /* 계단 오르기의 최소 비용: 동적 계획법 */
    int MinCostClimbingStairsDP(int[] cost) {
        int n = cost.Length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        int[] dp = new int[n + 1];
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.Min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }

    /* 계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법 */
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
        Console.WriteLine("입력한 계단의 비용 리스트:");
        PrintUtil.PrintList(cost);

        int res = MinCostClimbingStairsDP(cost);
        Console.WriteLine($"계단을 모두 오르는 최소 비용은 {res}이다");

        res = MinCostClimbingStairsDPComp(cost);
        Console.WriteLine($"계단을 모두 오르는 최소 비용은 {res}이다");
    }
}
