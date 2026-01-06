/**
 * File : n_queens.c
 * Created Time: 2023-09-25
 * Author : lucas (superrat6@gmail.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

/* Backtracking algorithm: N queens */
void backtrack(int row, int n, char state[MAX_SIZE][MAX_SIZE], char ***res, int *resSize, bool cols[MAX_SIZE],
               bool diags1[2 * MAX_SIZE - 1], bool diags2[2 * MAX_SIZE - 1]) {
    // When all rows are placed, record the solution
    if (row == n) {
        res[*resSize] = (char **)malloc(sizeof(char *) * n);
        for (int i = 0; i < n; ++i) {
            res[*resSize][i] = (char *)malloc(sizeof(char) * (n + 1));
            strcpy(res[*resSize][i], state[i]);
        }
        (*resSize)++;
        return;
    }
    // Traverse all columns
    for (int col = 0; col < n; col++) {
        // Calculate the main diagonal and anti-diagonal corresponding to this cell
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Attempt: place the queen in this cell
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // Place the next row
            backtrack(row + 1, n, state, res, resSize, cols, diags1, diags2);
            // Backtrack: restore this cell to an empty cell
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Solve N queens */
char ***nQueens(int n, int *returnSize) {
    char state[MAX_SIZE][MAX_SIZE];
    // Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            state[i][j] = '#';
        }
        state[i][n] = '\0';
    }
    bool cols[MAX_SIZE] = {false};           // Record whether there is a queen in the column
    bool diags1[2 * MAX_SIZE - 1] = {false}; // Record whether there is a queen on the main diagonal
    bool diags2[2 * MAX_SIZE - 1] = {false}; // Record whether there is a queen on the anti-diagonal

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

    printf("Input board size is %d\n", n);
    printf("Total queen placement solutions: %d\n", returnSize);
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

    // Free memory
    for (int i = 0; i < returnSize; ++i) {
        for (int j = 0; j < n; ++j) {
            free(res[i][j]);
        }
        free(res[i]);
    }
    free(res);

    return 0;
}
