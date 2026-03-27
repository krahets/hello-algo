/**
 * File: binary_search_insertion.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Бинарный поиск точки вставки (без повторяющихся элементов) */
int binarySearchInsertionSimple(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Вычислить индекс середины m
        if (nums[m] < target) {
            i = m + 1; // target находится в интервале [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // target находится в интервале [i, m-1]
        } else {
            return m; // Найти target и вернуть точку вставки m
        }
    }
    // target не найден, вернуть точку вставки i
    return i;
}

/* Бинарный поиск точки вставки (с повторяющимися элементами) */
int binarySearchInsertion(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Вычислить индекс середины m
        if (nums[m] < target) {
            i = m + 1; // target находится в интервале [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // target находится в интервале [i, m-1]
        } else {
            j = m - 1; // Первый элемент меньше target находится в интервале [i, m-1]
        }
    }
    // Вернуть точку вставки i
    return i;
}

/* Driver Code */
int main() {
    // Массив без повторяющихся элементов
    int nums1[] = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    printf("\nМассив nums = ");
    printArray(nums1, sizeof(nums1) / sizeof(nums1[0]));
    // Бинарный поиск точки вставки
    int targets1[] = {6, 9};
    for (int i = 0; i < sizeof(targets1) / sizeof(targets1[0]); i++) {
        int index = binarySearchInsertionSimple(nums1, sizeof(nums1) / sizeof(nums1[0]), targets1[i]);
        printf("Индекс позиции вставки для элемента %d = %d\n", targets1[i], index);
    }

    // Массив с повторяющимися элементами
    int nums2[] = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    printf("\nМассив nums = ");
    printArray(nums2, sizeof(nums2) / sizeof(nums2[0]));
    // Бинарный поиск точки вставки
    int targets2[] = {2, 6, 20};
    for (int i = 0; i < sizeof(targets2) / sizeof(int); i++) {
        int index = binarySearchInsertion(nums2, sizeof(nums2) / sizeof(nums2[0]), targets2[i]);
        printf("Индекс позиции вставки для элемента %d = %d\n", targets2[i], index);
    }

    return 0;
}
