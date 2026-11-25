/**
 * File: subset_sum_i.c
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

/* 回溯演算法：子集和 I */
void backtrack(int target, int *choices, int choicesSize, int start) {
    // 子集總和達到目標時，記錄此解
    if (target == 0) {
        for (int i = 0; i < stateSize; ++i) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // 逐一檢查所有選項
    // 剪枝二：從 start 開始走訪，避免產生重複子集
    for (int i = start; i < choicesSize; i++) {
        // 剪枝一：若候選值超過剩餘目標值 target，結束迴圈
        // 陣列已排序，後面的元素更大，也一定超過剩餘目標值 target
        if (target - choices[i] < 0) {
            break;
        }
        // 嘗試：做出選擇，更新 target 和 start
        state[stateSize] = choices[i];
        stateSize++;
        // 進入下一輪選擇
        backtrack(target - choices[i], choices, choicesSize, i);
        // 回溯：撤銷選擇，還原先前的狀態
        stateSize--;
    }
}

/* 比較函式 */
int cmp(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

/* 求解子集和 I */
void subsetSumI(int *nums, int numsSize, int target) {
    qsort(nums, numsSize, sizeof(int), cmp); // 將 nums 排序
    int start = 0;                           // 走訪的起點
    backtrack(target, nums, numsSize, start);
}

/* 主程式 */
int main() {
    int nums[] = {3, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumI(nums, numsSize, target);

    printf("輸入陣列 nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("總和等於 %d 的所有子集 res = \n", target);
    for (int i = 0; i < resSize; ++i) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
