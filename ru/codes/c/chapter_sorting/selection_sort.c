/**
 * File: selection_sort.c
 * Created Time: 2023-05-31
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Сортировка выбором */
void selectionSort(int nums[], int n) {
    // Внешний цикл: неотсортированный диапазон [i, n-1]
    for (int i = 0; i < n - 1; i++) {
        // Внутренний цикл: найти минимальный элемент в неотсортированном диапазоне
        int k = i;
        for (int j = i + 1; j < n; j++) {
            if (nums[j] < nums[k])
                k = j; // Записать индекс минимального элемента
        }
        // Поменять этот минимальный элемент местами с первым элементом неотсортированного диапазона
        int temp = nums[i];
        nums[i] = nums[k];
        nums[k] = temp;
    }
}

/* Driver Code */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    int n = sizeof(nums) / sizeof(nums[0]);

    selectionSort(nums, n);

    printf("После сортировки выбором nums = ");
    printArray(nums, n);

    return 0;
}
