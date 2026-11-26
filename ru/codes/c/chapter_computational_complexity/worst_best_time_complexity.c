/**
 * File: worst_best_time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* Создать массив из чисел { 1, 2, ..., n } в случайном порядке */
int *randomNumbers(int n) {
    // Выделить память в куче для одномерного массива переменной длины из n элементов типа int
    int *nums = (int *)malloc(n * sizeof(int));
    // Создать массив nums = { 1, 2, 3, ..., n }
    for (int i = 0; i < n; i++) {
        nums[i] = i + 1;
    }
    // Случайно перемешать элементы массива
    for (int i = n - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
    return nums;
}

/* Найти индекс числа 1 в массиве nums */
int findOne(int *nums, int n) {
    for (int i = 0; i < n; i++) {
        // Если 1 стоит в начале массива, сложность минимальна: O(1)
        // Если 1 стоит в конце массива, сложность максимальна: O(n)
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* Основная программа */
int main(int argc, char *argv[]) {
    // Задать начальное значение генератора случайных чисел
    srand((unsigned int)time(NULL));
    for (int i = 0; i < 10; i++) {
        int n = 100;
        int *nums = randomNumbers(n);
        int index = findOne(nums, n);
        printf("\nМассив [ 1, 2, ..., n ] после перемешивания = ");
        printArray(nums, n);
        printf("Индекс числа 1: %d\n", index);
        // Освободить память в куче
        if (nums != NULL) {
            free(nums);
            nums = NULL;
        }
    }

    return 0;
}
