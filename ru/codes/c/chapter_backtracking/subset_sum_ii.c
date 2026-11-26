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

/* Поиск с возвратом: сумма подмножества II */
void backtrack(int target, int *choices, int choicesSize, int start) {
    // Если сумма подмножества равна target, сохраняем решение
    if (target == 0) {
        for (int i = 0; i < stateSize; i++) {
            res[resSize][i] = state[i];
        }
        resColSizes[resSize++] = stateSize;
        return;
    }
    // Перебираем все варианты
    // Отсечение 2: начинаем перебор с start, чтобы не получать одинаковые подмножества
    // Отсечение 3: начинаем перебор с start, чтобы не брать один и тот же элемент дважды
    for (int i = start; i < choicesSize; i++) {
        // Отсечение 1: если сумма подмножества превышает target, пропускаем вариант
        if (target - choices[i] < 0) {
            continue;
        }
        // Отсечение 4: если значение совпало с уже проверенным на этом шаге соседом слева, пропускаем повторную ветвь
        if (i > start && choices[i] == choices[i - 1]) {
            continue;
        }
        // Пробуем вариант и обновляем target и start
        state[stateSize] = choices[i];
        stateSize++;
        // Переходим к следующему выбору
        backtrack(target - choices[i], choices, choicesSize, i + 1);
        // Возврат: отменяем выбор и восстанавливаем прежнее состояние
        stateSize--;
    }
}

/* Функция сравнения */
int cmp(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

/* Задача о сумме подмножества II */
void subsetSumII(int *nums, int numsSize, int target) {
    // Сортируем nums
    qsort(nums, numsSize, sizeof(int), cmp);
    // Начинаем поиск с возвратом
    backtrack(target, nums, numsSize, 0);
}

/* Основная программа */
int main() {
    int nums[] = {4, 4, 5};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int target = 9;

    subsetSumII(nums, numsSize, target);

    printf("Исходный массив nums = ");
    printArray(nums, numsSize);
    printf("target = %d\n", target);
    printf("Все подмножества с суммой %d: res = \n", target);
    for (int i = 0; i < resSize; ++i) {
        printArray(res[i], resColSizes[i]);
    }

    return 0;
}
