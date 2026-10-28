/**
 * File: subset_sum_i.c
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

/* 백트래킹 알고리즘: 부분 집합 합 I */
void backtrack(int target, int *choices, int choicesSize, int start) {
    // 부분 집합의 합이 target과 같으면 해를 기록한다
    if (target == 0) {
        for (int i = 0; i < stateSize; ++i) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // 모든 선택지를 순회한다
    // 가지치기 2: start부터 순회하여 중복 부분 집합 생성을 방지한다
    for (int i = start; i < choicesSize; i++) {
        // 가지치기 1: 부분 집합의 합이 target을 초과하면 즉시 반복문을 종료한다
        // 배열이 정렬되어 있어 뒤의 원소가 더 크므로, 부분 집합의 합이 반드시 target을 초과하기 때문이다
        if (target - choices[i] < 0) {
            break;
        }
        // 시도: 선택하고 target, start를 갱신한다
        state[stateSize] = choices[i];
        stateSize++;
        // 다음 선택을 진행한다
        backtrack(target - choices[i], choices, choicesSize, i);
        // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
        stateSize--;
    }
}

/* 비교 함수 */
int cmp(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

/* 부분 집합 합 I 풀기 */
void subsetSumI(int *nums, int numsSize, int target) {
    qsort(nums, numsSize, sizeof(int), cmp); // nums를 정렬한다
    int start = 0;                           // 순회 시작 위치
    backtrack(target, nums, numsSize, start);
}

/* 실행 코드 */
int main() {
    int nums[] = {3, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumI(nums, numsSize, target);

    printf("입력 배열 nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("합이 %d인 모든 부분 집합 res = \n", target);
    for (int i = 0; i < resSize; ++i) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
