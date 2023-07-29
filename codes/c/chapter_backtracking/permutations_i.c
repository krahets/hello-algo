/**
 * File: permutations_i.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 回溯算法：全排列 I */
void backtrack(vector *state, vector *choices, vector *selected, vector *res) {
    // 当状态长度等于元素数量时，记录解
    if (state->size == choices->size) {
        vector *newState = newVector();
        for (int i = 0; i < state->size; i++) {
            vectorPushback(newState, state->data[i], sizeof(int));
        }
        vectorPushback(res, newState, sizeof(vector));
        return;
    }
    // 遍历所有选择
    for (int i = 0; i < choices->size; i++) {
        int *choice = malloc(sizeof(int));
        *choice = *((int *)(choices->data[i]));
        // 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
        bool select = *((bool *)(selected->data[i]));
        if (!select) {
            // 尝试：做出选择，更新状态
            *((bool *)selected->data[i]) = true;
            vectorPushback(state, choice, sizeof(int));
            // 进行下一轮选择
            backtrack(state, choices, selected, res);
            // 回退：撤销选择，恢复到之前的状态
            *((bool *)selected->data[i]) = false;
            vectorPopback(state);
        }
    }
}

/* 全排列 I */
vector *permutationsI(vector *nums) {
    vector *iState = newVector();

    int select[3] = {false, false, false};
    vector *bSelected = newVector();
    for (int i = 0; i < nums->size; i++) {
        vectorPushback(bSelected, &select[i], sizeof(int));
    }

    vector *res = newVector();

    // 前序遍历
    backtrack(iState, nums, bSelected, res);
    return res;
}

/* 打印向量中的元素 */
void printFunc(vector *v, void *p) {
    int *node = p;
    printf("%d", *node);
}

/* Driver Code */
int main() {
    int nums[] = {1, 2, 3};
    vector *iNums = newVector(); // int
    for (int i = 0; i < sizeof(nums) / sizeof(nums[0]); i++) {
        vectorPushback(iNums, &nums[i], sizeof(int));
    }

    vector *res = permutationsI(iNums);

    // 输出结果
    printf("输入数组 nums = ");
    printArray(nums, sizeof(nums) / sizeof(nums[0]));
    printf("所有排列 res = ");
    printVectorMatrix(res, printFunc);

    // 释放内存
    delVector(iNums);
    delVector(res);
    return 0;
}
