/**
 * File : n_queens.c
 * Created Time: 2023-09-25
 * Author : lucas (superrat6@gmail.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

/* バックトラッキング：N クイーン */
void backtrack(int row, int n, char state[MAX_SIZE][MAX_SIZE], char ***res, int *resSize, bool cols[MAX_SIZE],
               bool diags1[2 * MAX_SIZE - 1], bool diags2[2 * MAX_SIZE - 1]) {
    // すべての行への配置が完了したら、解を記録する
    if (row == n) {
        res[*resSize] = (char **)malloc(sizeof(char *) * n);
        for (int i = 0; i < n; ++i) {
            res[*resSize][i] = (char *)malloc(sizeof(char) * (n + 1));
            strcpy(res[*resSize][i], state[i]);
        }
        (*resSize)++;
        return;
    }
    // すべての列を走査
    for (int col = 0; col < n; col++) {
        // このマスに対応する主対角線と副対角線を計算
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // 枝刈り：そのマスの列、主対角線、副対角線にクイーンがあってはならない
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 試行：そのマスにクイーンを置く
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // 次の行に配置する
            backtrack(row + 1, n, state, res, resSize, cols, diags1, diags2);
            // 戻す：そのマスを空きマスに戻す
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* N クイーンを解く */
char ***nQueens(int n, int *returnSize) {
    char state[MAX_SIZE][MAX_SIZE];
    // n*n の盤面を初期化する。'Q' はクイーン、'#' は空きマスを表す
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            state[i][j] = '#';
        }
        state[i][n] = '\0';
    }
    bool cols[MAX_SIZE] = {false};           // 列にクイーンがあるか記録
    bool diags1[2 * MAX_SIZE - 1] = {false}; // 主対角線にクイーンがあるかを記録
    bool diags2[2 * MAX_SIZE - 1] = {false}; // 副対角線にクイーンがあるかを記録

    char ***res = (char ***)malloc(sizeof(char **) * MAX_SIZE);
    *returnSize = 0;
    backtrack(0, n, state, res, returnSize, cols, diags1, diags2);
    return res;
}

/* Driver Code */
int main() {
    int n = 4;
    int returnSize;
    char ***res = nQueens(n, &returnSize);

    printf("盤面の縦横は%d\n", n);
    printf("クイーンの配置方法は全部で %d 通り\n", returnSize);
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

    // メモリを解放する
    for (int i = 0; i < returnSize; ++i) {
        for (int j = 0; j < n; ++j) {
            free(res[i][j]);
        }
        free(res[i]);
    }
    free(res);

    return 0;
}
