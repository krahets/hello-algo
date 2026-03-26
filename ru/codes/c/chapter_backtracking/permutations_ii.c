/**
 * File: permutations_ii.c
 * Created Time: 2023-10-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.h"

// Предположим, что существует не более 1000 перестановок, элементмаксимальныйравно 1000
#define MAX_SIZE 1000

/* Алгоритм бэктрекинга: все перестановки II */
void backtrack(int *state, int stateSize, int *choices, int choicesSize, bool *selected, int **res, int *resSize) {
    // Когда длина состояния равна числу элементов, записать решение
    if (stateSize == choicesSize) {
        res[*resSize] = (int *)malloc(choicesSize * sizeof(int));
        for (int i = 0; i < choicesSize; i++) {
            res[*resSize][i] = state[i];
        }
        (*resSize)++;
        return;
    }
    // Перебрать все варианты выбора
    bool duplicated[MAX_SIZE] = {false};
    for (int i = 0; i < choicesSize; i++) {
        int choice = choices[i];
        // Отсечение: не допускается повторный выбор элемента и не допускается повторный выбор равных элементов
        if (!selected[i] && !duplicated[choice]) {
            // Попытка: сделать выбор и обновить состояние
            duplicated[choice] = true; // Записатьвыбранныеэлементзначение
            selected[i] = true;
            state[stateSize] = choice;
            // Перейти к следующему варианту выбора
            backtrack(state, stateSize + 1, choices, choicesSize, selected, res, resSize);
            // Откат: отменить выбор и восстановить предыдущее состояние
            selected[i] = false;
        }
    }
}

/* Все перестановки II */
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

/* Driver Code */
int main() {
    int nums[] = {1, 1, 2};
    int numsSize = sizeof(nums) / sizeof(nums[0]);
    int returnSize;

    int **res = permutationsII(nums, numsSize, &returnSize);

    printf("Входной массив nums = ");
    printArray(nums, numsSize);
    printf("\nВсе перестановки res = \n");
    for (int i = 0; i < returnSize; i++) {
        printArray(res[i], numsSize);
    }

    // Освободить память
    for (int i = 0; i < returnSize; i++) {
        free(res[i]);
    }
    free(res);

    return 0;
}
