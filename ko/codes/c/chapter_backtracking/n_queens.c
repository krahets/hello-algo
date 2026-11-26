/**
 * File : n_queens.c
 * Created Time: 2023-09-25
 * Author : lucas (superrat6@gmail.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

/* 백트래킹: n-퀸 */
void backtrack(int row, int n, char state[MAX_SIZE][MAX_SIZE], char ***res, int *resSize, bool cols[MAX_SIZE],
               bool diags1[2 * MAX_SIZE - 1], bool diags2[2 * MAX_SIZE - 1]) {
    // 모든 행에 퀸을 놓으면 해를 기록한다
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
        // 이 칸이 속한 주대각선과 부대각선의 번호를 구한다
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // 가지치기: 이 칸과 같은 열, 주대각선, 부대각선에 퀸이 있으면 건너뛴다
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 시도: 이 칸에 퀸을 놓는다
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // 다음 행에 퀸을 놓는다
            backtrack(row + 1, n, state, res, resSize, cols, diags1, diags2);
            // 되돌리기: 이 칸을 다시 비운다
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* n-퀸 문제 풀기 */
char ***nQueens(int n, int *returnSize) {
    char state[MAX_SIZE][MAX_SIZE];
    // n*n 크기의 체스판을 초기화한다. 'Q'는 퀸, '#'은 빈칸이다
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            state[i][j] = '#';
        }
        state[i][n] = '\0';
    }
    bool cols[MAX_SIZE] = {false};           // 각 열에 퀸이 있는지 기록한다
    bool diags1[2 * MAX_SIZE - 1] = {false}; // 각 주대각선에 퀸이 있는지 기록한다
    bool diags2[2 * MAX_SIZE - 1] = {false}; // 각 부대각선에 퀸이 있는지 기록한다

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

    printf("입력 체스판의 한 변의 길이: %d\n", n);
    printf("퀸 배치 방법은 총 %d가지\n", returnSize);
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

    // 메모리를 해제한다
    for (int i = 0; i < returnSize; ++i) {
        for (int j = 0; j < n; ++j) {
            free(res[i][j]);
        }
        free(res[i]);
    }
    free(res);

    return 0;
}
