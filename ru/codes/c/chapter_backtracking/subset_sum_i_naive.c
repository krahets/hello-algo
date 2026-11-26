/**
 * File: subset_sum_i_naive.c
 * Created Time: 2023-07-28
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

/* Поиск с возвратом: сумма подмножества I */
void backtrack(int target, int total, int *choices, int choicesSize) {
    // Если сумма подмножества равна target, сохраняем решение
    if (total == target) {
        for (int i = 0; i < stateSize; i++) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // Перебираем все варианты
    for (int i = 0; i < choicesSize; i++) {
        // Отсечение: если сумма подмножества превысит target, пропускаем этот вариант
        if (total + choices[i] > target) {
            continue;
        }
        // Пробуем вариант и обновляем сумму элементов total
        state[stateSize++] = choices[i];
        // Переходим к следующему выбору
        backtrack(target, total + choices[i], choices, choicesSize);
        // Возврат: отменяем выбор и восстанавливаем прежнее состояние
        stateSize--;
    }
}

/* Задача о сумме подмножества I (с повторяющимися подмножествами) */
void subsetSumINaive(int *nums, int numsSize, int target) {
    resSize = 0; // Начальное число решений равно 0
    backtrack(target, 0, nums, numsSize);
}

/* Основная программа */
int main() {
    int nums[] = {3, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumINaive(nums, numsSize, target);

    printf("Исходный массив nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("Все подмножества с суммой %d: res = \n", target);
    for (int i = 0; i < resSize; i++) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
