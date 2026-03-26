/**
 * File: worst_best_time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* Сгенерировать массив из элементов { 1, 2, ..., n } в перемешанном порядке */
int *randomNumbers(int n) {
    // Выделить память в куче (создать одномерный массив переменной длины: число элементов равно n, тип элементов int)
    int *nums = (int *)malloc(n * sizeof(int));
    // Сгенерировать массив nums = { 1, 2, 3, ..., n }
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
        // Когда элемент 1 находится в начале массива, достигается наилучшая временная сложность O(1)
        // Когда элемент 1 находится в конце массива, достигается наихудшая временная сложность O(n)
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* Driver Code */
int main(int argc, char *argv[]) {
    // Инициализировать seed случайных чисел
    srand((unsigned int)time(NULL));
    for (int i = 0; i < 10; i++) {
        int n = 100;
        int *nums = randomNumbers(n);
        int index = findOne(nums, n);
        printf("\nПосле перемешивания массива [ 1, 2, ..., n ] = ");
        printArray(nums, n);
        printf("Индекс числа 1 равен %d\n", index);
        // Освободить память кучи
        if (nums != NULL) {
            free(nums);
            nums = NULL;
        }
    }

    return 0;
}
