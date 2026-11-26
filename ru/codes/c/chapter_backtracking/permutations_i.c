/**
 * File: permutations_i.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com), krahets (krahets@163.com)
 */

#include "../utils/common.h"

// Предполагаем, что число перестановок не превышает 1000
#define MAX_SIZE 1000

/* Поиск с возвратом: перестановки I */
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
    for (int i = 0; i < choicesSize; i++) {
        int choice = choices[i];
        // Отсечение: нельзя выбирать один элемент дважды
        if (!selected[i]) {
            // Пробуем вариант и обновляем состояние
            selected[i] = true;
            state[stateSize] = choice;
            // Переходим к следующему выбору
            backtrack(state, stateSize + 1, choices, choicesSize, selected, res, resSize);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            selected[i] = false;
        }
    }
}

/* Перестановки I */
int **permutationsI(int *nums, int numsSize, int *returnSize) {
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
    int nums[] = {1, 2, 3};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int returnSize;

    int **res = permutationsI(nums, numsSize, &returnSize);

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
