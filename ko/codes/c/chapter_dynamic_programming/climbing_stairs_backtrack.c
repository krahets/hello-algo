/**
 * File: climbing_stairs_backtrack.c
 * Created Time: 2023-09-22
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* 백트래킹 */
void backtrack(int *choices, int state, int n, int *res, int len) {
    // n번째 계단에 도달하면 방법의 수에 1을 더한다
    if (state == n)
        res[0]++;
    // 모든 선택지를 순회한다
    for (int i = 0; i < len; i++) {
        int choice = choices[i];
        // 가지치기: n번째 계단을 넘어갈 수 없다
        if (state + choice > n)
            continue;
        // 시도: 선택하고 상태를 갱신한다
        backtrack(choices, state + choice, n, res, len);
        // 되돌리기
    }
}

/* 계단 오르기: 백트래킹 */
int climbingStairsBacktrack(int n) {
    int choices[2] = {1, 2}; // 한 계단 또는 두 계단 오르기를 선택할 수 있다
    int state = 0;           // 0번째 계단에서 오르기 시작한다
    int *res = (int *)malloc(sizeof(int));
    *res = 0; // res[0]에 방법의 수를 기록한다
    int len = sizeof(choices) / sizeof(int);
    backtrack(choices, state, n, res, len);
    int result = *res;
    free(res);
    return result;
}

/* 실행 코드 */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    printf("%d개의 계단을 오르는 방법은 총 %d가지이다\n", n, res);

    return 0;
}