/**
 * File: counting_sort.c
 * Created Time: 2023-03-20
 * Author: Reanon (793584285@qq.com), Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* Сортировка подсчётом */
// Простая реализация, непригодная для сортировки объектов
void countingSortNaive(int nums[], int size) {
    // 1. Найти максимальный элемент m в массиве
    int m = 0;
    for (int i = 0; i < size; i++) {
        if (nums[i] > m) {
            m = nums[i];
        }
    }
    // 2. Подсчитать число вхождений каждого значения
    // counter[num] — число вхождений num
    int *counter = calloc(m + 1, sizeof(int));
    for (int i = 0; i < size; i++) {
        counter[nums[i]]++;
    }
    // 3. Пройти по counter и записать элементы в исходный массив nums
    int i = 0;
    for (int num = 0; num < m + 1; num++) {
        for (int j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
    // 4. Освободить память
    free(counter);
}

/* Сортировка подсчётом */
// Полная реализация: устойчивая сортировка с поддержкой объектов
void countingSort(int nums[], int size) {
    // 1. Найти максимальный элемент m в массиве
    int m = 0;
    for (int i = 0; i < size; i++) {
        if (nums[i] > m) {
            m = nums[i];
        }
    }
    // 2. Подсчитать число вхождений каждого значения
    // counter[num] — число вхождений num
    int *counter = calloc(m + 1, sizeof(int));
    for (int i = 0; i < size; i++) {
        counter[nums[i]]++;
    }
    // 3. Вычислить префиксные суммы в counter, чтобы по частотам найти конечные позиции
    // То есть counter[num]-1 — индекс последнего вхождения num в res
    for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. Пройти по nums в обратном порядке и записать элементы в массив результата res
    // Создать массив res для результата
    int *res = malloc(sizeof(int) * size);
    for (int i = size - 1; i >= 0; i--) {
        int num = nums[i];
        res[counter[num] - 1] = num; // Поместить num по соответствующему индексу
        counter[num]--;              // Уменьшить префиксную сумму на 1, чтобы определить позицию следующего вхождения num
    }
    // Скопировать результат из res в исходный массив nums
    memcpy(nums, res, size * sizeof(int));
    // 5. Освободить память
    free(res);
    free(counter);
}

/* Тестовый пример */
int main() {
    int nums[] = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    int size = sizeof(nums) / sizeof(int);
    countingSortNaive(nums, size);
    printf("После сортировки подсчётом (без поддержки объектов) nums = ");
    printArray(nums, size);

    int nums1[] = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    int size1 = sizeof(nums1) / sizeof(int);
    countingSort(nums1, size1);
    printf("После сортировки подсчётом nums1 = ");
    printArray(nums1, size1);

    return 0;
}
