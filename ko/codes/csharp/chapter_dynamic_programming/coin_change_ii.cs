/**
* File: coin_change_ii.cs
* Created Time: 2023-07-12
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class coin_change_ii {
    /* 동전 교환 II: 동적 계획법 */
    int CoinChangeIIDP(int[] coins, int amt) {
        int n = coins.Length;
        // dp 테이블을 초기화한다
        int[,] dp = new int[n + 1, amt + 1];
        // 첫 번째 열을 초기화한다
        for (int i = 0; i <= n; i++) {
            dp[i, 0] = 1;
        }
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[i, a] = dp[i - 1, a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[i, a] = dp[i - 1, a] + dp[i, a - coins[i - 1]];
                }
            }
        }
        return dp[n, amt];
    }

    /* 동전 교환 II: 공간을 최적화한 동적 계획법 */
    int CoinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.Length;
        // dp 테이블을 초기화한다
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                    dp[a] = dp[a];
                } else {
                    // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }

    [Test]
    public void Test() {
        int[] coins = [1, 2, 5];
        int amt = 5;

        // 동적 계획법
        int res = CoinChangeIIDP(coins, amt);
        Console.WriteLine("목표 금액을 만드는 동전 조합의 수: " + res);

        // 공간을 최적화한 동적 계획법
        res = CoinChangeIIDPComp(coins, amt);
        Console.WriteLine("목표 금액을 만드는 동전 조합의 수: " + res);
    }
}
