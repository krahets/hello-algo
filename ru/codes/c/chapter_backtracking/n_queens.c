/**
 * File : n_queens.c
 * Created Time: 2023-09-25
 * Author : lucas (superrat6@gmail.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

/* Поиск с возвратом: задача о n ферзях */
void backtrack(int row, int n, char state[MAX_SIZE][MAX_SIZE], char ***res, int *resSize, bool cols[MAX_SIZE],
               bool diags1[2 * MAX_SIZE - 1], bool diags2[2 * MAX_SIZE - 1]) {
    // Когда ферзи расставлены во всех строках, сохраняем решение
    if (row == n) {
        res[*resSize] = (char **)malloc(sizeof(char *) * n);
        for (int i = 0; i < n; ++i) {
            res[*resSize][i] = (char *)malloc(sizeof(char) * (n + 1));
            strcpy(res[*resSize][i], state[i]);
        }
        (*resSize)++;
        return;
    }
    // Перебираем все столбцы
    for (int col = 0; col < n; col++) {
        // Вычисляем индексы прямой и обратной диагоналей клетки
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // Отсечение: в столбце и на обеих диагоналях клетки не должно быть ферзей
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Пробуем поставить ферзя на эту клетку
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // Переходим к следующей строке
            backtrack(row + 1, n, state, res, resSize, cols, diags1, diags2);
            // Возврат: освобождаем клетку
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Решение задачи о n ферзях */
char ***nQueens(int n, int *returnSize) {
    char state[MAX_SIZE][MAX_SIZE];
    // Создаём доску n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            state[i][j] = '#';
        }
        state[i][n] = '\0';
    }
    bool cols[MAX_SIZE] = {false};           // Отмечаем столбцы, занятые ферзями
    bool diags1[2 * MAX_SIZE - 1] = {false}; // Отмечаем прямые диагонали, занятые ферзями
    bool diags2[2 * MAX_SIZE - 1] = {false}; // Отмечаем обратные диагонали, занятые ферзями

    char ***res = (char ***)malloc(sizeof(char **) * MAX_SIZE);
    *returnSize = 0;
    backtrack(0, n, state, res, returnSize, cols, diags1, diags2);
    return res;
}

/* Основная программа */
int main() {
    int n = 4;
    int returnSize;
    char ***res = nQueens(n, &returnSize);

    printf("Длина стороны доски: %d\n", n);
    printf("Число расстановок ферзей: %d\n", returnSize);
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

    // Освобождаем память
    for (int i = 0; i < returnSize; ++i) {
        for (int j = 0; j < n; ++j) {
            free(res[i][j]);
        }
        free(res[i]);
    }
    free(res);

    return 0;
}
