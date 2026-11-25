/**
 * File: binary_search_edge.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Двоичный поиск позиции вставки при наличии повторов */
int binarySearchInsertion(int *nums, int numSize, int target) {
    int i = 0, j = numSize - 1; // Задаём замкнутый интервал [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Вычисляем индекс середины m
        if (nums[m] < target) {
            i = m + 1; // Ищем target в интервале [m+1, j]
        } else {
            j = m - 1; // В интервале [i, m-1] ищем последний элемент, меньший target
        }
    }
    // Возвращаем позицию вставки i
    return i;
}

/* Двоичный поиск первого вхождения target */
int binarySearchLeftEdge(int *nums, int numSize, int target) {
    // Задача равносильна поиску позиции вставки target
    int i = binarySearchInsertion(nums, numSize, target);
    // Значение target не найдено, возвращаем -1
    if (i == numSize || nums[i] != target) {
        return -1;
    }
    // Значение target найдено, возвращаем индекс i
    return i;
}

/* Двоичный поиск последнего вхождения target */
int binarySearchRightEdge(int *nums, int numSize, int target) {
    // Сводим задачу к поиску первого вхождения target + 1
    int i = binarySearchInsertion(nums, numSize, target + 1);
    // j указывает на последнее вхождение target, а i — на первый элемент, больший target
    int j = i - 1;
    // Значение target не найдено, возвращаем -1
    if (j == -1 || nums[j] != target) {
        return -1;
    }
    // Значение target найдено, возвращаем индекс j
    return j;
}

/* Пример использования */
int main() {
    // Массив с повторяющимися элементами
    int nums[] = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    printf("\nМассив nums = ");
    printArray(nums, sizeof(nums) / sizeof(nums[0]));

    // Двоичный поиск левой и правой границ
    int targets[] = {6, 7};
    for (int i = 0; i < sizeof(targets) / sizeof(targets[0]); i++) {
        int index = binarySearchLeftEdge(nums, sizeof(nums) / sizeof(nums[0]), targets[i]);
        printf("Индекс первого вхождения %d = %d\n", targets[i], index);
        index = binarySearchRightEdge(nums, sizeof(nums) / sizeof(nums[0]), targets[i]);
        printf("Индекс последнего вхождения %d = %d\n", targets[i], index);
    }

    return 0;
}
