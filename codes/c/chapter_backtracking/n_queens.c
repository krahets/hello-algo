/**
 * File: n_queens.c
 * Created Time: 2023-09-25
 * Author: lucas (superrat6@gmail.com)
 */

#include "../utils/common.h"

#define MAX_N 100
#define MAX_SOLUTIONS 1000

char ***results;
int resultsCount = 0;

/* 回溯算法：N 皇后 */
void backtrack(int row, int n, char state[MAX_N][MAX_N], char*** res, 
               bool cols[MAX_N], bool diags1[2*MAX_N-1], bool diags2[2*MAX_N-1]) {
    // 当放置完所有行时，记录解
    if (row == n) {
        res[resultsCount] = (char **)malloc(sizeof(char *) * n);
		for (int i = 0; i < n; ++i) {
			res[resultsCount][i] = (char *)malloc(sizeof(char) * (n + 1));
			strcpy(res[resultsCount][i], state[i]);
		}
		resultsCount++;
        return;
    }
    // 遍历所有列
    for (int col = 0; col < n; col++) {
        // 计算该格子对应的主对角线和副对角线
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // 剪枝：不允许该格子所在列、主对角线、副对角线存在皇后
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 尝试：将皇后放置在该格子
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // 放置下一行
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // 回退：将该格子恢复为空位
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* 求解 N 皇后 */
void nQueens(int n) {
    char state[MAX_N][MAX_N];
    // 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            state[i][j] = '#';
        }
        state[i][n] = '\0';
    }
    bool cols[MAX_N] = { false };        // 记录列是否有皇后
    bool diags1[2*MAX_N-1] = { false };  // 记录主对角线是否有皇后
    bool diags2[2*MAX_N-1] = { false };  // 记录副对角线是否有皇后	
	
	results = (char ***)malloc(sizeof(char **) * MAX_SOLUTIONS);
    
    backtrack(0, n, state, results, cols, diags1, diags2);
}

/* Driver Code */
int main() {
    int n = 4;	
    nQueens(n);
    printf("输入棋盘长宽为%d\n", n);
    printf("皇后放置方案共有 %d 种\n", resultsCount);

    for (int i = 0; i < resultsCount; ++i) {
        for (int j = 0; j < n; ++j) {
            printf("%s\n", results[i][j]);
        }
        printf("---------------------\n");
    }

    // Free allocated memory
    for (int i = 0; i < resultsCount; ++i) {
        for (int j = 0; j < n; ++j) {
            free(results[i][j]);
        }
        free(results[i]);
    }
    free(results);
    return 0;
}
