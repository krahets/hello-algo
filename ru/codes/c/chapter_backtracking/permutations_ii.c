/**
 * File: permutations_ii.c
 * Created Time: 2023-10-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.h"

// Предполагаем, что перестановок не больше 1000 и значения элементов не превышают 1000
#define MAX_SIZE 1000

/* Поиск с возвратом: перестановки II */
void backtrack(int *state, int stateSize, int *choices, int choicesSize, bool *selected, int **res, int *resSize) {
    // Когда длина текущей перестановки равна числу элементов, сохраняем решение
    if (stateSize == choicesSize) {
        res[*resSize] = (int *)malloc(choicesSize * sizeof(int));
        for (int i = 0; i < choicesSize; i++) {
            res[*resSize][i] = state[i];
        }
        (*resSize)++;
        return;
    }
    // Перебираем все варианты
    bool duplicated[MAX_SIZE] = {false};
    for (int i = 0; i < choicesSize; i++) {
        int choice = choices[i];
        // Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
        if (!selected[i] && !duplicated[choice]) {
            // Пробуем вариант и обновляем состояние
            duplicated[choice] = true; // Отмечаем уже выбранные значения
            selected[i] = true;
            state[stateSize] = choice;
            // Переходим к следующему выбору
            backtrack(state, stateSize + 1, choices, choicesSize, selected, res, resSize);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            selected[i] = false;
        }
    }
}

/* Перестановки II */
int **permutationsII(int *nums, int numsSize, int *returnSize) {
    int *state = (int *)malloc(numsSize * sizeof(int));
    bool *selected = (bool *)malloc(numsSize * sizeof(bool));
    for (int i = 0; i < numsSize; i++) {
        selected[i] = false;
    }
    int **res = (int **)malloc(MAX_SIZE * sizeof(int *));
    *returnSize = 0;

    backtrack(state, 0, nums, numsSize, selected, res, returnSize);

    free(state);
    free(selected);

    return res;
}

/* Основная программа */
int main() {
    int nums[] = {1, 1, 2};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int returnSize;

    int **res = permutationsII(nums, numsSize, &returnSize);

    printf("Исходный массив nums = ");
    printArray(nums, numsSize);
    printf("\nВсе перестановки res = \n");
    for (int i = 0; i < returnSize; i++) {
        printArray(res[i], numsSize);
    }

    // Освобождаем память
    for (int i = 0; i < returnSize; i++) {
        free(res[i]);
    }
    free(res);

    return 0;
}
