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

/* Поиск с возвратом: сумма подмножества I */
void backtrack(int target, int *choices, int choicesSize, int start) {
    // Если сумма подмножества равна target, сохраняем решение
    if (target == 0) {
        for (int i = 0; i < stateSize; ++i) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // Перебираем все варианты
    // Отсечение 2: начинаем перебор с start, чтобы не получать одинаковые подмножества
    for (int i = start; i < choicesSize; i++) {
        // Отсечение 1: если сумма подмножества превышает target, выходим из цикла
        // Массив отсортирован: следующие элементы не меньше текущего, поэтому сумма тоже превысит target
        if (target - choices[i] < 0) {
            break;
        }
        // Пробуем вариант и обновляем target и start
        state[stateSize] = choices[i];
        stateSize++;
        // Переходим к следующему выбору
        backtrack(target - choices[i], choices, choicesSize, i);
        // Возврат: отменяем выбор и восстанавливаем прежнее состояние
        stateSize--;
    }
}

/* Функция сравнения */
int cmp(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

/* Задача о сумме подмножества I */
void subsetSumI(int *nums, int numsSize, int target) {
    qsort(nums, numsSize, sizeof(int), cmp); // Сортируем nums
    int start = 0;                           // Начальная позиция перебора
    backtrack(target, nums, numsSize, start);
}

/* Основная программа */
int main() {
    int nums[] = {3, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumI(nums, numsSize, target);

    printf("Исходный массив nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("Все подмножества с суммой %d: res = \n", target);
    for (int i = 0; i < resSize; ++i) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
