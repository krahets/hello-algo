/**
 * File: climbing_stairs_backtrack.c
 * Created Time: 2023-09-22
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* バックトラッキング */
void backtrack(int *choices, int state, int n, int *res, int len) {
    // n 段目に到達したら、方法の数を 1 増やす
    if (state == n)
        res[0]++;
    // すべての選択肢を走査する
    for (int i = 0; i < len; i++) {
        int choice = choices[i];
        // 枝刈り：n 段目を越えてはならない
        if (state + choice > n)
            continue;
        // 試行：選択を行い、状態を更新する
        backtrack(choices, state + choice, n, res, len);
        // 復元
    }
}

/* 階段の上り方：バックトラッキング */
int climbingStairsBacktrack(int n) {
    int choices[2] = {1, 2}; // 1 段または 2 段上ることを選択できる
    int state = 0;           // 0 段目から上り始める
    int *res = (int *)malloc(sizeof(int));
    *res = 0; // res[0] に方法の数を記録する
    int len = sizeof(choices) / sizeof(int);
    backtrack(choices, state, n, res, len);
    int result = *res;
    free(res);
    return result;
}

/* 実行用コード */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    printf("%d 段の階段を上る方法は全部で %d 通り\n", n, res);

    return 0;
}