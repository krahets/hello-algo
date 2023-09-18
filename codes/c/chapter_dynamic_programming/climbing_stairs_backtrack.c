/**
 * File: climbing_stairs_backtrack.c
 * Created Time: 2023-09-19
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.hpp"

/* 回溯 */
void backtrack(int *choices, int state, int n, int *res) {
    // 当爬到第 n 阶时，方案数量加 1
    if (state == n)
        res[0]++;
    // 遍历所有选择
    for (int i = 0; i < 2; i++) {
        int choice = choices[i];
        // 剪枝：不允许越过第 n 阶
        if (state + choice > n)
            break;
        // 尝试：做出选择，更新状态
        backtrack(choices, state + choice, n, res);
        // 回退
    }
}

/* 爬楼梯：回溯 */
int climbingStairsBacktrack(int n) {
    int choices[2] = {1, 2}; // 可选择向上爬 1 或 2 阶
    int state = 0;           // 从第 0 阶开始爬
    int *res = (int *)malloc(sizeof(int));
    *res = 0;                // 使用 res[0] 记录方案数量
    backtrack(choices, state, n, res);
    int result = *res;
    free(res);
    return result;
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    printf("爬 %d 阶楼梯共有 %d 种方案\n", n, res);

    return 0;
}