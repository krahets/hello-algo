/**
 * File: climbing_stairs_dp.c
 * Created Time: 2023-09-19
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* 계단 오르기: 동적 계획법 */
int climbingStairsDP(int n) {
    if (n == 1 || n == 2)
        return n;
    // 부분 문제의 해를 저장할 dp 테이블 초기화
    int *dp = (int *)malloc((n + 1) * sizeof(int));
    // 초기 상태: 가장 작은 부분 문제의 해를 설정한다
    dp[1] = 1;
    dp[2] = 2;
    // 상태 전이: 작은 부분 문제부터 큰 부분 문제까지 차례로 푼다
    for (int i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    int result = dp[n];
    free(dp);
    return result;
}

/* 계단 오르기: 공간 최적화 동적 계획법 */
int climbingStairsDPComp(int n) {
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

/* 실행 예제 */
int main() {
    int n = 9;

    int res = climbingStairsDP(n);
    printf("계단 %d개를 오르는 방법은 %d가지\n", n, res);

    res = climbingStairsDPComp(n);
    printf("계단 %d개를 오르는 방법은 %d가지\n", n, res);

    return 0;
}