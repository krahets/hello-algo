/**
 * File: coin_change.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 최솟값 구하기 */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* 동전 교환: 동적 계획법 */
int coinChangeDP(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    int MAX = amt + 1;
    // dp 테이블을 초기화한다
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(amt + 1, sizeof(int));
    }
    // 상태 전이: 첫 번째 행과 첫 번째 열
    for (int a = 1; a <= amt; a++) {
        dp[0][a] = MAX;
    }
    // 상태 전이: 나머지 행과 열
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[i][a] = dp[i - 1][a];
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                dp[i][a] = myMin(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
            }
        }
    }
    int res = dp[n][amt] != MAX ? dp[n][amt] : -1;
    // 메모리 해제
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    free(dp);
    return res;
}

/* 동전 교환: 공간을 최적화한 동적 계획법 */
int coinChangeDPComp(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    int MAX = amt + 1;
    // dp 테이블을 초기화한다
    int *dp = malloc((amt + 1) * sizeof(int));
    for (int j = 1; j <= amt; j++) {
        dp[j] = MAX;
    } 
    dp[0] = 0;

    // 상태 전이
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[a] = dp[a];
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                dp[a] = myMin(dp[a], dp[a - coins[i - 1]] + 1);
            }
        }
    }
    int res = dp[amt] != MAX ? dp[amt] : -1;
    // 메모리 해제
    free(dp);
    return res;
}

/* 실행 코드 */
int main() {
    int coins[] = {1, 2, 5};
    int coinsSize = sizeof(coins) / sizeof(coins[0]);
    int amt = 4;

    // 동적 계획법
    int res = coinChangeDP(coins, amt, coinsSize);
    printf("목표 금액을 만드는 데 필요한 최소 동전 개수는 %d이다\n", res);

    // 공간을 최적화한 동적 계획법
    res = coinChangeDPComp(coins, amt, coinsSize);
    printf("목표 금액을 만드는 데 필요한 최소 동전 개수는 %d이다\n", res);

    return 0;
}
