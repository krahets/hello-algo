/**
 * File : n_queens.c
 * Created Time: 2023-09-25
 * Author : lucas (superrat6@gmail.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

/* Алгоритм бэктрекинга: n ферзей */
void backtrack(int row, int n, char state[MAX_SIZE][MAX_SIZE], char ***res, int *resSize, bool cols[MAX_SIZE],
               bool diags1[2 * MAX_SIZE - 1], bool diags2[2 * MAX_SIZE - 1]) {
    // Когда все строки уже обработаны, записать решение
    if (row == n) {
        res[*resSize] = (char **)malloc(sizeof(char *) * n);
        for (int i = 0; i < n; ++i) {
            res[*resSize][i] = (char *)malloc(sizeof(char) * (n + 1));
            strcpy(res[*resSize][i], state[i]);
        }
        (*resSize)++;
        return;
    }
    // Обойти все столбцы
    for (int col = 0; col < n; col++) {
        // Вычислить главную и побочную диагонали, соответствующие этой клетке
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // Отсечение: в столбце, главной диагонали и побочной диагонали этой клетки не должно быть ферзей
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Попытка: поставить ферзя в эту клетку
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // Перейти к размещению следующей строки
            backtrack(row + 1, n, state, res, resSize, cols, diags1, diags2);
            // Откат: восстановить эту клетку как пустую
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Решить задачу о n ферзях */
char ***nQueens(int n, int *returnSize) {
    char state[MAX_SIZE][MAX_SIZE];
    // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            state[i][j] = '#';
        }
        state[i][n] = '\0';
    }
    bool cols[MAX_SIZE] = {false};           // Отмечать, есть ли ферзь в столбце
    bool diags1[2 * MAX_SIZE - 1] = {false}; // Отмечать наличие ферзя на главной диагонали
    bool diags2[2 * MAX_SIZE - 1] = {false}; // Отмечать наличие ферзя на побочной диагонали

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

    printf("Размер входной доски = %d\n", n);
    printf("Количество способов расстановки ферзей: %d\n", returnSize);
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

    // Освободить память
    for (int i = 0; i < returnSize; ++i) {
        for (int j = 0; j < n; ++j) {
            free(res[i][j]);
        }
        free(res[i]);
    }
    free(res);

    return 0;
}
