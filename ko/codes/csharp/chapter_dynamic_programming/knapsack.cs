/**
* File: knapsack.cs
* Created Time: 2023-07-07
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class knapsack {
    /* 0-1 배낭: 완전 탐색 */
    int KnapsackDFS(int[] weight, int[] val, int i, int c) {
        // 모든 물건의 선택을 마쳤거나 배낭에 남은 용량이 없으면 가치 0을 반환한다
        if (i == 0 || c == 0) {
            return 0;
        }
        // 배낭 용량을 초과하면 배낭에 넣지 않는 선택만 가능하다
        if (weight[i - 1] > c) {
            return KnapsackDFS(weight, val, i - 1, c);
        }
        // 물건 i를 넣지 않는 경우와 넣는 경우의 최대 가치를 계산한다
        int no = KnapsackDFS(weight, val, i - 1, c);
        int yes = KnapsackDFS(weight, val, i - 1, c - weight[i - 1]) + val[i - 1];
        // 두 경우 중 더 큰 가치를 반환한다
        return Math.Max(no, yes);
    }

    /* 0-1 배낭: 메모이제이션을 이용한 탐색 */
    int KnapsackDFSMem(int[] weight, int[] val, int[][] mem, int i, int c) {
        // 모든 물건의 선택을 마쳤거나 배낭에 남은 용량이 없으면 가치 0을 반환한다
        if (i == 0 || c == 0) {
            return 0;
        }
        // 기록이 이미 있으면 바로 반환한다
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // 배낭 용량을 초과하면 배낭에 넣지 않는 선택만 가능하다
        if (weight[i - 1] > c) {
            return KnapsackDFSMem(weight, val, mem, i - 1, c);
        }
        // 물건 i를 넣지 않는 경우와 넣는 경우의 최대 가치를 계산한다
        int no = KnapsackDFSMem(weight, val, mem, i - 1, c);
        int yes = KnapsackDFSMem(weight, val, mem, i - 1, c - weight[i - 1]) + val[i - 1];
        // 두 경우 중 더 큰 가치를 기록하고 반환한다
        mem[i][c] = Math.Max(no, yes);
        return mem[i][c];
    }

    /* 0-1 배낭: 동적 계획법 */
    int KnapsackDP(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // dp 테이블을 초기화한다
        int[,] dp = new int[n + 1, cap + 1];
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (weight[i - 1] > c) {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[i, c] = dp[i - 1, c];
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[i, c] = Math.Max(dp[i - 1, c - weight[i - 1]] + val[i - 1], dp[i - 1, c]);
                }
            }
        }
        return dp[n, cap];
    }

    /* 0-1 배낭: 공간을 최적화한 동적 계획법 */
    int KnapsackDPComp(int[] weight, int[] val, int cap) {
        int n = weight.Length;
        // dp 테이블을 초기화한다
        int[] dp = new int[cap + 1];
        // 상태 전이
        for (int i = 1; i <= n; i++) {
            // 역방향 순회
            for (int c = cap; c > 0; c--) {
                if (weight[i - 1] > c) {
                    // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                    dp[c] = dp[c];
                } else {
                    // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                    dp[c] = Math.Max(dp[c], dp[c - weight[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }

    [Test]
    public void Test() {
        int[] weight = [10, 20, 30, 40, 50];
        int[] val = [50, 120, 150, 210, 240];
        int cap = 50;
        int n = weight.Length;

        // 완전 탐색
        int res = KnapsackDFS(weight, val, n, cap);
        Console.WriteLine("배낭 용량을 초과하지 않는 물건의 최대 가치: " + res);

        // 메모이제이션을 이용한 탐색
        int[][] mem = new int[n + 1][];
        for (int i = 0; i <= n; i++) {
            mem[i] = new int[cap + 1];
            Array.Fill(mem[i], -1);
        }
        res = KnapsackDFSMem(weight, val, mem, n, cap);
        Console.WriteLine("배낭 용량을 초과하지 않는 물건의 최대 가치: " + res);

        // 동적 계획법
        res = KnapsackDP(weight, val, cap);
        Console.WriteLine("배낭 용량을 초과하지 않는 물건의 최대 가치: " + res);

        // 공간을 최적화한 동적 계획법
        res = KnapsackDPComp(weight, val, cap);
        Console.WriteLine("배낭 용량을 초과하지 않는 물건의 최대 가치: " + res);
    }
}
