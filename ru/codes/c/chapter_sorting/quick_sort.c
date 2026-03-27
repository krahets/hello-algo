/**
 * File: quick_sort.c
 * Created Time: 2023-01-18
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* Поменять элементы местами */
void swap(int nums[], int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
}

/* Разбиение методом двух указателей */
int partition(int nums[], int left, int right) {
    // Взять nums[left] в качестве опорного элемента
    int i = left, j = right;
    while (i < j) {
        while (i < j && nums[j] >= nums[left]) {
            j--; // Искать справа налево первый элемент, меньший опорного
        }
        while (i < j && nums[i] <= nums[left]) {
            i++; // Искать слева направо первый элемент, больший опорного
        }
        // Поменять эти два элемента местами
        swap(nums, i, j);
    }
    // Переместить опорный элемент на границу двух подмассивов
    swap(nums, i, left);
    // Вернуть индекс опорного элемента
    return i;
}

/* Быстрая сортировка */
void quickSort(int nums[], int left, int right) {
    // Завершить рекурсию, когда длина подмассива равна 1
    if (left >= right) {
        return;
    }
    // Разбиение методом двух указателей
    int pivot = partition(nums, left, right);
    // Рекурсивно обработать левый и правый подмассивы
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
}

// Ниже приведена быстрая сортировка с оптимизацией медианой

/* Выбрать медиану из трех кандидатов */
int medianThree(int nums[], int left, int mid, int right) {
    int l = nums[left], m = nums[mid], r = nums[right];
    if ((l <= m && m <= r) || (r <= m && m <= l))
        return mid; // m находится между l и r
    if ((m <= l && l <= r) || (r <= l && l <= m))
        return left; // l находится между m и r
    return right;
}

/* Разбиение методом двух указателей (медиана трех) */
int partitionMedian(int nums[], int left, int right) {
    // Выбрать медиану из трех кандидатов
    int med = medianThree(nums, left, (left + right) / 2, right);
    // Переместить медиану в самый левый конец массива
    swap(nums, left, med);
    // Взять nums[left] в качестве опорного элемента
    int i = left, j = right;
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--; // Искать справа налево первый элемент, меньший опорного
        while (i < j && nums[i] <= nums[left])
            i++;          // Искать слева направо первый элемент, больший опорного
        swap(nums, i, j); // Поменять эти два элемента местами
    }
    swap(nums, i, left); // Переместить опорный элемент на границу двух подмассивов
    return i;            // Вернуть индекс опорного элемента
}

/* Быстрая сортировка (медиана трех) */
void quickSortMedian(int nums[], int left, int right) {
    // Завершить рекурсию, когда длина подмассива равна 1
    if (left >= right)
        return;
    // Разбиение методом двух указателей
    int pivot = partitionMedian(nums, left, right);
    // Рекурсивно обработать левый и правый подмассивы
    quickSortMedian(nums, left, pivot - 1);
    quickSortMedian(nums, pivot + 1, right);
}

// Ниже приведена быстрая сортировка с оптимизацией глубины рекурсии

/* Быстрая сортировка (оптимизация глубины рекурсии) */
void quickSortTailCall(int nums[], int left, int right) {
    // Завершить, когда длина подмассива равна 1
    while (left < right) {
        // Операция разбиения методом двух указателей
        int pivot = partition(nums, left, right);
        // Выполнить быструю сортировку для более короткого из двух подмассивов
        if (pivot - left < right - pivot) {
            // Рекурсивно отсортировать левый подмассив
            quickSortTailCall(nums, left, pivot - 1);
            // Оставшийся неотсортированный диапазон равен [pivot + 1, right]
            left = pivot + 1;
        } else {
            // Рекурсивно отсортировать правый подмассив
            quickSortTailCall(nums, pivot + 1, right);
            // Оставшийся неотсортированный диапазон равен [left, pivot - 1]
            right = pivot - 1;
        }
    }
}

/* Driver Code */
int main() {
    /* Быстрая сортировка */
    int nums[] = {2, 4, 1, 0, 3, 5};
    int size = sizeof(nums) / sizeof(int);
    quickSort(nums, 0, size - 1);
    printf("После завершения быстрой сортировки nums = ");
    printArray(nums, size);

    /* Быстрая сортировка (оптимизация с медианным опорным элементом) */
    int nums1[] = {2, 4, 1, 0, 3, 5};
    quickSortMedian(nums1, 0, size - 1);
    printf("После быстрой сортировки (оптимизация с медианным опорным элементом) nums = ");
    printArray(nums1, size);

    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    int nums2[] = {2, 4, 1, 0, 3, 5};
    quickSortTailCall(nums2, 0, size - 1);
    printf("После быстрой сортировки (оптимизация глубины рекурсии) nums = ");
    printArray(nums1, size);

    return 0;
}
