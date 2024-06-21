/**
 * File: permutations_i.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com), krahets (krahets@163.com)
 */

#include "../utils/common.h"

// 假設最多有 1000 個排列
#define MAX_SIZE 1000

/* 回溯演算法：全排列 I */
void backtrack(int *state, int stateSize, int *choices, int choicesSize, bool *selected, int **res, int *resSize) {
    // 當狀態長度等於元素數量時，記錄解
    if (stateSize == choicesSize) {
        res[*resSize] = (int *)malloc(choicesSize * sizeof(int));
        for (int i = 0; i < choicesSize; i++) {
            res[*resSize][i] = state[i];
        }
        (*resSize)++;
        return;
    }
    // 走訪所有選擇
    for (int i = 0; i < choicesSize; i++) {
        int choice = choices[i];
        // 剪枝：不允許重複選擇元素
        if (!selected[i]) {
            // 嘗試：做出選擇，更新狀態
            selected[i] = true;
            state[stateSize] = choice;
            // 進行下一輪選擇
            backtrack(state, stateSize + 1, choices, choicesSize, selected, res, resSize);
            // 回退：撤銷選擇，恢復到之前的狀態
            selected[i] = false;
        }
    }
}

/* 全排列 I */
int **permutationsI(int *nums, int numsSize, int *returnSize) {
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

/* Driver Code */
int main() {
    int nums[] = {1, 2, 3};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int returnSize;

    int **res = permutationsI(nums, numsSize, &returnSize);

    printf("輸入陣列 nums = ");
    printArray(nums, numsSize);
    printf("\n所有排列 res = \n");
    for (int i = 0; i < returnSize; i++) {
        printArray(res[i], numsSize);
    }

    // 釋放記憶體
    for (int i = 0; i < returnSize; i++) {
        free(res[i]);
    }
    free(res);

    return 0;
}
