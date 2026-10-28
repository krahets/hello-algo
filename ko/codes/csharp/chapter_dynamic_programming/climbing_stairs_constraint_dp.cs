/**
* File: climbing_stairs_constraint_dp.cs
* Created Time: 2023-07-03
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_dynamic_programming;

public class climbing_stairs_constraint_dp {
    /* 제약 조건이 있는 계단 오르기: 동적 계획법 */
    int ClimbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        int[,] dp = new int[n + 1, 3];
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1, 1] = 1;
        dp[1, 2] = 0;
        dp[2, 1] = 0;
        dp[2, 2] = 1;
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
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
        Console.WriteLine($"{n}개의 계단을 오르는 방법은 총 {res}가지이다");
    }
}
