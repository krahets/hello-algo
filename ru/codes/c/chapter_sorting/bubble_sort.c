/**
 * File: bubble_sort.c
 * Created Time: 2022-12-26
 * Author: Listening (https://github.com/L-Super)
 */

#include "../utils/common.h"

/* Сортировка пузырьком */
void bubbleSort(int nums[], int size) {
    // Внешний цикл: неотсортированный участок [0, i]
    for (int i = size - 1; i > 0; i--) {
        // Внутренний цикл: обменами переместить максимум участка [0, i] на его правый конец
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                int temp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = temp;
            }
        }
    }
}

/* Сортировка пузырьком с флагом обмена*/
void bubbleSortWithFlag(int nums[], int size) {
    // Внешний цикл: неотсортированный участок [0, i]
    for (int i = size - 1; i > 0; i--) {
        bool flag = false;
        // Внутренний цикл: обменами переместить максимум участка [0, i] на его правый конец
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                int temp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = temp;
                flag = true;
            }
        }
        if (!flag)
            break;
    }
}

/* Тестовый пример */
int main() {
    int nums[6] = {4, 1, 3, 1, 5, 2};
    printf("После сортировки пузырьком: ");
    bubbleSort(nums, 6);
    for (int i = 0; i < 6; i++) {
        printf("%d ", nums[i]);
    }

    int nums1[6] = {4, 1, 3, 1, 5, 2};
    printf("\nПосле сортировки пузырьком с оптимизацией: ");
    bubbleSortWithFlag(nums1, 6);
    for (int i = 0; i < 6; i++) {
        printf("%d ", nums1[i]);
    }
    printf("\n");

    return 0;
}
