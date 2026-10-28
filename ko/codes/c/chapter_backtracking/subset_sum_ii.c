/**
 * File: subset_sum_ii.c
 * Created Time: 2023-07-29
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100
#define MAX_RES_SIZE 100

// 상태(부분 집합)
int state[MAX_SIZE];
int stateSize = 0;

// 결과 리스트(부분 집합 리스트)
int res[MAX_RES_SIZE][MAX_SIZE];
int resColSizes[MAX_RES_SIZE];
int resSize = 0;

/* 백트래킹 알고리즘: 부분 집합 합 II */
void backtrack(int target, int *choices, int choicesSize, int start) {
    // 부분 집합의 합이 target과 같으면 해를 기록한다
    if (target == 0) {
        for (int i = 0; i < stateSize; i++) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // 모든 선택지를 순회한다
    // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
    // 가지치기 3: start부터 순회하여 같은 원소의 중복 선택을 방지한다
    for (int i = start; i < choicesSize; i++) {
        // 가지치기 1: 부분 집합의 합이 target을 넘으면 바로 건너뛴다
        if (target - choices[i] < 0) {
            continue;
        }
        // 가지치기 4: 해당 원소가 왼쪽 원소와 같으면 탐색 분기가 중복되므로 바로 건너뛴다
        if (i > start && choices[i] == choices[i - 1]) {
            continue;
        }
        // 시도: 선택하고 target, start를 갱신한다
        state[stateSize] = choices[i];
        stateSize++;
        // 다음 선택을 진행한다
        backtrack(target - choices[i], choices, choicesSize, i + 1);
        // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
        stateSize--;
    }
}

/* 비교 함수 */
int cmp(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

/* 부분 집합 합 II 풀기 */
void subsetSumII(int *nums, int numsSize, int target) {
    // nums를 정렬한다
    qsort(nums, numsSize, sizeof(int), cmp);
    // 백트래킹 시작
    backtrack(target, nums, numsSize, 0);
}

/* 실행 코드 */
int main() {
    int nums[] = {4, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumII(nums, numsSize, target);

    printf("입력 배열 nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("합이 %d인 모든 부분 집합 res = \n", target);
    for (int i = 0; i < resSize; ++i) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
