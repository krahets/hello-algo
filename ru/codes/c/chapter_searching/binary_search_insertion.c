/**
 * File: binary_search_insertion.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Двоичный поиск позиции вставки без повторов */
int binarySearchInsertionSimple(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // Задаём замкнутый интервал [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Вычисляем индекс середины m
        if (nums[m] < target) {
            i = m + 1; // Ищем target в интервале [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // Ищем target в интервале [i, m-1]
        } else {
            return m; // Значение target найдено, возвращаем позицию вставки m
        }
    }
    // Значение target не найдено, возвращаем позицию вставки i
    return i;
}

/* Двоичный поиск позиции вставки при наличии повторов */
int binarySearchInsertion(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // Задаём замкнутый интервал [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Вычисляем индекс середины m
        if (nums[m] < target) {
            i = m + 1; // Ищем target в интервале [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // Ищем target в интервале [i, m-1]
        } else {
            j = m - 1; // В интервале [i, m-1] ищем последний элемент, меньший target
        }
    }
    // Возвращаем позицию вставки i
    return i;
}

/* Пример использования */
int main() {
    // Массив без повторяющихся элементов
    int nums1[] = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    printf("\nМассив nums = ");
    printArray(nums1, sizeof(nums1) / sizeof(nums1[0]));
    // Двоичный поиск позиции вставки
    int targets1[] = {6, 9};
    for (int i = 0; i < sizeof(targets1) / sizeof(targets1[0]); i++) {
        int index = binarySearchInsertionSimple(nums1, sizeof(nums1) / sizeof(nums1[0]), targets1[i]);
        printf("Позиция вставки элемента %d = %d\n", targets1[i], index);
    }

    // Массив с повторяющимися элементами
    int nums2[] = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    printf("\nМассив nums = ");
    printArray(nums2, sizeof(nums2) / sizeof(nums2[0]));
    // Двоичный поиск позиции вставки
    int targets2[] = {2, 6, 20};
    for (int i = 0; i < sizeof(targets2) / sizeof(int); i++) {
        int index = binarySearchInsertion(nums2, sizeof(nums2) / sizeof(nums2[0]), targets2[i]);
        printf("Позиция вставки элемента %d = %d\n", targets2[i], index);
    }

    return 0;
}
