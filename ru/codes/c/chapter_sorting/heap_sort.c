/**
 * File: heap_sort.c
 * Created Time: 2023-05-30
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Если длина кучи равна n, начиная с узла i выполнить просеивание сверху вниз */
void siftDown(int nums[], int n, int i) {
    while (1) {
        // Определить узел с максимальным значением среди i, l и r и обозначить его как ma
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma])
            ma = l;
        if (r < n && nums[r] > nums[ma])
            ma = r;
        // Если узел i уже максимален или индексы l и r выходят за границы, дальнейшая heapify не требуется
        if (ma == i) {
            break;
        }
        // Поменять местами два узла
        int temp = nums[i];
        nums[i] = nums[ma];
        nums[ma] = temp;
        // Циклически выполнять просеивание вниз
        i = ma;
    }
}

/* Сортировка кучей */
void heapSort(int nums[], int n) {
    // Построение кучи: выполнить просеивание для всех узлов, кроме листьев
    for (int i = n / 2 - 1; i >= 0; --i) {
        siftDown(nums, n, i);
    }
    // Извлекать максимальный элемент из кучи в течение n-1 итераций
    for (int i = n - 1; i > 0; --i) {
        // Поменять местами корневой узел и крайний правый лист (первый и последний элементы)
        int tmp = nums[0];
        nums[0] = nums[i];
        nums[i] = tmp;
        // Начиная с корневого узла, выполнить просеивание сверху вниз
        siftDown(nums, i, 0);
    }
}

/* Driver Code */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    int n = sizeof(nums) / sizeof(nums[0]);

    heapSort(nums, n);
    printf("После завершения сортировки кучей nums = ");
    printArray(nums, n);

    return 0;
}
