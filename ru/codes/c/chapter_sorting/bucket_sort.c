/**
 * File: bucket_sort.c
 * Created Time: 2023-05-30
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

#define SIZE 10

/* Функция сравнения для qsort */
int compare(const void *a, const void *b) {
    float fa = *(const float *)a;
    float fb = *(const float *)b;
    return (fa > fb) - (fa < fb);
}

/* Блочная сортировка */
void bucketSort(float nums[], int n) {
    int k = n / 2;                                 // Создать k = n/2 блоков
    int *sizes = malloc(k * sizeof(int));          // Хранить размер каждого блока
    float **buckets = malloc(k * sizeof(float *)); // Массив динамических массивов (блоков)
    // Заранее выделить достаточно памяти для каждого блока
    for (int i = 0; i < k; ++i) {
        buckets[i] = (float *)malloc(n * sizeof(float));
        sizes[i] = 0;
    }
    // 1. Распределить элементы массива по блокам
    for (int i = 0; i < n; ++i) {
        int idx = (int)(nums[i] * k);
        buckets[idx][sizes[idx]++] = nums[i];
    }
    // 2. Отсортировать каждый блок
    for (int i = 0; i < k; ++i) {
        qsort(buckets[i], sizes[i], sizeof(float), compare);
    }
    // 3. Объединить отсортированные блоки
    int idx = 0;
    for (int i = 0; i < k; ++i) {
        for (int j = 0; j < sizes[i]; ++j) {
            nums[idx++] = buckets[i][j];
        }
        // Освободить память
        free(buckets[i]);
    }
}

/* Тестовый пример */
int main() {
    // Входные данные — числа с плавающей точкой из интервала [0, 1)
    float nums[SIZE] = {0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f};
    bucketSort(nums, SIZE);
    printf("После блочной сортировки nums = ");
    printArrayFloat(nums, SIZE);

    return 0;
}
