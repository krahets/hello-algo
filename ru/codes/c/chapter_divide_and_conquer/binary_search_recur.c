/**
 * File: binary_search_recur.c
 * Created Time: 2023-10-01
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* Двоичный поиск: задача f(i, j) */
int dfs(int nums[], int target, int i, int j) {
    // Если интервал пуст, искомого элемента нет. Возвращаем -1
    if (i > j) {
        return -1;
    }
    // Вычисляем индекс середины m
    int m = (i + j) / 2;
    if (nums[m] < target) {
        // Рекурсивно решаем подзадачу f(m+1, j)
        return dfs(nums, target, m + 1, j);
    } else if (nums[m] > target) {
        // Рекурсивно решаем подзадачу f(i, m-1)
        return dfs(nums, target, i, m - 1);
    } else {
        // Искомый элемент найден. Возвращаем его индекс
        return m;
    }
}

/* Двоичный поиск */
int binarySearch(int nums[], int target, int numsSize) {
    int n = numsSize;
    // Решаем задачу f(0, n-1)
    return dfs(nums, target, 0, n - 1);
}

/* Основная программа */
int main() {
    int target = 6;
    int nums[] = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    int numsSize = sizeof(nums) / sizeof(nums[0]);

    // Двоичный поиск (замкнутый интервал)
    int index = binarySearch(nums, target, numsSize);
    printf("Индекс элемента 6 = %d\n", index);

    return 0;
}
