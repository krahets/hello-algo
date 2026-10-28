/**
 * File: climbing_stairs_dp.java
 * Created Time: 2023-06-30
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

public class climbing_stairs_dp {
    /* 계단 오르기: 동적 계획법 */
    public static int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
        int[] dp = new int[n + 1];
        // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
        dp[1] = 1;
        dp[2] = 2;
        // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }

    /* 계단 오르기: 공간을 최적화한 동적 계획법 */
    public static int climbingStairsDPComp(int n) {
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

    public static void main(String[] args) {
        int n = 9;

        int res = climbingStairsDP(n);
        System.out.println(String.format("%d개의 계단을 오르는 방법은 총 %d가지이다", n, res));

        res = climbingStairsDPComp(n);
        System.out.println(String.format("%d개의 계단을 오르는 방법은 총 %d가지이다", n, res));
    }
}
