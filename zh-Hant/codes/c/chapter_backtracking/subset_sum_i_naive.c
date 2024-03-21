/**
 * File: subset_sum_i_naive.c
 * Created Time: 2023-07-28
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100
#define MAX_RES_SIZE 100

// 状态（子集）
int state[MAX_SIZE];
int stateSize = 0;

// 结果列表（子集列表）
int res[MAX_RES_SIZE][MAX_SIZE];
int resColSizes[MAX_RES_SIZE];
int resSize = 0;

/* 回溯算法：子集和 I */
void backtrack(int target, int total, int *choices, int choicesSize) {
    // 子集和等于 target 时，记录解
    if (total == target) {
        for (int i = 0; i < stateSize; i++) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // 遍历所有选择
    for (int i = 0; i < choicesSize; i++) {
        // 剪枝：若子集和超过 target ，则跳过该选择
        if (total + choices[i] > target) {
            continue;
        }
        // 尝试：做出选择，更新元素和 total
        state[stateSize++] = choices[i];
        // 进行下一轮选择
        backtrack(target, total + choices[i], choices, choicesSize);
        // 回退：撤销选择，恢复到之前的状态
        stateSize--;
    }
}

/* 求解子集和 I（包含重复子集） */
void subsetSumINaive(int *nums, int numsSize, int target) {
    resSize = 0; // 初始化解的数量为0
    backtrack(target, 0, nums, numsSize);
}

/* Driver Code */
int main() {
    int nums[] = {3, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumINaive(nums, numsSize, target);

    printf("输入数组 nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("所有和等于 %d 的子集 res = \n", target);
    for (int i = 0; i < resSize; i++) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
