/**
 * File: edit_distance.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 最小値を求める */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* 編集距離：総当たり探索 */
int editDistanceDFS(char *s, char *t, int i, int j) {    
    // s と t がともに空なら 0 を返す
    if (i == 0 && j == 0)
        return 0;
    // s が空なら t の長さを返す
    if (i == 0)
        return j;
    // t が空なら s の長さを返す
    if (j == 0)
        return i;
    // 2 つの文字が等しければ、その 2 文字をそのままスキップする
    if (s[i - 1] == t[j - 1])
        return editDistanceDFS(s, t, i - 1, j - 1);
    // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
    int insert = editDistanceDFS(s, t, i, j - 1);
    int del = editDistanceDFS(s, t, i - 1, j);
    int replace = editDistanceDFS(s, t, i - 1, j - 1);
    // 最小編集回数を返す
    return myMin(myMin(insert, del), replace) + 1;
}

/* 編集距離：メモ化探索 */
int editDistanceDFSMem(char *s, char *t, int memCols, int **mem, int i, int j) {
    // s と t がともに空なら 0 を返す
    if (i == 0 && j == 0)
        return 0;
    // s が空なら t の長さを返す
    if (i == 0)
        return j;
    // t が空なら s の長さを返す
    if (j == 0)
        return i;
    // 記録済みなら、それをそのまま返す
    if (mem[i][j] != -1)
        return mem[i][j];
    // 2 つの文字が等しければ、その 2 文字をそのままスキップする
    if (s[i - 1] == t[j - 1])
        return editDistanceDFSMem(s, t, memCols, mem, i - 1, j - 1);
    // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
    int insert = editDistanceDFSMem(s, t, memCols, mem, i, j - 1);
    int del = editDistanceDFSMem(s, t, memCols, mem, i - 1, j);
    int replace = editDistanceDFSMem(s, t, memCols, mem, i - 1, j - 1);
    // 最小編集回数を記録して返す
    mem[i][j] = myMin(myMin(insert, del), replace) + 1;
    return mem[i][j];
}

/* 編集距離：動的計画法 */
int editDistanceDP(char *s, char *t, int n, int m) {
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(m + 1, sizeof(int));
    }
    // 状態遷移：先頭行と先頭列
    for (int i = 1; i <= n; i++) {
        dp[i][0] = i;
    }
    for (int j = 1; j <= m; j++) {
        dp[0][j] = j;
    }
    // 状態遷移: 残りの行と列
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= m; j++) {
            if (s[i - 1] == t[j - 1]) {
                // 2 つの文字が等しければ、その 2 文字をそのままスキップする
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
                dp[i][j] = myMin(myMin(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    int res = dp[n][m];
    // メモリを解放する
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    return res;
}

/* 編集距離：空間最適化した動的計画法 */
int editDistanceDPComp(char *s, char *t, int n, int m) {
    int *dp = calloc(m + 1, sizeof(int));
    // 状態遷移：先頭行
    for (int j = 1; j <= m; j++) {
        dp[j] = j;
    }
    // 状態遷移：残りの行
    for (int i = 1; i <= n; i++) {
        // 状態遷移：先頭列
        int leftup = dp[0]; // dp[i-1, j-1] を一時保存する
        dp[0] = i;
        // 状態遷移：残りの列
        for (int j = 1; j <= m; j++) {
            int temp = dp[j];
            if (s[i - 1] == t[j - 1]) {
                // 2 つの文字が等しければ、その 2 文字をそのままスキップする
                dp[j] = leftup;
            } else {
                // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
                dp[j] = myMin(myMin(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp; // 次の反復の dp[i-1, j-1] に更新する
        }
    }
    int res = dp[m];
    // メモリを解放する
    free(dp);
    return res;
}

/* Driver Code */
int main() {
    char *s = "bag";
    char *t = "pack";
    int n = strlen(s), m = strlen(t);

    // 全探索
    int res = editDistanceDFS(s, t, n, m);
    printf("%s を %s に変更するには最小で %d 回の編集が必要です\n", s, t, res);

    // メモ化探索
    int **mem = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        mem[i] = malloc((m + 1) * sizeof(int));
        memset(mem[i], -1, (m + 1) * sizeof(int));
    }
    res = editDistanceDFSMem(s, t, m + 1, mem, n, m);
    printf("%s を %s に変更するには最小で %d 回の編集が必要です\n", s, t, res);
    // メモリを解放する
    for (int i = 0; i <= n; i++) {
        free(mem[i]);
    }
    free(mem);

    // 動的計画法
    res = editDistanceDP(s, t, n, m);
    printf("%s を %s に変更するには最小で %d 回の編集が必要です\n", s, t, res);

    // 空間最適化後の動的計画法
    res = editDistanceDPComp(s, t, n, m);
    printf("%s を %s に変更するには最小で %d 回の編集が必要です\n", s, t, res);

    return 0;
}
