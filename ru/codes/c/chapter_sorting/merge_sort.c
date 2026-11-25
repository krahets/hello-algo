/**
 * File: merge_sort.c
 * Created Time: 2022-03-21
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* Слить левый и правый подмассивы */
void merge(int *nums, int left, int mid, int right) {
    // Левый подмассив занимает [left, mid], правый — [mid+1, right]
    // Создать временный массив tmp для результата слияния
    int tmpSize = right - left + 1;
    int *tmp = (int *)malloc(tmpSize * sizeof(int));
    // Установить индексы на начало левого и правого подмассивов
    int i = left, j = mid + 1, k = 0;
    // Пока в обоих подмассивах есть элементы, сравнивать их и копировать меньший во временный массив
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j]) {
            tmp[k++] = nums[i++];
        } else {
            tmp[k++] = nums[j++];
        }
    }
    // Скопировать оставшиеся элементы подмассивов во временный массив
    while (i <= mid) {
        tmp[k++] = nums[i++];
    }
    while (j <= right) {
        tmp[k++] = nums[j++];
    }
    // Скопировать элементы tmp обратно на соответствующий участок nums
    for (k = 0; k < tmpSize; ++k) {
        nums[left + k] = tmp[k];
    }
    // Освободить память
    free(tmp);
}

/* Сортировка слиянием */
void mergeSort(int *nums, int left, int right) {
    // Условие остановки
    if (left >= right)
        return; // Завершить рекурсию, когда длина подмассива равна 1
    // Разбиение
    int mid = left + (right - left) / 2;    // Вычислить середину
    mergeSort(nums, left, mid);      // Рекурсивно отсортировать левый подмассив
    mergeSort(nums, mid + 1, right); // Рекурсивно отсортировать правый подмассив
    // Слияние
    merge(nums, left, mid, right);
}

/* Тестовый пример */
int main() {
    /* Сортировка слиянием */
    int nums[] = {7, 3, 2, 6, 0, 1, 5, 4};
    int size = sizeof(nums) / sizeof(int);
    mergeSort(nums, 0, size - 1);
    printf("После сортировки слиянием nums = ");
    printArray(nums, size);

    return 0;
}
