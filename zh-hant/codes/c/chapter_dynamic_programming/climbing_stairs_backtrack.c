/**
 * File: climbing_stairs_backtrack.c
 * Created Time: 2023-09-22
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* 回溯 */
void backtrack(int *choices, int state, int n, int *res, int len) {
    // 爬到第 n 階時，將走法數加 1
    if (state == n)
        res[0]++;
    // 走訪所有選項
    for (int i = 0; i < len; i++) {
        int choice = choices[i];
        // 剪枝：不能越過第 n 階
        if (state + choice > n)
            continue;
        // 嘗試：做出選擇，更新狀態
        backtrack(choices, state + choice, n, res, len);
        // 撤銷選擇
    }
}

/* 爬樓梯：回溯法 */
int climbingStairsBacktrack(int n) {
    int choices[2] = {1, 2}; // 每次可以往上爬 1 階或 2 階
    int state = 0;           // 從第 0 階開始爬
    int *res = (int *)malloc(sizeof(int));
    *res = 0; // 用 res[0] 記錄走法數
    int len = sizeof(choices) / sizeof(int);
    backtrack(choices, state, n, res, len);
    int result = *res;
    free(res);
    return result;
}

/* 主程式 */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    printf("爬 %d 階樓梯共有 %d 種走法\n", n, res);

    return 0;
}