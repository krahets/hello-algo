/**
 * File: subset_sum_i.c
 * Created Time: 2023-07-29
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
void backtrack(int target, int *choices, int choicesSize, int start) {
    // 子集和等于 target 时，记录解
    if (target == 0) {
        for (int i = 0; i < stateSize; ++i) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // 遍历所有选择
    // 剪枝二：从 start 开始遍历，避免生成重复子集
    for (int i = start; i < choicesSize; i++) {
        // 剪枝一：若子集和超过 target ，则直接结束循环
        // 这是因为数组已排序，后边元素更大，子集和一定超过 target
        if (target - choices[i] < 0) {
            break;
        }
        // 尝试：做出选择，更新 target, start
        state[stateSize] = choices[i];
        stateSize++;
        // 进行下一轮选择
        backtrack(target - choices[i], choices, choicesSize, i);
        // 回退：撤销选择，恢复到之前的状态
        stateSize--;
    }
}

/* 比较函数 */
int cmp(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

/* 求解子集和 I */
void subsetSumI(int *nums, int numsSize, int target) {
    qsort(nums, numsSize, sizeof(int), cmp); // 对 nums 进行排序
    int start = 0;                           // 遍历起始点
    backtrack(target, nums, numsSize, start);
}

/* Driver Code */
int main() {
    int nums[] = {3, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumI(nums, numsSize, target);

    printf("输入数组 nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("所有和等于 %d 的子集 res = \n", target);
    for (int i = 0; i < resSize; ++i) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
