/**
 * File: permutations_i.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com), krahets (krahets@163.com)
 */

#include "../utils/common.h"

// 假设最多有 1000 个排列
#define MAX_SIZE 1000

/* 回溯算法：全排列 I */
void backtrack(int *state, int stateSize, int *choices, int choicesSize, bool *selected, int **res, int *resSize) {
    // 当状态长度等于元素数量时，记录解
    if (stateSize == choicesSize) {
        res[*resSize] = (int *)malloc(choicesSize * sizeof(int));
        for (int i = 0; i < choicesSize; i++) {
            res[*resSize][i] = state[i];
        }
        (*resSize)++;
        return;
    }
    // 遍历所有选择
    for (int i = 0; i < choicesSize; i++) {
        int choice = choices[i];
        // 剪枝：不允许重复选择元素
        if (!selected[i]) {
            // 尝试：做出选择，更新状态
            selected[i] = true;
            state[stateSize] = choice;
            // 进行下一轮选择
            backtrack(state, stateSize + 1, choices, choicesSize, selected, res, resSize);
            // 回退：撤销选择，恢复到之前的状态
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

    printf("输入数组 nums = ");
    printArray(nums, numsSize);
    printf("\n所有排列 res = \n");
    for (int i = 0; i < returnSize; i++) {
        printArray(res[i], numsSize);
    }

    // 释放内存
    for (int i = 0; i < returnSize; i++) {
        free(res[i]);
    }
    free(res);

    return 0;
}
