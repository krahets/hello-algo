#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#define MAX_N 20

/* 棋盘结构 */
typedef struct {
    char state[MAX_N][MAX_N][2];
    int n;
    bool cols[MAX_N];         //记录是否有皇后
    bool diags1[2*MAX_N - 1]; //记录主对角线是否有皇后
    bool diags2[2*MAX_N - 1]; //记录副对角线是否有皇后
} Board;

typedef struct {
    char ****res;
    int count;
} Results;

/* 回溯算法：N 皇后 */
void backtrack(int row, Board *board, Results *results) {
    // 当放置完所有行时，记录解
    if (row == board->n) {
        board->state[row][0][0] = '\0';
        results->res[results->count] = (char***)malloc(sizeof(char**) * (board->n+1));
        for (int i = 0; i < board->n; i++) {
            results->res[results->count][i] = (char**)malloc(sizeof(char*) * (board->n+1));
            for (int j = 0; j < board->n; j++) {
                results->res[results->count][i][j] = (char*)malloc(2);
                strcpy(results->res[results->count][i][j], board->state[i][j]);
            }
            results->res[results->count][i][board->n] = NULL;
        }
        results->res[results->count][board->n] = NULL;
        results->count++;
        return;
    }
     // 遍历所有列
    for (int col = 0; col < board->n; col++) {
        // 计算该格子对应的主对角线和副对角线
        int diag1 = row - col + board->n - 1;
        int diag2 = row + col;
         // 剪枝：不允许该格子所在列、主对角线、副对角线存在皇后
        if (!board->cols[col] && !board->diags1[diag1] && !board->diags2[diag2]) {
            // 尝试：将皇后放置在该格子
            strcpy(board->state[row][col], "Q");
            board->cols[col] = board->diags1[diag1] = board->diags2[diag2] = true;
            // 放置下一行
            backtrack(row + 1, board, results);
            // 回退：将该格子恢复为空位
            strcpy(board->state[row][col], "#");
            board->cols[col] = board->diags1[diag1] = board->diags2[diag2] = false;
        }
    }
}

/* 求解 N 皇后 */
Results nQueens(int n) {
    Board board = {0};
    Results results = {0};

    // 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            strcpy(board.state[i][j], "#");

    board.n = n;
    results.res = (char****)malloc(sizeof(char***) * 1000); // Assuming a maximum of 1000 solutions

    backtrack(0, &board, &results);

    return results;
}

int main() {
    int n = 4;
    Results results = nQueens(n);

    // print the results
    for (int k = 0; k < results.count; k++) {
        for (int i = 0; results.res[k][i] != NULL; i++) {
            for (int j = 0; results.res[k][i][j] != NULL; j++)
                printf("%s", results.res[k][i][j]);
            printf("\n");
        }
        printf("\n");
    }

    return 0;
}
