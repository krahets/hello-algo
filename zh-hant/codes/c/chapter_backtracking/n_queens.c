/**
 * File : n_queens.c
 * Created Time: 2023-09-25
 * Author : lucas (superrat6@gmail.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

/* 回溯演算法：n 皇后 */
void backtrack(int row, int n, char state[MAX_SIZE][MAX_SIZE], char ***res, int *resSize, bool cols[MAX_SIZE],
               bool diags1[2 * MAX_SIZE - 1], bool diags2[2 * MAX_SIZE - 1]) {
    // 每一列都放好皇后後，記錄此解
    if (row == n) {
        res[*resSize] = (char **)malloc(sizeof(char *) * n);
        for (int i = 0; i < n; ++i) {
            res[*resSize][i] = (char *)malloc(sizeof(char) * (n + 1));
            strcpy(res[*resSize][i], state[i]);
        }
        (*resSize)++;
        return;
    }
    // 逐一檢查各欄
    for (int col = 0; col < n; col++) {
        // 計算這一格對應的主對角線與副對角線索引
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 嘗試：將皇后放在這一格
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // 在下一列放置皇后
            backtrack(row + 1, n, state, res, resSize, cols, diags1, diags2);
            // 回溯：將這一格還原為空位
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* 求解 n 皇后問題 */
char ***nQueens(int n, int *returnSize) {
    char state[MAX_SIZE][MAX_SIZE];
    // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            state[i][j] = '#';
        }
        state[i][n] = '\0';
    }
    bool cols[MAX_SIZE] = {false};           // 記錄各欄是否已有皇后
    bool diags1[2 * MAX_SIZE - 1] = {false}; // 記錄各主對角線上是否已有皇后
    bool diags2[2 * MAX_SIZE - 1] = {false}; // 記錄各副對角線上是否已有皇后

    char ***res = (char ***)malloc(sizeof(char **) * MAX_SIZE);
    *returnSize = 0;
    backtrack(0, n, state, res, returnSize, cols, diags1, diags2);
    return res;
}

/* 主程式 */
int main() {
    int n = 4;
    int returnSize;
    char ***res = nQueens(n, &returnSize);

    printf("輸入棋盤的邊長為%d\n", n);
    printf("皇后共有 %d 種擺法\n", returnSize);
    for (int i = 0; i < returnSize; ++i) {
        for (int j = 0; j < n; ++j) {
            printf("[");
            for (int k = 0; res[i][j][k] != '\0'; ++k) {
                printf("%c", res[i][j][k]);
                if (res[i][j][k + 1] != '\0') {
                    printf(", ");
                }
            }
            printf("]\n");
        }
        printf("---------------------\n");
    }

    // 釋放記憶體
    for (int i = 0; i < returnSize; ++i) {
        for (int j = 0; j < n; ++j) {
            free(res[i][j]);
        }
        free(res[i]);
    }
    free(res);

    return 0;
}
