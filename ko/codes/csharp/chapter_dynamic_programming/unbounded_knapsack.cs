/**
* File: unbounded_knapsack.cs
* Created Time: 2023-07-12
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class unbounded_knapsack {
    /* 무한 배낭: 동적 계획법 */
    int UnboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.Length;
        // dp 테이블을 초기화한다
        int[,] dp = new int[n + 1, cap + 1];
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[i, c] = Math.Max(dp[i - 1, c], dp[i, c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n, cap];
    }

    /* 무한 배낭: 공간을 최적화한 동적 계획법 */
    int UnboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.Length;
        // dp 테이블을 초기화한다
        int[] dp = new int[cap + 1];
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[c] = dp[c];
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[c] = Math.Max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }

    [Test]
    public void Test() {
        int[] wgt = [1, 2, 3];
        int[] val = [5, 11, 15];
        int cap = 4;

        // 동적 계획법
        int res = UnboundedKnapsackDP(wgt, val, cap);
        Console.WriteLine("배낭 용량을 초과하지 않는 물건의 최대 가치: " + res);

        // 공간을 최적화한 동적 계획법
        res = UnboundedKnapsackDPComp(wgt, val, cap);
        Console.WriteLine("배낭 용량을 초과하지 않는 물건의 최대 가치: " + res);
    }
}
