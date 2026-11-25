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
    // 子集總和達到目標時，記錄此解
    if (total == target) {
        for (int i = 0; i < stateSize; i++) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // 逐一檢查所有選項
    for (int i = 0; i < choicesSize; i++) {
        // 剪枝：若加入該元素後總和超過 target，略過這個選擇
        if (total + choices[i] > target) {
            continue;
        }
        // 嘗試：做出選擇，更新元素總和 total
        state[stateSize++] = choices[i];
        // 進入下一輪選擇
        backtrack(target, total + choices[i], choices, choicesSize);
        // 回溯：撤銷選擇，還原先前的狀態
        stateSize--;
    }
}

/* 求解子集和 I（含重複子集） */
void subsetSumINaive(int *nums, int numsSize, int target) {
    resSize = 0; // 將解的個數初始化為 0
    backtrack(target, 0, nums, numsSize);
}

/* 主程式 */
int main() {
    int nums[] = {3, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumINaive(nums, numsSize, target);

    printf("輸入陣列 nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("總和等於 %d 的所有子集 res = \n", target);
    for (int i = 0; i < resSize; i++) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
