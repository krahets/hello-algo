/**
 * File: insertion_sort.c
 * Created Time: 2022-12-29
 * Author: Listening (https://github.com/L-Super)
 */

#include "../utils/common.h"

/* Сортировка вставками */
void insertionSort(int nums[], int size) {
    // Внешний цикл: отсортированный диапазон [0, i-1]
    for (int i = 1; i < size; i++) {
        int base = nums[i], j = i - 1;
        // Внутренний цикл: вставить base в правильную позицию отсортированного диапазона [0, i-1]
        while (j >= 0 && nums[j] > base) {
            // Сдвинуть nums[j] на одну позицию вправо
            nums[j + 1] = nums[j];
            j--;
        }
        // Поместить base в правильную позицию
        nums[j + 1] = base;
    }
}

/* Driver Code */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    insertionSort(nums, 6);
    printf("После сортировки вставками nums = ");
    for (int i = 0; i < 6; i++) {
        printf("%d ", nums[i]);
    }
    printf("\n");

    return 0;
}
