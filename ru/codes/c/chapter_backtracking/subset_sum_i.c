/**
 * File: subset_sum_i.c
 * Created Time: 2023-07-29
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100
#define MAX_RES_SIZE 100

// Состояние (подмножество)
int state[MAX_SIZE];
int stateSize = 0;

// Список результатов (список подмножеств)
int res[MAX_RES_SIZE][MAX_SIZE];
int resColSizes[MAX_RES_SIZE];
int resSize = 0;

/* Алгоритм бэктрекинга: сумма подмножеств I */
void backtrack(int target, int *choices, int choicesSize, int start) {
    // Если сумма подмножества равна target, записать решение
    if (target == 0) {
        for (int i = 0; i < stateSize; ++i) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // Обойти все варианты выбора
    // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
    for (int i = start; i < choicesSize; i++) {
        // Отсечение 1: если сумма подмножества превышает target, немедленно завершить цикл
        // Это связано с тем, что массив уже отсортирован, следующие элементы больше, и сумма подмножества точно превысит target
        if (target - choices[i] < 0) {
            break;
        }
        // Попытка: сделать выбор и обновить target и start
        state[stateSize] = choices[i];
        stateSize++;
        // Перейти к следующему выбору
        backtrack(target - choices[i], choices, choicesSize, i);
        // Откат: отменить выбор и восстановить предыдущее состояние
        stateSize--;
    }
}

/* Функция сравнения */
int cmp(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

/* Решить задачу суммы подмножеств I */
void subsetSumI(int *nums, int numsSize, int target) {
    qsort(nums, numsSize, sizeof(int), cmp); // Отсортировать nums
    int start = 0;                           // Стартовая вершина обхода
    backtrack(target, nums, numsSize, start);
}

/* Driver Code */
int main() {
    int nums[] = {3, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumI(nums, numsSize, target);

    printf("Входной массив nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("Все подмножества с суммой %d: \n", target);
    for (int i = 0; i < resSize; ++i) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
