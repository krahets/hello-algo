/**
 * File : n_queens.c
 * Created Time: 2023-09-25
 * Author : lucas (superrat6@gmail.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

/* 백트래킹 알고리즘: n-퀸 */
void backtrack(int row, int n, char state[MAX_SIZE][MAX_SIZE], char ***res, int *resSize, bool cols[MAX_SIZE],
               bool diags1[2 * MAX_SIZE - 1], bool diags2[2 * MAX_SIZE - 1]) {
    // 모든 행에 배치했으면 해를 기록한다
    if (row == n) {
        res[*resSize] = (char **)malloc(sizeof(char *) * n);
        for (int i = 0; i < n; ++i) {
            res[*resSize][i] = (char *)malloc(sizeof(char) * (n + 1));
            strcpy(res[*resSize][i], state[i]);
        }
        (*resSize)++;
        return;
    }
    // 모든 열을 순회한다
    for (int col = 0; col < n; col++) {
        // 해당 칸이 속한 주대각선과 부대각선을 계산한다
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // 가지치기: 해당 칸이 속한 열, 주대각선, 부대각선에 퀸이 있으면 안 된다
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 시도: 해당 칸에 퀸을 놓는다
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // 다음 행에 배치한다
            backtrack(row + 1, n, state, res, resSize, cols, diags1, diags2);
            // 되돌리기: 해당 칸을 빈칸으로 되돌린다
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* n-퀸 문제 풀기 */
char ***nQueens(int n, int *returnSize) {
    char state[MAX_SIZE][MAX_SIZE];
    // n*n 크기의 체스판을 초기화한다. 'Q'는 퀸, '#'은 빈칸을 나타낸다
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            state[i][j] = '#';
        }
        state[i][n] = '\0';
    }
    bool cols[MAX_SIZE] = {false};           // 열에 퀸이 있는지 기록한다
    bool diags1[2 * MAX_SIZE - 1] = {false}; // 주대각선에 퀸이 있는지 기록한다
    bool diags2[2 * MAX_SIZE - 1] = {false}; // 부대각선에 퀸이 있는지 기록한다

    char ***res = (char ***)malloc(sizeof(char **) * MAX_SIZE);
    *returnSize = 0;
    backtrack(0, n, state, res, returnSize, cols, diags1, diags2);
    return res;
}

/* 실행 코드 */
int main() {
    int n = 4;
    int returnSize;
    char ***res = nQueens(n, &returnSize);

    printf("입력한 체스판의 가로와 세로 길이: %d\n", n);
    printf("퀸을 배치하는 방법은 총 %d가지이다\n", returnSize);
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

    // 메모리 해제
    for (int i = 0; i < returnSize; ++i) {
        for (int j = 0; j < n; ++j) {
            free(res[i][j]);
        }
        free(res[i]);
    }
    free(res);

    return 0;
}
