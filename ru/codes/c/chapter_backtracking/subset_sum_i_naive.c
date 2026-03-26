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

/* Алгоритм бэктрекинга: сумма подмножества I */
void backtrack(int target, int total, int *choices, int choicesSize) {
    // Если сумма подмножества равна target, записать решение
    if (total == target) {
        for (int i = 0; i < stateSize; i++) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // Перебрать все варианты выбора
    for (int i = 0; i < choicesSize; i++) {
        // Отсечение: если сумма подмножества превышает target, пропустить этот выбор
        if (total + choices[i] > target) {
            continue;
        }
        // Попытка: сделать выбор и обновить сумму элементов total
        state[stateSize++] = choices[i];
        // Перейти к следующему варианту выбора
        backtrack(target, total + choices[i], choices, choicesSize);
        // Откат: отменить выбор и восстановить предыдущее состояние
        stateSize--;
    }
}

/* Решить задачу суммы подмножества I (включая повторяющиеся подмножества) */
void subsetSumINaive(int *nums, int numsSize, int target) {
    resSize = 0; // Инициализировать количество решений нулем
    backtrack(target, 0, nums, numsSize);
}

/* Driver Code */
int main() {
    int nums[] = {3, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumINaive(nums, numsSize, target);

    printf("Входной массив nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("Все подмножества res с суммой %d = \n", target);
    for (int i = 0; i < resSize; i++) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
