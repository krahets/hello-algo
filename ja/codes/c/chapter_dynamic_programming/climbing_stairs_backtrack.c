/**
 * File: climbing_stairs_backtrack.c
 * Created Time: 2023-09-22
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* バックトラッキング */
void backtrack(int *choices, int state, int n, int *res, int len) {
    // 第 n 段に到達したら、方法数を 1 増やす
    if (state == n)
        res[0]++;
    // すべての選択肢を走査
    for (int i = 0; i < len; i++) {
        int choice = choices[i];
        // 枝刈り: 第 n 段を超えないようにする
        if (state + choice > n)
            continue;
        // 試行: 選択を行い、状態を更新
        backtrack(choices, state + choice, n, res, len);
        // バックトラック
    }
}

/* 階段登り：バックトラッキング */
int climbingStairsBacktrack(int n) {
    int choices[2] = {1, 2}; // 1 段または 2 段上ることを選べる
    int state = 0;           // 第 0 段から上り始める
    int *res = (int *)malloc(sizeof(int));
    *res = 0; // res[0] を使って方法数を記録する
    int len = sizeof(choices) / sizeof(int);
    backtrack(choices, state, n, res, len);
    int result = *res;
    free(res);
    return result;
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    printf("%d 段の階段を登る方法は全部で %d 通りです\n", n, res);

    return 0;
}