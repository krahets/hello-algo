/**
 * File: coin_change_ii.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 동전 교환 II: 동적 계획법 */
int coinChangeIIDP(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    // dp 테이블 초기화
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(amt + 1, sizeof(int));
    }
    // 첫 열 초기화
    for (int i = 0; i <= n; i++) {
        dp[i][0] = 1;
    }
    // 상태 전이
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 목표 금액을 넘으면 동전 i를 선택하지 않는다
                dp[i][a] = dp[i - 1][a];
            } else {
                // 동전 i를 선택하지 않을 때와 선택할 때의 방법 수를 더한다
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
            }
        }
    }
    int res = dp[n][amt];
    // 메모리 해제
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    free(dp);
    return res;
}

/* 동전 교환 II: 공간 최적화 동적 계획법 */
int coinChangeIIDPComp(int coins[], int amt, int coinsSize) {
    int n = coinsSize;
    // dp 테이블 초기화
    int *dp = calloc(amt + 1, sizeof(int));
    dp[0] = 1;
    // 상태 전이
    for (int i = 1; i <= n; i++) {
        for (int a = 1; a <= amt; a++) {
            if (coins[i - 1] > a) {
                // 목표 금액을 넘으면 동전 i를 선택하지 않는다
                dp[a] = dp[a];
            } else {
                // 동전 i를 선택하지 않을 때와 선택할 때의 방법 수를 더한다
                dp[a] = dp[a] + dp[a - coins[i - 1]];
            }
        }
    }
    int res = dp[amt];
    // 메모리 해제
    free(dp);
    return res;
}

/* 실행 예제 */
int main() {
    int coins[] = {1, 2, 5};
    int coinsSize = sizeof(coins) / sizeof(coins[0]);
    int amt = 5;

    // 동적 계획법
    int res = coinChangeIIDP(coins, amt, coinsSize);
    printf("목표 금액을 만드는 동전 조합 수: %d\n", res);

    // 공간 최적화 동적 계획법
    res = coinChangeIIDPComp(coins, amt, coinsSize);
    printf("목표 금액을 만드는 동전 조합 수: %d\n", res);

    return 0;
}
