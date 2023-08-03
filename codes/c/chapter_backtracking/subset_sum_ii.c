/**
 * File: subset_sum_ii.c
 * Created Time: 2023-07-29
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 回溯算法：子集和 II */
void backtrack(vector *state, int target, vector *choices, int start, vector *res) {
    // 子集和等于 target 时，记录解
    if (target == 0) {
        vector *tmpVector = newVector();
        for (int i = 0; i < state->size; i++) {
            vectorPushback(tmpVector, state->data[i], sizeof(int));
        }
        vectorPushback(res, tmpVector, sizeof(vector));
        return;
    }
    // 遍历所有选择
    // 剪枝二：从 start 开始遍历，避免生成重复子集
    // 剪枝三：从 start 开始遍历，避免重复选择同一元素
    for (int i = start; i < choices->size; i++) {
        // 剪枝一：若子集和超过 target ，则直接结束循环
        // 这是因为数组已排序，后边元素更大，子集和一定超过 target
        if (target - *(int *)(choices->data[i]) < 0) {
            continue;
        }
        // 剪枝四：如果该元素与左边元素相等，说明该搜索分支重复，直接跳过
        if (i > start && *(int *)(choices->data[i]) == *(int *)(choices->data[i - 1])) {
            continue;
        }
        // 尝试：做出选择，更新 target, start
        vectorPushback(state, choices->data[i], sizeof(int));
        // 进行下一轮选择
        backtrack(state, target - *(int *)(choices->data[i]), choices, i + 1, res);
        // 回退：撤销选择，恢复到之前的状态
        vectorPopback(state);
    }
}

/* 比较规则 */
int comp(const void *a, const void *b) {
    return *(int *)a - *(int *)b;
}

/* 求解子集和 II */
vector *subsetSumII(vector *nums, int target) {
    vector *state = newVector();                         // 状态（子集）
    qsort(nums->data, nums->size, sizeof(int *), comp); // 对 nums 进行排序
    int start = 0;                                       // 子集和
    vector *res = newVector();                           // 结果列表（子集列表）
    backtrack(state, target, nums, start, res);
    return res;
}

/* 打印向量中的元素 */
void printFunc(vector *v, void *p) {
    int *node = p;
    printf("%d", *node);
}

/* Driver Code */
int main() {
    int nums[] = {4, 4, 5};
    vector *iNums = newVector();
    for (int i = 0; i < sizeof(nums) / sizeof(nums[0]); i++) {
        vectorPushback(iNums, &nums[i], sizeof(int));
    }
    int target = 9;

    vector *res = subsetSumII(iNums, target);

    printf("输入数组 nums = ");
    printVector(iNums, printFunc);
    printf("target = %d\n", target);
    printf("所有和等于 %d 的子集 res = \r\n", target);
    printVectorMatrix(res, printFunc);

    delVector(iNums);
    delVector(res);
    return 0;
}
