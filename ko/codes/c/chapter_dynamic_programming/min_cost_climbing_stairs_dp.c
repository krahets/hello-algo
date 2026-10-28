/**
 * File: min_cost_climbing_stairs_dp.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 최솟값 구하기 */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* 계단 오르기의 최소 비용: 동적 계획법 */
int minCostClimbingStairsDP(int cost[], int costSize) {
    int n = costSize - 1;
    if (n == 1 || n == 2)
        return cost[n];
    // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
    int *dp = calloc(n + 1, sizeof(int));
    // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
    dp[1] = cost[1];
    dp[2] = cost[2];
    // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
    for (int i = 3; i <= n; i++) {
        dp[i] = myMin(dp[i - 1], dp[i - 2]) + cost[i];
    }
    int res = dp[n];
    // 메모리 해제
    free(dp);
    return res;
}

/* 계단 오르기의 최소 비용: 공간을 최적화한 동적 계획법 */
int minCostClimbingStairsDPComp(int cost[], int costSize) {
    int n = costSize - 1;
    if (n == 1 || n == 2)
        return cost[n];
    int a = cost[1], b = cost[2];
    for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = myMin(a, tmp) + cost[i];
        a = tmp;
    }
    return b;
}

/* 실행 코드 */
int main() {
    int cost[] = {0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1};
    int costSize = sizeof(cost) / sizeof(cost[0]);
    printf("입력한 계단의 비용 리스트:");
    printArray(cost, costSize);

    int res = minCostClimbingStairsDP(cost, costSize);
    printf("계단을 끝까지 오르는 최소 비용은 %d이다\n", res);

    res = minCostClimbingStairsDPComp(cost, costSize);
    printf("계단을 끝까지 오르는 최소 비용은 %d이다\n", res);

    return 0;
}
