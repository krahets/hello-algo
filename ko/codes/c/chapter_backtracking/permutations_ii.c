/**
 * File: permutations_ii.c
 * Created Time: 2023-10-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.h"

// 순열이 최대 1000개이고 원소의 최댓값이 1000이라고 가정
#define MAX_SIZE 1000

/* 백트래킹 알고리즘: 모든 순열 II */
void backtrack(int *state, int stateSize, int *choices, int choicesSize, bool *selected, int **res, int *resSize) {
    // 상태의 길이가 원소 개수와 같으면 해를 기록한다
    if (stateSize == choicesSize) {
        res[*resSize] = (int *)malloc(choicesSize * sizeof(int));
        for (int i = 0; i < choicesSize; i++) {
            res[*resSize][i] = state[i];
        }
        (*resSize)++;
        return;
    }
    // 모든 선택지를 순회한다
    bool duplicated[MAX_SIZE] = {false};
    for (int i = 0; i < choicesSize; i++) {
        int choice = choices[i];
        // 가지치기: 원소를 중복하여 선택할 수 없으며, 값이 같은 원소도 중복하여 선택할 수 없다
        if (!selected[i] && !duplicated[choice]) {
            // 시도: 선택하고 상태를 갱신한다
            duplicated[choice] = true; // 선택한 원소의 값을 기록한다
            selected[i] = true;
            state[stateSize] = choice;
            // 다음 선택을 진행한다
            backtrack(state, stateSize + 1, choices, choicesSize, selected, res, resSize);
            // 되돌리기: 선택을 취소하고 이전 상태로 되돌린다
            selected[i] = false;
        }
    }
}

/* 모든 순열 II */
int **permutationsII(int *nums, int numsSize, int *returnSize) {
    int *state = (int *)malloc(numsSize * sizeof(int));
    bool *selected = (bool *)malloc(numsSize * sizeof(bool));
    for (int i = 0; i < numsSize; i++) {
        selected[i] = false;
    }
    int **res = (int **)malloc(MAX_SIZE * sizeof(int *));
    *returnSize = 0;

    backtrack(state, 0, nums, numsSize, selected, res, returnSize);

    free(state);
    free(selected);

    return res;
}

/* 실행 코드 */
int main() {
    int nums[] = {1, 1, 2};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int returnSize;

    int **res = permutationsII(nums, numsSize, &returnSize);

    printf("입력 배열 nums = ");
    printArray(nums, numsSize);
    printf("\n모든 순열 res = \n");
    for (int i = 0; i < returnSize; i++) {
        printArray(res[i], numsSize);
    }

    // 메모리 해제
    for (int i = 0; i < returnSize; i++) {
        free(res[i]);
    }
    free(res);

    return 0;
}
