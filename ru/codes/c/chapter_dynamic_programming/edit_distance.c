/**
 * File: edit_distance.c
 * Created Time: 2023-10-02
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Найти минимум */
int myMin(int a, int b) {
    return a < b ? a : b;
}

/* Редакционное расстояние: полный перебор */
int editDistanceDFS(char *s, char *t, int i, int j) {    
    // Если s и t пусты, вернуть 0
    if (i == 0 && j == 0)
        return 0;
    // Если s пусто, вернуть длину t
    if (i == 0)
        return j;
    // Если t пусто, вернуть длину s
    if (j == 0)
        return i;
    // Если два символа равны, сразу пропустить их
    if (s[i - 1] == t[j - 1])
        return editDistanceDFS(s, t, i - 1, j - 1);
    // Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
    int insert = editDistanceDFS(s, t, i, j - 1);
    int del = editDistanceDFS(s, t, i - 1, j);
    int replace = editDistanceDFS(s, t, i - 1, j - 1);
    // Вернуть минимальное число шагов редактирования
    return myMin(myMin(insert, del), replace) + 1;
}

/* Редакционное расстояние: поиск с мемоизацией */
int editDistanceDFSMem(char *s, char *t, int memCols, int **mem, int i, int j) {
    // Если s и t пусты, вернуть 0
    if (i == 0 && j == 0)
        return 0;
    // Если s пусто, вернуть длину t
    if (i == 0)
        return j;
    // Если t пусто, вернуть длину s
    if (j == 0)
        return i;
    // Если запись уже есть, сразу вернуть ее
    if (mem[i][j] != -1)
        return mem[i][j];
    // Если два символа равны, сразу пропустить их
    if (s[i - 1] == t[j - 1])
        return editDistanceDFSMem(s, t, memCols, mem, i - 1, j - 1);
    // Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
    int insert = editDistanceDFSMem(s, t, memCols, mem, i, j - 1);
    int del = editDistanceDFSMem(s, t, memCols, mem, i - 1, j);
    int replace = editDistanceDFSMem(s, t, memCols, mem, i - 1, j - 1);
    // Сохранить и вернуть минимальное число шагов редактирования
    mem[i][j] = myMin(myMin(insert, del), replace) + 1;
    return mem[i][j];
}

/* Редакционное расстояние: динамическое программирование */
int editDistanceDP(char *s, char *t, int n, int m) {
    int **dp = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        dp[i] = calloc(m + 1, sizeof(int));
    }
    // Переход состояний: первая строка и первый столбец
    for (int i = 1; i <= n; i++) {
        dp[i][0] = i;
    }
    for (int j = 1; j <= m; j++) {
        dp[0][j] = j;
    }
    // Переход состояний: остальные строки и столбцы
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= m; j++) {
            if (s[i - 1] == t[j - 1]) {
                // Если два символа равны, сразу пропустить их
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
                dp[i][j] = myMin(myMin(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    int res = dp[n][m];
    // Освободить память
    for (int i = 0; i <= n; i++) {
        free(dp[i]);
    }
    return res;
}

/* Редакционное расстояние: динамическое программирование с оптимизацией памяти */
int editDistanceDPComp(char *s, char *t, int n, int m) {
    int *dp = calloc(m + 1, sizeof(int));
    // Переход состояний: первая строка
    for (int j = 1; j <= m; j++) {
        dp[j] = j;
    }
    // Переход состояний: остальные строки
    for (int i = 1; i <= n; i++) {
        // Переход состояний: первый столбец
        int leftup = dp[0]; // Временно сохранить dp[i-1, j-1]
        dp[0] = i;
        // Переход состояний: остальные столбцы
        for (int j = 1; j <= m; j++) {
            int temp = dp[j];
            if (s[i - 1] == t[j - 1]) {
                // Если два символа равны, сразу пропустить их
                dp[j] = leftup;
            } else {
                // Минимальное число шагов редактирования = минимальное число шагов для вставки, удаления и замены + 1
                dp[j] = myMin(myMin(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp; // Обновить до значения dp[i-1, j-1] для следующей итерации
        }
    }
    int res = dp[m];
    // Освободить память
    free(dp);
    return res;
}

/* Driver Code */
int main() {
    char *s = "bag";
    char *t = "pack";
    int n = strlen(s), m = strlen(t);

    // Полный перебор
    int res = editDistanceDFS(s, t, n, m);
    printf("Чтобы заменить %s на %s, требуется минимум %d операций редактирования\n", s, t, res);

    // Поиск с мемоизацией
    int **mem = malloc((n + 1) * sizeof(int *));
    for (int i = 0; i <= n; i++) {
        mem[i] = malloc((m + 1) * sizeof(int));
        memset(mem[i], -1, (m + 1) * sizeof(int));
    }
    res = editDistanceDFSMem(s, t, m + 1, mem, n, m);
    printf("Чтобы заменить %s на %s, требуется минимум %d операций редактирования\n", s, t, res);
    // Освободить память
    for (int i = 0; i <= n; i++) {
        free(mem[i]);
    }
    free(mem);

    // Динамическое программирование
    res = editDistanceDP(s, t, n, m);
    printf("Чтобы заменить %s на %s, требуется минимум %d операций редактирования\n", s, t, res);

    // Динамическое программирование с оптимизацией памяти
    res = editDistanceDPComp(s, t, n, m);
    printf("Чтобы заменить %s на %s, требуется минимум %d операций редактирования\n", s, t, res);

    return 0;
}
