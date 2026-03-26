/**
 * File: binary_search_edge.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Бинарный поиск точки вставки (при наличии повторяющихся элементов) */
int binarySearchInsertion(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // Инициализировать закрытый интервал [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Вычислить средний индекс m
        if (nums[m] < target) {
            i = m + 1; // target находится в интервале [m+1, j]
        } else {
            j = m - 1; // Первый элемент, меньший target, находится в интервале [i, m-1]
        }
    }
    // Вернуть точку вставки i
    return i;
}

/* Бинарный поиск самого левого target */
int binarySearchLeftEdge(int *nums, int numSize, int target) {
    // Эквивалентно поиску точки вставки для target
    int i = binarySearchInsertion(nums, numSize, target);
    // Если target не найден, вернуть -1
    if (i == numSize || nums[i] != target) {
        return -1;
    }
    // Найти target и вернуть индекс i
    return i;
}

/* Бинарный поиск самого правого target */
int binarySearchRightEdge(int *nums, int numSize, int target) {
    // Преобразовать задачу в поиск самого левого элемента target + 1
    int i = binarySearchInsertion(nums, numSize, target + 1);
    // j указывает на самый правый target, а i указывает на первый элемент, больший target
    int j = i - 1;
    // Если target не найден, вернуть -1
    if (j == -1 || nums[j] != target) {
        return -1;
    }
    // Найти target и вернуть индекс j
    return j;
}

/* Driver Code */
int main() {
    // Массив с повторяющимися элементами
    int nums[] = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    printf("\nМассив nums = ");
    printArray(nums, sizeof(nums) / sizeof(nums[0]));

    // Бинарный поиск левой и правой границ
    int targets[] = {6, 7};
    for (int i = 0; i < sizeof(targets) / sizeof(targets[0]); i++) {
        int index = binarySearchLeftEdge(nums, sizeof(nums) / sizeof(nums[0]), targets[i]);
        printf("Индекс самого левого элемента %d равен %d\n", targets[i], index);
        index = binarySearchRightEdge(nums, sizeof(nums) / sizeof(nums[0]), targets[i]);
        printf("Индекс самого правого элемента %d равен %d\n", targets[i], index);
    }

    return 0;
}
