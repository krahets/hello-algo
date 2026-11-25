/**
 * File: subset_sum_ii.c
 * Created Time: 2023-07-29
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100
#define MAX_RES_SIZE 100

// 상태(부분집합)
int state[MAX_SIZE];
int stateSize = 0;

// 결과 리스트(부분집합의 리스트)
int res[MAX_RES_SIZE][MAX_SIZE];
int resColSizes[MAX_RES_SIZE];
int resSize = 0;

/* 백트래킹: 부분집합의 합 II */
void backtrack(int target, int *choices, int choicesSize, int start) {
    // 부분집합의 합이 target과 같으면 해를 기록한다
    if (target == 0) {
        for (int i = 0; i < stateSize; i++) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // 모든 선택지를 순회한다
    // 가지치기 2: start부터 순회하여 같은 부분집합이 중복 생성되는 것을 막는다
    // 가지치기 3: start부터 순회하여 같은 원소를 다시 선택하지 않는다
    for (int i = start; i < choicesSize; i++) {
        // 가지치기 1: 부분집합의 합이 target을 초과하면 바로 건너뛴다
        if (target - choices[i] < 0) {
            continue;
        }
        // 가지치기 4: 왼쪽 원소와 값이 같으면 중복된 탐색 분기이므로 건너뛴다
        if (i > start && choices[i] == choices[i - 1]) {
            continue;
        }
        // 시도: 원소를 선택하고 target과 start를 갱신한다
        state[stateSize] = choices[i];
        stateSize++;
        // 다음 선택을 진행한다
        backtrack(target - choices[i], choices, choicesSize, i + 1);
        // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
        stateSize--;
    }
}

/* 비교 함수 */
int cmp(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

/* 부분집합의 합 II 풀기 */
void subsetSumII(int *nums, int numsSize, int target) {
    // nums를 정렬한다
    qsort(nums, numsSize, sizeof(int), cmp);
    // 백트래킹을 시작한다
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
    printf("목표 합 %d에 맞는 모든 부분집합 res = \n", target);
    for (int i = 0; i < resSize; ++i) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
