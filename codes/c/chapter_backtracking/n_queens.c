#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#define MAX_N 20

typedef struct {
    char state[MAX_N][MAX_N][2];
    int n;
    bool cols[MAX_N];
    bool diags1[2*MAX_N - 1];
    bool diags2[2*MAX_N - 1];
} Board;

typedef struct {
    char ****res;
    int count;
} Results;

void backtrack(int row, Board *board, Results *results) {
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
    for (int col = 0; col < board->n; col++) {
        int diag1 = row - col + board->n - 1;
        int diag2 = row + col;
        if (!board->cols[col] && !board->diags1[diag1] && !board->diags2[diag2]) {
            strcpy(board->state[row][col], "Q");
            board->cols[col] = board->diags1[diag1] = board->diags2[diag2] = true;
            backtrack(row + 1, board, results);
            strcpy(board->state[row][col], "#");
            board->cols[col] = board->diags1[diag1] = board->diags2[diag2] = false;
        }
    }
}

Results nQueens(int n) {
    Board board = {0};
    Results results = {0};

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
