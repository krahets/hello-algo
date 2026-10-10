/**
* File: climbing_stairs_constraint_dp.cs
* Created Time: 2023-07-03
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_constraint_dp {
    /* 制約付き階段登り：動的計画法 */
    int ClimbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // 部分問題の解を保存するために dp テーブルを初期化
        int[,] dp = new int[n + 1, 3];
        // 初期状態：最小部分問題の解をあらかじめ設定
        dp[1, 1] = 1;
        dp[1, 2] = 0;
        dp[2, 1] = 0;
        dp[2, 2] = 1;
        // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
        for (int i = 3; i <= n; i++) {
            dp[i, 1] = dp[i - 1, 2];
            dp[i, 2] = dp[i - 2, 1] + dp[i - 2, 2];
        }
        return dp[n, 1] + dp[n, 2];
    }

    [Test]
    public void Test() {
        int n = 9;
        int res = ClimbingStairsConstraintDP(n);
        Console.WriteLine($"{n} 段の階段を上る方法は全部で {res} 通り");
    }
}
