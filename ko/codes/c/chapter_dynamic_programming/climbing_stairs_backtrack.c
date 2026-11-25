/**
 * File: climbing_stairs_backtrack.c
 * Created Time: 2023-09-22
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* 백트래킹 */
void backtrack(int *choices, int state, int n, int *res, int len) {
    // n번째 계단에 도달하면 방법 수를 1 늘린다
    if (state == n)
        res[0]++;
    // 모든 선택지 순회
    for (int i = 0; i < len; i++) {
        int choice = choices[i];
        // 가지치기: n번째 계단을 넘지 않는다
        if (state + choice > n)
            continue;
        // 시도: 선택한 뒤 상태를 갱신한다
        backtrack(choices, state + choice, n, res, len);
        // 선택 취소
    }
}

/* 계단 오르기: 백트래킹 */
int climbingStairsBacktrack(int n) {
    int choices[2] = {1, 2}; // 한 번에 한 계단 또는 두 계단을 오른다
    int state = 0;           // 0번째 계단에서 출발한다
    int *res = (int *)malloc(sizeof(int));
    *res = 0; // res[0]에 방법 수를 기록한다
    int len = sizeof(choices) / sizeof(int);
    backtrack(choices, state, n, res, len);
    int result = *res;
    free(res);
    return result;
}

/* 실행 예제 */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    printf("계단 %d개를 오르는 방법은 %d가지\n", n, res);

    return 0;
}