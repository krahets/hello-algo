/**
 * File: binary_search.c
 * Created Time: 2023-03-18
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* Двоичный поиск на замкнутом интервале */
int binarySearch(int *nums, int len, int target) {
    // Задаём замкнутый интервал [0, n-1]: i указывает на первый элемент, j — на последний
    int i = 0, j = len - 1;
    // Повторяем, пока интервал поиска не опустеет (i > j)
    while (i <= j) {
        int m = i + (j - i) / 2; // Вычисляем индекс середины m
        if (nums[m] < target)    // Искать target следует в интервале [m+1, j]
            i = m + 1;
        else if (nums[m] > target) // Искать target следует в интервале [i, m-1]
            j = m - 1;
        else // Элемент найден, возвращаем его индекс
            return m;
    }
    // Элемент не найден, возвращаем -1
    return -1;
}

/* Двоичный поиск на полуинтервале с открытой правой границей */
int binarySearchLCRO(int *nums, int len, int target) {
    // Задаём полуинтервал [0, n): i указывает на первый элемент, j — на позицию за последним
    int i = 0, j = len;
    // Повторяем, пока интервал поиска не опустеет (i = j)
    while (i < j) {
        int m = i + (j - i) / 2; // Вычисляем индекс середины m
        if (nums[m] < target)    // Искать target следует в интервале [m+1, j)
            i = m + 1;
        else if (nums[m] > target) // Искать target следует в интервале [i, m)
            j = m;
        else // Элемент найден, возвращаем его индекс
            return m;
    }
    // Элемент не найден, возвращаем -1
    return -1;
}

/* Пример использования */
int main() {
    int target = 6;
    int nums[10] = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};

    /* Двоичный поиск на замкнутом интервале */
    int index = binarySearch(nums, 10, target);
    printf("Индекс элемента 6 = %d\n", index);

    /* Двоичный поиск на полуинтервале с открытой правой границей */
    index = binarySearchLCRO(nums, 10, target);
    printf("Индекс элемента 6 = %d\n", index);

    return 0;
}
