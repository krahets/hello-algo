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

/* Сортировка корзинами */
void bucketSort(float nums[], int n) {
    int k = n / 2;                                 // Инициализировать k = n/2 корзин
    int *sizes = malloc(k * sizeof(int));          // Записать размер каждой корзины
    float **buckets = malloc(k * sizeof(float *)); // Массив динамических массивов (корзины)
    // Предварительно выделить достаточно места для каждой корзины
    for (int i = 0; i < k; ++i) {
        buckets[i] = (float *)malloc(n * sizeof(float));
        sizes[i] = 0;
    }
    // 1. Распределить элементы массива по корзинам
    for (int i = 0; i < n; ++i) {
        int idx = (int)(nums[i] * k);
        buckets[idx][sizes[idx]++] = nums[i];
    }
    // 2. Выполнить сортировку внутри каждой корзины
    for (int i = 0; i < k; ++i) {
        qsort(buckets[i], sizes[i], sizeof(float), compare);
    }
    // 3. Объединить отсортированные корзины
    int idx = 0;
    for (int i = 0; i < k; ++i) {
        for (int j = 0; j < sizes[i]; ++j) {
            nums[idx++] = buckets[i][j];
        }
        // Освободить память
        free(buckets[i]);
    }
}

/* Driver Code */
int main() {
    // Пусть входные данные — числа с плавающей точкой из диапазона [0, 1)
    float nums[SIZE] = {0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f};
    bucketSort(nums, SIZE);
    printf("После сортировки корзинами nums = ");
    printArrayFloat(nums, SIZE);

    return 0;
}
