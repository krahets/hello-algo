/**
 * File: climbing_stairs_backtrack.c
 * Created Time: 2023-09-22
 * Author: huawuque404 (huawuque404@163.com)
 */

#include "../utils/common.h"

/* Бэктрекинг */
void backtrack(int *choices, int state, int n, int *res, int len) {
    // Когда подъем достигает n-й ступени, число вариантов увеличивается на 1
    if (state == n)
        res[0]++;
    // Перебор всех вариантов выбора
    for (int i = 0; i < len; i++) {
        int choice = choices[i];
        // Отсечение: нельзя выходить за n-ю ступень
        if (state + choice > n)
            continue;
        // Попытка: сделать выбор и обновить состояние
        backtrack(choices, state + choice, n, res, len);
        // Откат
    }
}

/* Подъем по лестнице: бэктрекинг */
int climbingStairsBacktrack(int n) {
    int choices[2] = {1, 2}; // Можно подняться на 1 или 2 ступени
    int state = 0;           // Начать подъем с 0-й ступени
    int *res = (int *)malloc(sizeof(int));
    *res = 0; // Использовать res[0] для хранения числа решений
    int len = sizeof(choices) / sizeof(int);
    backtrack(choices, state, n, res, len);
    int result = *res;
    free(res);
    return result;
}

/* Driver Code */
int main() {
    int n = 9;

    int res = climbingStairsBacktrack(n);
    printf("Количество способов подняться по лестнице из %d ступеней: %d\n", n, res);

    return 0;
}