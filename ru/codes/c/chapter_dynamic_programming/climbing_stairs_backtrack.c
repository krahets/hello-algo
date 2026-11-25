/**
 * File: climbing_stairs_backtrack.c
 * Created Time: 2023-09-22
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* Поиск с возвратом */
void backtrack(int *choices, int state, int n, int *res, int len) {
    // На ступени n увеличить число способов на 1
    if (state == n)
        res[0]++;
    // Перебрать все варианты
    for (int i = 0; i < len; i++) {
        int choice = choices[i];
        // Отсечь шаги за ступень n
        if (state + choice > n)
            continue;
        // Сделать выбор и обновить состояние
        backtrack(choices, state + choice, n, res, len);
        // Отменить выбор
    }
}

/* Подъём по лестнице: поиск с возвратом */
int climbingStairsBacktrack(int n) {
    int choices[2] = {1, 2}; // Можно подняться на 1 или 2 ступени
    int state = 0;           // Начать со ступени 0
    int *res = (int *)malloc(sizeof(int));
    *res = 0; // Хранить число способов в res[0]
    int len = sizeof(choices) / sizeof(int);
    backtrack(choices, state, n, res, len);
    int result = *res;
    free(res);
    return result;
}

/* Основная программа */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    printf("Число способов подняться на лестницу из %d ступеней: %d\n", n, res);

    return 0;
}