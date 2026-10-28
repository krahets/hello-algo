/**
 * File: subset_sum_i_naive.c
 * Created Time: 2023-07-28
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

/* 백트래킹 알고리즘: 부분 집합 합 I */
void backtrack(int target, int total, int *choices, int choicesSize) {
    // 부분 집합의 합이 target과 같으면 해를 기록한다
    if (total == target) {
        for (int i = 0; i < stateSize; i++) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // 모든 선택지를 순회한다
    for (int i = 0; i < choicesSize; i++) {
        // 가지치기: 부분 집합의 합이 target을 초과하면 해당 선택을 건너뛴다
        if (total + choices[i] > target) {
            continue;
        }
        // 시도: 선택하고 원소의 합 total을 갱신한다
        state[stateSize++] = choices[i];
        // 다음 선택을 진행한다
        backtrack(target, total + choices[i], choices, choicesSize);
        // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
        stateSize--;
    }
}

/* 부분 집합 합 I 풀기(중복 부분 집합 포함) */
void subsetSumINaive(int *nums, int numsSize, int target) {
    resSize = 0; // 해의 개수를 0으로 초기화
    backtrack(target, 0, nums, numsSize);
}

/* 실행 코드 */
int main() {
    int nums[] = {3, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumINaive(nums, numsSize, target);

    printf("입력 배열 nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("합이 %d인 모든 부분 집합 res = \n", target);
    for (int i = 0; i < resSize; i++) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
