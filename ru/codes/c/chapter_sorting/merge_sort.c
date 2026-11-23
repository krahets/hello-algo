/**
 * File: merge_sort.c
 * Created Time: 2022-03-21
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* Объединить левый и правый подмассивы */
void merge(int *nums, int left, int mid, int right) {
    // Диапазон левого подмассива: [left, mid], диапазон правого подмассива: [mid+1, right]
    // Создать временный массив tmp для хранения результата слияния
    int tmpSize = right - left + 1;
    int *tmp = (int *)malloc(tmpSize * sizeof(int));
    // Инициализировать начальные индексы левого и правого подмассивов
    int i = left, j = mid + 1, k = 0;
    // Пока в левом и правом подмассивах еще есть элементы, сравнивать их и копировать меньший во временный массив
    while (i <= mid && j <= right) {
        if (nums[i] <= nums[j]) {
            tmp[k++] = nums[i++];
        } else {
            tmp[k++] = nums[j++];
        }
    }
    // Скопировать оставшиеся элементы левого и правого подмассивов во временный массив
    while (i <= mid) {
        tmp[k++] = nums[i++];
    }
    while (j <= right) {
        tmp[k++] = nums[j++];
    }
    // Скопировать элементы временного массива tmp обратно в соответствующий диапазон исходного массива nums
    for (k = 0; k < tmpSize; ++k) {
        nums[left + k] = tmp[k];
    }
    // Освободить память
    free(tmp);
}

/* Сортировка слиянием */
void mergeSort(int *nums, int left, int right) {
    // Условие завершения
    if (left >= right)
        return; // Завершить рекурсию, когда длина подмассива равна 1
    // Этап разбиения
    int mid = left + (right - left) / 2;    // Вычислить середину
    mergeSort(nums, left, mid);      // Рекурсивно обработать левый подмассив
    mergeSort(nums, mid + 1, right); // Рекурсивно обработать правый подмассив
    // Этап слияния
    merge(nums, left, mid, right);
}

/* Driver Code */
int main() {
    /* Сортировка слиянием */
    int nums[] = {7, 3, 2, 6, 0, 1, 5, 4};
    int size = sizeof(nums) / sizeof(int);
    mergeSort(nums, 0, size - 1);
    printf("После сортировки слиянием nums = ");
    printArray(nums, size);

    return 0;
}
