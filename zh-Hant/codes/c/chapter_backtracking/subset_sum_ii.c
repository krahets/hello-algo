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
    // 子集和等於 target 時，記錄解
    if (target == 0) {
        for (int i = 0; i < stateSize; i++) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // 走訪所有選擇
    // 剪枝二：從 start 開始走訪，避免生成重複子集
    // 剪枝三：從 start 開始走訪，避免重複選擇同一元素
    for (int i = start; i < choicesSize; i++) {
        // 剪枝一：若子集和超過 target ，則直接跳過
        if (target - choices[i] < 0) {
            continue;
        }
        // 剪枝四：如果該元素與左邊元素相等，說明該搜尋分支重複，直接跳過
        if (i > start && choices[i] == choices[i - 1]) {
            continue;
        }
        // 嘗試：做出選擇，更新 target, start
        state[stateSize] = choices[i];
        stateSize++;
        // 進行下一輪選擇
        backtrack(target - choices[i], choices, choicesSize, i + 1);
        // 回退：撤銷選擇，恢復到之前的狀態
        stateSize--;
    }
}

/* 比較函式 */
int cmp(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

/* 求解子集和 II */
void subsetSumII(int *nums, int numsSize, int target) {
    // 對 nums 進行排序
    qsort(nums, numsSize, sizeof(int), cmp);
    // 開始回溯
    backtrack(target, nums, numsSize, 0);
}

/* Driver Code */
int main() {
    int nums[] = {4, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumII(nums, numsSize, target);

    printf("輸入陣列 nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("所有和等於 %d 的子集 res = \n", target);
    for (int i = 0; i < resSize; ++i) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
