/**
 * File: subset_sum_i_naive.c
 * Created Time: 2023-07-28
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100
#define MAX_RES_SIZE 100

// 狀態（子集）
int state[MAX_SIZE];
int stateSize = 0;

// 結果串列（子集串列）
int res[MAX_RES_SIZE][MAX_SIZE];
int resColSizes[MAX_RES_SIZE];
int resSize = 0;

/* 回溯演算法：子集和 I */
void backtrack(int target, int total, int *choices, int choicesSize) {
    // 子集和等於 target 時，記錄解
    if (total == target) {
        for (int i = 0; i < stateSize; i++) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // 走訪所有選擇
    for (int i = 0; i < choicesSize; i++) {
        // 剪枝：若子集和超過 target ，則跳過該選擇
        if (total + choices[i] > target) {
            continue;
        }
        // 嘗試：做出選擇，更新元素和 total
        state[stateSize++] = choices[i];
        // 進行下一輪選擇
        backtrack(target, total + choices[i], choices, choicesSize);
        // 回退：撤銷選擇，恢復到之前的狀態
        stateSize--;
    }
}

/* 求解子集和 I（包含重複子集） */
void subsetSumINaive(int *nums, int numsSize, int target) {
    resSize = 0; // 初始化解的數量為0
    backtrack(target, 0, nums, numsSize);
}

/* Driver Code */
int main() {
    int nums[] = {3, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumINaive(nums, numsSize, target);

    printf("輸入陣列 nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("所有和等於 %d 的子集 res = \n", target);
    for (int i = 0; i < resSize; i++) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
