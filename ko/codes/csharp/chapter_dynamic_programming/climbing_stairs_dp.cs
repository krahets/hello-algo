/**
* File: climbing_stairs_dp.cs
* Created Time: 2023-06-30
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_dp {
    /* 계단 오르기: 동적 계획법 */
    int ClimbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // 부분 문제의 해를 저장할 dp 테이블 초기화
        int[] dp = new int[n + 1];
        // 초기 상태: 가장 작은 부분 문제의 해를 설정한다
        dp[1] = 1;
        dp[2] = 2;
        // 상태 전이: 작은 부분 문제부터 큰 부분 문제까지 차례로 푼다
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }

    /* 계단 오르기: 공간 최적화 동적 계획법 */
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
        Console.WriteLine($"계단 {n}개를 오르는 방법은 {res}가지");

        res = ClimbingStairsDPComp(n);
        Console.WriteLine($"계단 {n}개를 오르는 방법은 {res}가지");
    }
}
