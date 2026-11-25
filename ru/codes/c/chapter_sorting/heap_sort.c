/**
 * File: heap_sort.c
 * Created Time: 2023-05-30
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Размер кучи равен n. Выполнить просеивание вниз от узла i */
void siftDown(int nums[], int n, int i) {
    while (1) {
        // Найти среди i, l, r узел с наибольшим значением и обозначить его ma
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma])
            ma = l;
        if (r < n && nums[r] > nums[ma])
            ma = r;
        // Если максимум уже в i или индексы l и r вне кучи, завершить просеивание
        if (ma == i) {
            break;
        }
        // Поменять два узла местами
        int temp = nums[i];
        nums[i] = nums[ma];
        nums[ma] = temp;
        // Продолжить просеивание вниз
        i = ma;
    }
}

/* Пирамидальная сортировка */
void heapSort(int nums[], int n) {
    // Построить кучу: выполнить просеивание для всех узлов, кроме листьев
    for (int i = n / 2 - 1; i >= 0; --i) {
        siftDown(nums, n, i);
    }
    // Извлечь максимум из кучи n-1 раз
    for (int i = n - 1; i > 0; --i) {
        // Обменять корень с крайним правым листом (первый элемент с последним)
        int tmp = nums[0];
        nums[0] = nums[i];
        nums[i] = tmp;
        // Выполнить просеивание вниз от корня
        siftDown(nums, i, 0);
    }
}

/* Тестовый пример */
int main() {
    int nums[] = {4, 1, 3, 1, 5, 2};
    int n = sizeof(nums) / sizeof(nums[0]);

    heapSort(nums, n);
    printf("После пирамидальной сортировки nums = ");
    printArray(nums, n);

    return 0;
}