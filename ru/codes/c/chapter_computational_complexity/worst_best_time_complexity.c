/**
 * File: worst_best_time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* Создать массив с элементами { 1, 2, ..., n } в случайном порядке */
int *randomNumbers(int n) {
    // Выделить память в куче (создать одномерный массив переменной длины: число элементов равно n, тип элементов — int)
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
        // Когда элемент 1 находится в начале массива, достигается лучшая временная сложность O(1)
        // Когда элемент 1 находится в конце массива, достигается худшая временная сложность O(n)
        if (nums[i] == 1)
            return i;
    }
    return -1;
}

/* Driver Code */
int main(int argc, char *argv[]) {
    // Инициализировать seed генератора случайных чисел
    srand((unsigned int)time(NULL));
    for (int i = 0; i < 10; i++) {
        int n = 100;
        int *nums = randomNumbers(n);
        int index = findOne(nums, n);
        printf("\nПосле перемешивания массива [ 1, 2, ..., n ] nums = ");
        printArray(nums, n);
        printf("Индекс числа 1 = %d\n", index);
        // Освободить память в куче
        if (nums != NULL) {
            free(nums);
            nums = NULL;
        }
    }

    return 0;
}
