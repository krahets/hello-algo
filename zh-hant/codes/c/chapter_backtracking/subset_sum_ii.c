/**
 * File: subset_sum_ii.c
 * Created Time: 2023-07-29
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

/* 回溯演算法：子集和 II */
void backtrack(int target, int *choices, int choicesSize, int start) {
    // 子集總和達到目標時，記錄此解
    if (target == 0) {
        for (int i = 0; i < stateSize; i++) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // 逐一檢查所有選項
    // 剪枝二：從 start 開始走訪，避免產生重複子集
    // 剪枝三：從 start 開始走訪，避免重複選取同一個元素
    for (int i = start; i < choicesSize; i++) {
        // 剪枝一：若候選值超過剩餘目標值 target，直接略過
        if (target - choices[i] < 0) {
            continue;
        }
        // 剪枝四：若本輪已嘗試過左鄰的相等元素，就略過這個重複分支
        if (i > start && choices[i] == choices[i - 1]) {
            continue;
        }
        // 嘗試：做出選擇，更新 target 和 start
        state[stateSize] = choices[i];
        stateSize++;
        // 進入下一輪選擇
        backtrack(target - choices[i], choices, choicesSize, i + 1);
        // 回溯：撤銷選擇，還原先前的狀態
        stateSize--;
    }
}

/* 比較函式 */
int cmp(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

/* 求解子集和 II */
void subsetSumII(int *nums, int numsSize, int target) {
    // 將 nums 排序
    qsort(nums, numsSize, sizeof(int), cmp);
    // 開始回溯搜尋
    backtrack(target, nums, numsSize, 0);
}

/* 主程式 */
int main() {
    int nums[] = {4, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumII(nums, numsSize, target);

    printf("輸入陣列 nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("總和等於 %d 的所有子集 res = \n", target);
    for (int i = 0; i < resSize; ++i) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
