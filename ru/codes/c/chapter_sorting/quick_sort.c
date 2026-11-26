/**
 * File: quick_sort.c
 * Created Time: 2023-01-18
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* Обмен элементов */
void swap(int nums[], int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
}

/* Разбиение двумя указателями */
int partition(int nums[], int left, int right) {
    // Выбрать nums[left] опорным элементом
    int i = left, j = right;
    while (i < j) {
        while (i < j && nums[j] >= nums[left]) {
            j--; // Справа налево найти первый элемент меньше опорного
        }
        while (i < j && nums[i] <= nums[left]) {
            i++; // Слева направо найти первый элемент больше опорного
        }
        // Поменять эти элементы местами
        swap(nums, i, j);
    }
    // Обменом поместить опорный элемент на границу подмассивов
    swap(nums, i, left);
    // Вернуть индекс опорного элемента
    return i;
}

/* Быстрая сортировка */
void quickSort(int nums[], int left, int right) {
    // Завершить рекурсию при длине подмассива 1
    if (left >= right) {
        return;
    }
    // Разбиение двумя указателями
    int pivot = partition(nums, left, right);
    // Рекурсивно отсортировать левый и правый подмассивы
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
}

// Далее — быстрая сортировка с выбором медианы

/* Выбрать медиану трёх кандидатов */
int medianThree(int nums[], int left, int mid, int right) {
    int l = nums[left], m = nums[mid], r = nums[right];
    if ((l <= m && m <= r) || (r <= m && m <= l))
        return mid; // m лежит между l и r
    if ((m <= l && l <= r) || (r <= l && l <= m))
        return left; // l лежит между m и r
    return right;
}

/* Разбиение двумя указателями с выбором медианы трёх */
int partitionMedian(int nums[], int left, int right) {
    // Выбрать медиану трёх кандидатов
    int med = medianThree(nums, left, (left + right) / 2, right);
    // Обменом поместить медиану в начало массива
    swap(nums, left, med);
    // Выбрать nums[left] опорным элементом
    int i = left, j = right;
    while (i < j) {
        while (i < j && nums[j] >= nums[left])
            j--; // Справа налево найти первый элемент меньше опорного
        while (i < j && nums[i] <= nums[left])
            i++;          // Слева направо найти первый элемент больше опорного
        swap(nums, i, j); // Поменять эти элементы местами
    }
    swap(nums, i, left); // Обменом поместить опорный элемент на границу подмассивов
    return i;            // Вернуть индекс опорного элемента
}

/* Быстрая сортировка с выбором медианы трёх */
void quickSortMedian(int nums[], int left, int right) {
    // Завершить рекурсию при длине подмассива 1
    if (left >= right)
        return;
    // Разбиение двумя указателями
    int pivot = partitionMedian(nums, left, right);
    // Рекурсивно отсортировать левый и правый подмассивы
    quickSortMedian(nums, left, pivot - 1);
    quickSortMedian(nums, pivot + 1, right);
}

// Далее — быстрая сортировка с уменьшенной глубиной рекурсии

/* Быстрая сортировка с уменьшенной глубиной рекурсии */
void quickSortTailCall(int nums[], int left, int right) {
    // Завершить обработку при длине подмассива 1
    while (left < right) {
        // Выполнить разбиение двумя указателями
        int pivot = partition(nums, left, right);
        // Применить быструю сортировку к более короткому подмассиву
        if (pivot - left < right - pivot) {
            // Рекурсивно отсортировать левый подмассив
            quickSortTailCall(nums, left, pivot - 1);
            // Оставшийся неотсортированный участок: [pivot + 1, right]
            left = pivot + 1;
        } else {
            // Рекурсивно отсортировать правый подмассив
            quickSortTailCall(nums, pivot + 1, right);
            // Оставшийся неотсортированный участок: [left, pivot - 1]
            right = pivot - 1;
        }
    }
}

/* Тестовый пример */
int main() {
    /* Быстрая сортировка */
    int nums[] = {2, 4, 1, 0, 3, 5};
    int size = sizeof(nums) / sizeof(int);
    quickSort(nums, 0, size - 1);
    printf("После быстрой сортировки nums = ");
    printArray(nums, size);

    /* Быстрая сортировка с выбором медианы в качестве опорного элемента */
    int nums1[] = {2, 4, 1, 0, 3, 5};
    quickSortMedian(nums1, 0, size - 1);
    printf("После быстрой сортировки с выбором медианы nums = ");
    printArray(nums1, size);

    /* Быстрая сортировка с уменьшенной глубиной рекурсии */
    int nums2[] = {2, 4, 1, 0, 3, 5};
    quickSortTailCall(nums2, 0, size - 1);
    printf("После быстрой сортировки с уменьшенной глубиной рекурсии nums = ");
    printArray(nums1, size);

    return 0;
}
