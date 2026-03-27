/**
 * File: subset_sum_ii.c
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

/* Алгоритм бэктрекинга: сумма подмножеств II */
void backtrack(int target, int *choices, int choicesSize, int start) {
    // Если сумма подмножества равна target, записать решение
    if (target == 0) {
        for (int i = 0; i < stateSize; i++) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // Обойти все варианты выбора
    // Отсечение 2: начинать обход с start, чтобы избежать генерации повторяющихся подмножеств
    // Отсечение 3: начинать обход с start, чтобы избежать повторного выбора одного и того же элемента
    for (int i = start; i < choicesSize; i++) {
        // Отсечение 1: если сумма подмножества превышает target, сразу пропустить
        if (target - choices[i] < 0) {
            continue;
        }
        // Отсечение 4: если этот элемент равен элементу слева, значит ветвь поиска повторяется, ее нужно сразу пропустить
        if (i > start && choices[i] == choices[i - 1]) {
            continue;
        }
        // Попытка: сделать выбор и обновить target и start
        state[stateSize] = choices[i];
        stateSize++;
        // Перейти к следующему выбору
        backtrack(target - choices[i], choices, choicesSize, i + 1);
        // Откат: отменить выбор и восстановить предыдущее состояние
        stateSize--;
    }
}

/* Функция сравнения */
int cmp(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

/* Решить задачу суммы подмножеств II */
void subsetSumII(int *nums, int numsSize, int target) {
    // Отсортировать nums
    qsort(nums, numsSize, sizeof(int), cmp);
    // Начать бэктрекинг
    backtrack(target, nums, numsSize, 0);
}

/* Driver Code */
int main() {
    int nums[] = {4, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumII(nums, numsSize, target);

    printf("Входной массив nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("Все подмножества с суммой %d: \n", target);
    for (int i = 0; i < resSize; ++i) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
