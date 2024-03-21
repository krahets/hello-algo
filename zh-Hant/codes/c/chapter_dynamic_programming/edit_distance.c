/**
 * File: edit_distance.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 求最小值 */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* 編輯距離：暴力搜尋 */
int editDistanceDFS(char *s, char *t, int i, int j) {    
    // 若 s 和 t 都為空，則返回 0
    if (i == 0 && j == 0)
        return 0;
    // 若 s 為空，則返回 t 長度
    if (i == 0)
        return j;
    // 若 t 為空，則返回 s 長度
    if (j == 0)
        return i;
    // 若兩字元相等，則直接跳過此兩字元
    if (s[i - 1] == t[j - 1])
        return editDistanceDFS(s, t, i - 1, j - 1);
    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
    int insert = editDistanceDFS(s, t, i, j - 1);
    int del = editDistanceDFS(s, t, i - 1, j);
    int replace = editDistanceDFS(s, t, i - 1, j - 1);
    // 返回最少編輯步數
    return myMin(myMin(insert, del), replace) + 1;
}

/* 編輯距離：記憶化搜尋 */
int editDistanceDFSMem(char *s, char *t, int memCols, int **mem, int i, int j) {
    // 若 s 和 t 都為空，則返回 0
    if (i == 0 && j == 0)
        return 0;
    // 若 s 為空，則返回 t 長度
    if (i == 0)
        return j;
    // 若 t 為空，則返回 s 長度
    if (j == 0)
        return i;
    // 若已有記錄，則直接返回之
    if (mem[i][j] != -1)
        return mem[i][j];
    // 若兩字元相等，則直接跳過此兩字元
    if (s[i - 1] == t[j - 1])
        return editDistanceDFSMem(s, t, memCols, mem, i - 1, j - 1);
    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
    int insert = editDistanceDFSMem(s, t, memCols, mem, i, j - 1);
    int del = editDistanceDFSMem(s, t, memCols, mem, i - 1, j);
    int replace = editDistanceDFSMem(s, t, memCols, mem, i - 1, j - 1);
    // 記錄並返回最少編輯步數
    mem[i][j] = myMin(myMin(insert, del), replace) + 1;
    return mem[i][j];
}

/* 編輯距離：動態規劃 */
int editDistanceDP(char *s, char *t, int n, int m) {
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(m + 1, sizeof(int));
    }
    // 狀態轉移：首行首列
    for (int i = 1; i <= n; i++) {
        dp[i][0] = i;
    }
    for (int j = 1; j <= m; j++) {
        dp[0][j] = j;
    }
    // 狀態轉移：其餘行和列
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= m; j++) {
            if (s[i - 1] == t[j - 1]) {
                // 若兩字元相等，則直接跳過此兩字元
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                dp[i][j] = myMin(myMin(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    int res = dp[n][m];
    // 釋放記憶體
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    return res;
}

/* 編輯距離：空間最佳化後的動態規劃 */
int editDistanceDPComp(char *s, char *t, int n, int m) {
    int *dp = calloc(m + 1, sizeof(int));
    // 狀態轉移：首行
    for (int j = 1; j <= m; j++) {
        dp[j] = j;
    }
    // 狀態轉移：其餘行
    for (int i = 1; i <= n; i++) {
        // 狀態轉移：首列
        int leftup = dp[0]; // 暫存 dp[i-1, j-1]
        dp[0] = i;
        // 狀態轉移：其餘列
        for (int j = 1; j <= m; j++) {
            int temp = dp[j];
            if (s[i - 1] == t[j - 1]) {
                // 若兩字元相等，則直接跳過此兩字元
                dp[j] = leftup;
            } else {
                // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                dp[j] = myMin(myMin(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp; // 更新為下一輪的 dp[i-1, j-1]
        }
    }
    int res = dp[m];
    // 釋放記憶體
    free(dp);
    return res;
}

/* Driver Code */
int main() {
    char *s = "bag";
    char *t = "pack";
    int n = strlen(s), m = strlen(t);

    // 暴力搜尋
    int res = editDistanceDFS(s, t, n, m);
    printf("將 %s 更改為 %s 最少需要編輯 %d 步\n", s, t, res);

    // 記憶化搜尋
    int **mem = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        mem[i] = malloc((m + 1) * sizeof(int));
        memset(mem[i], -1, (m + 1) * sizeof(int));
    }
    res = editDistanceDFSMem(s, t, m + 1, mem, n, m);
    printf("將 %s 更改為 %s 最少需要編輯 %d 步\n", s, t, res);
    // 釋放記憶體
    for (int i = 0; i <= n; i++) {
        free(mem[i]);
    }
    free(mem);

    // 動態規劃
    res = editDistanceDP(s, t, n, m);
    printf("將 %s 更改為 %s 最少需要編輯 %d 步\n", s, t, res);

    // 空間最佳化後的動態規劃
    res = editDistanceDPComp(s, t, n, m);
    printf("將 %s 更改為 %s 最少需要編輯 %d 步\n", s, t, res);

    return 0;
}
