/**
 * File: knapsack.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 最大値を求める */
int myMax(int a, int b) {
    return a > b ? a : b;
}

/* 0-1 ナップサック：総当たり探索 */
int knapsackDFS(int wgt[], int val[], int i, int c) {
    // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
    if (i == 0 || c == 0) {
        return 0;
    }
    // ナップサック容量を超える場合は、入れない選択しかできない
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // 品物 i を入れない場合と入れる場合の最大価値を計算する
    int no = knapsackDFS(wgt, val, i - 1, c);
    int yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 2つの案のうち価値が大きいほうを返す
    return myMax(no, yes);
}

/* 0-1 ナップサック：メモ化探索 */
int knapsackDFSMem(int wgt[], int val[], int memCols, int **mem, int i, int c) {
    // すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
    if (i == 0 || c == 0) {
        return 0;
    }
    // 既に記録があればそのまま返す
    if (mem[i][c] != -1) {
        return mem[i][c];
    }
    // ナップサック容量を超える場合は、入れない選択しかできない
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
    }
    // 品物 i を入れない場合と入れる場合の最大価値を計算する
    int no = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c);
    int yes = knapsackDFSMem(wgt, val, memCols, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 2 つの案のうち価値が大きい方を記録して返す
    mem[i][c] = myMax(no, yes);
    return mem[i][c];
}

/* 0-1 ナップサック：動的計画法 */
int knapsackDP(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // dp テーブルを初期化
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(cap + 1, sizeof(int));
    }
    // 状態遷移
    for (int i = 1; i <= n; i++) {
        for (int c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // ナップサック容量を超えるなら品物 i は選ばない
                dp[i][c] = dp[i - 1][c];
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きい方
                dp[i][c] = myMax(dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[n][cap];
    // メモリを解放する
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    return res;
}

/* 0-1 ナップサック：空間最適化後の動的計画法 */
int knapsackDPComp(int wgt[], int val[], int cap, int wgtSize) {
    int n = wgtSize;
    // dp テーブルを初期化
    int *dp = calloc(cap + 1, sizeof(int));
    // 状態遷移
    for (int i = 1; i <= n; i++) {
        // 逆順に走査する
        for (int c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // 品物 i を選ばない場合と選ぶ場合の大きい方
                dp[c] = myMax(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    int res = dp[cap];
    // メモリを解放する
    free(dp);
    return res;
}

/* Driver Code */
int main() {
    int wgt[] = {10, 20, 30, 40, 50};
    int val[] = {50, 120, 150, 210, 240};
    int cap = 50;
    int n = sizeof(wgt) / sizeof(wgt[0]);
    int wgtSize = n;

    // 全探索
    int res = knapsackDFS(wgt, val, n, cap);
    printf("ナップサック容量を超えない最大価値は %d\n", res);

    // メモ化探索
    int **mem = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        mem[i] = malloc((cap + 1) * sizeof(int));
        memset(mem[i], -1, (cap + 1) * sizeof(int));
    }
    res = knapsackDFSMem(wgt, val, cap + 1, mem, n, cap);
    printf("ナップサック容量を超えない最大価値は %d\n", res);
    // メモリを解放する
    for (int i = 0; i <= n; i++) {
        free(mem[i]);
    }
    free(mem);

    // 動的計画法
    res = knapsackDP(wgt, val, cap, wgtSize);
    printf("ナップサック容量を超えない最大価値は %d\n", res);

    // 空間最適化後の動的計画法
    res = knapsackDPComp(wgt, val, cap, wgtSize);
    printf("ナップサック容量を超えない最大価値は %d\n", res);

    return 0;
}
