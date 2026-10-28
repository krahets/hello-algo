/**
 * File: unbounded_knapsack.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 최댓값 구하기 */
int myMax(int a, int b) {
    return a > b ? a : b;
}

/* 무한 배낭: 동적 계획법 */
int unboundedKnapsackDP(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // dp 테이블을 초기화한다
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(cap + 1, sizeof(int));
    }
    // 상태 전이
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                dp[i][c] = dp[i - 1][c];
            } else {
                // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                dp[i][c] = myMax(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[n][cap];
    // 메모리 해제
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    return res;
}

/* 무한 배낭: 공간을 최적화한 동적 계획법 */
int unboundedKnapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // dp 테이블을 초기화한다
    int *dp = calloc(cap + 1, sizeof(int));
    // 상태 전이
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 배낭 용량을 초과하면 물건 i를 선택하지 않는다
                dp[c] = dp[c];
            } else {
                // 물건 i를 선택하지 않는 경우와 선택하는 경우 중 더 큰 값
                dp[c] = myMax(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[cap];
    // 메모리 해제
    free(dp);
    return res;
}

/* 실행 코드 */
int main() {
    int wgt[] = {1, 2, 3};
    int val[] = {5, 11, 15};
    int wgtSize = sizeof(wgt) / sizeof(wgt[0]);
    int cap = 4;

    // 동적 계획법
    int res = unboundedKnapsackDP(wgt, val, cap, wgtSize);
    printf("배낭 용량을 넘지 않는 물건의 최대 가치는 %d이다\n", res);

    // 공간을 최적화한 동적 계획법
    res = unboundedKnapsackDPComp(wgt, val, cap, wgtSize);
    printf("배낭 용량을 넘지 않는 물건의 최대 가치는 %d이다\n", res);

    return 0;
}
