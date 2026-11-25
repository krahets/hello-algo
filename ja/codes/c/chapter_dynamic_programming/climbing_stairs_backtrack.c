/**
 * File: climbing_stairs_backtrack.c
 * Created Time: 2023-09-22
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* バックトラック */
void backtrack(int *choices, int state, int n, int *res, int len) {
    // n 段目に着いたら、登り方の数を 1 増やす
    if (state == n)
        res[0]++;
    // すべての選択肢を調べる
    for (int i = 0; i < len; i++) {
        int choice = choices[i];
        // 枝刈り：n 段目を越えないようにする
        if (state + choice > n)
            continue;
        // 選択肢を試し、状態を更新する
        backtrack(choices, state + choice, n, res, len);
        // 選択を取り消す
    }
}

/* 階段の登り方：バックトラック */
int climbingStairsBacktrack(int n) {
    int choices[2] = {1, 2}; // 1 段または 2 段登れる
    int state = 0;           // 0 段目から登り始める
    int *res = (int *)malloc(sizeof(int));
    *res = 0; // res[0] に登り方の数を記録する
    int len = sizeof(choices) / sizeof(int);
    backtrack(choices, state, n, res, len);
    int result = *res;
    free(res);
    return result;
}

/* 実行例 */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    printf("全 %d 段の階段の登り方は %d 通り\n", n, res);

    return 0;
}