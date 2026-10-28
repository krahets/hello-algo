/**
 * File: knapsack.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 최댓값 구하기 */
int myMax(int a, int b) {
    return a > b ? a : b;
}

/* 0-1 배낭: 완전 탐색 */
int knapsackDFS(int wgt[], int val[], int i, int c) {
    // 모든 물건의 선택을 마쳤거나 배낭에 남은 용량이 없으면 가치 0을 반환한다
    if (i == 0 || c == 0) {
        return 0;
    }
    // 배낭 용량을 초과하면 배낭에 넣지 않는 선택만 가능하다
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // 물건 i를 넣지 않는 경우와 넣는 경우의 최대 가치를 계산한다
    int no = knapsackDFS(wgt, val, i - 1, c);
    int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 두 경우 중 더 큰 가치를 반환한다
    return myMax(no, yes);
}

/* 0-1 배낭: 메모이제이션을 이용한 탐색 */
int knapsackDFSMem(int wgt[], int val[], int memCols, int **mem, int i, int c) {
    // 모든 물건의 선택을 마쳤거나 배낭에 남은 용량이 없으면 가치 0을 반환한다
    if (i == 0 || c == 0) {
        return 0;
    }
    // 기록이 이미 있으면 바로 반환한다
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // 배낭 용량을 초과하면 배낭에 넣지 않는 선택만 가능하다
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
    }
    // 물건 i를 넣지 않는 경우와 넣는 경우의 최대 가치를 계산한다
    int no = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
    int yes = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 두 경우 중 더 큰 가치를 기록하고 반환한다
    mem[i][c] = myMax(no, yes);
    return mem[i][c];
}

/* 0-1 배낭: 동적 계획법 */
int knapsackDP(int wgt[], int val[], int cap, int wgtSize) {
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
                dp[i][c] = myMax(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
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

/* 0-1 배낭: 공간을 최적화한 동적 계획법 */
int knapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // dp 테이블을 초기화한다
    int *dp = calloc(cap + 1, sizeof(int));
    // 상태 전이
    for (int i = 1; i <= n; i++) {
        // 역방향 순회
        for (int c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
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
    int wgt[] = {10, 20, 30, 40, 50};
    int val[] = {50, 120, 150, 210, 240};
    int cap = 50;
    int n = sizeof(wgt) / sizeof(wgt[0]);
    int wgtSize = n;

    // 완전 탐색
    int res = knapsackDFS(wgt, val, n, cap);
    printf("배낭 용량을 넘지 않는 물건의 최대 가치는 %d이다\n", res);

    // 메모이제이션을 이용한 탐색
    int **mem = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        mem[i] = malloc((cap + 1) * sizeof(int));
        memset(mem[i], -1, (cap + 1) * sizeof(int));
    }
    res = knapsackDFSMem(wgt, val, cap + 1, mem, n, cap);
    printf("배낭 용량을 넘지 않는 물건의 최대 가치는 %d이다\n", res);
    // 메모리 해제
    for (int i = 0; i <= n; i++) {
        free(mem[i]);
    }
    free(mem);

    // 동적 계획법
    res = knapsackDP(wgt, val, cap, wgtSize);
    printf("배낭 용량을 넘지 않는 물건의 최대 가치는 %d이다\n", res);

    // 공간을 최적화한 동적 계획법
    res = knapsackDPComp(wgt, val, cap, wgtSize);
    printf("배낭 용량을 넘지 않는 물건의 최대 가치는 %d이다\n", res);

    return 0;
}
