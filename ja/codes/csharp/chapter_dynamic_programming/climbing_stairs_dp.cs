/**
* File: climbing_stairs_dp.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_dp {
    /* 階段登り：動的計画法 */
    int ClimbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // 部分問題の解を保存するために dp テーブルを初期化
        int[] dp = new int[n + 1];
        // 初期状態：最小部分問題の解をあらかじめ設定
        dp[1] = 1;
        dp[2] = 2;
        // 状態遷移：小さい部分問題から大きい部分問題へ順に解く
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }

    /* 階段登り：空間最適化した動的計画法 */
    int ClimbingStairsDPComp(int n) {
        if (n == 1 || n == 2)
            return n;
        int a = 1, b = 2;
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }

    [Test]
    public void Test() {
        int n = 9;

        int res = ClimbingStairsDP(n);
        Console.WriteLine($"{n} 段の階段を上る方法は全部で {res} 通り");

        res = ClimbingStairsDPComp(n);
        Console.WriteLine($"{n} 段の階段を上る方法は全部で {res} 通り");
    }
}
