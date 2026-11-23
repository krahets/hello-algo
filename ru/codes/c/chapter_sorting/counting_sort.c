/**
 * File: counting_sort.c
 * Created Time: 2023-03-20
 * Author: Reanon (793584285@qq.com), Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* Сортировка подсчетом */
// Простая реализация, не подходит для сортировки объектов
void countingSortNaive(int nums[], int size) {
    // 1. Найти максимальный элемент массива m
    int m = 0;
    for (int i = 0; i < size; i++) {
        if (nums[i] > m) {
            m = nums[i];
        }
    }
    // 2. Подсчитать число появлений каждой цифры
    // counter[num] обозначает число появлений num
    int *counter = calloc(m + 1, sizeof(int));
    for (int i = 0; i < size; i++) {
        counter[nums[i]]++;
    }
    // 3. Обойти counter и заполнить исходный массив nums элементами
    int i = 0;
    for (int num = 0; num < m + 1; num++) {
        for (int j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
    // 4. Освободить память
    free(counter);
}

/* Сортировка подсчетом */
// Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
void countingSort(int nums[], int size) {
    // 1. Найти максимальный элемент массива m
    int m = 0;
    for (int i = 0; i < size; i++) {
        if (nums[i] > m) {
            m = nums[i];
        }
    }
    // 2. Подсчитать число появлений каждой цифры
    // counter[num] обозначает число появлений num
    int *counter = calloc(m, sizeof(int));
    for (int i = 0; i < size; i++) {
        counter[nums[i]]++;
    }
    // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
    // То есть counter[num]-1 — это индекс последнего появления num в res
    for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
    // Инициализировать массив res для хранения результата
    int *res = malloc(sizeof(int) * size);
    for (int i = size - 1; i >= 0; i--) {
        int num = nums[i];
        res[counter[num] - 1] = num; // Поместить num по соответствующему индексу
        counter[num]--;              // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
    }
    // Перезаписать исходный массив nums массивом результата res
    memcpy(nums, res, size * sizeof(int));
    // 5. Освободить память
    free(res);
    free(counter);
}

/* Driver Code */
int main() {
    int nums[] = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    int size = sizeof(nums) / sizeof(int);
    countingSortNaive(nums, size);
    printf("После сортировки подсчетом (объекты не поддерживаются) nums = ");
    printArray(nums, size);

    int nums1[] = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    int size1 = sizeof(nums1) / sizeof(int);
    countingSort(nums1, size1);
    printf("После сортировки подсчетом nums1 = ");
    printArray(nums1, size1);

    return 0;
}
