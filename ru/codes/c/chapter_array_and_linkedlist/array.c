/**
 * File: array.c
 * Created Time: 2022-12-20
 * Author: MolDuM (moldum@163.com)
 */

#include "../utils/common.h"

/* Случайный доступ к элементу */
int randomAccess(int *nums, int size) {
    // Случайно выбрать число в интервале [0, size)
    int randomIndex = rand() % size;
    // Получить и вернуть случайный элемент
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* Увеличить длину массива */
int *extend(int *nums, int size, int enlarge) {
    // Инициализировать массив увеличенной длины
    int *res = (int *)malloc(sizeof(int) * (size + enlarge));
    // Скопировать все элементы исходного массива в новый массив
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // Инициализировать расширенное пространство
    for (int i = size; i < size + enlarge; i++) {
        res[i] = 0;
    }
    // Вернуть новый расширенный массив
    return res;
}

/* Вставить элемент num в массив по индексу index */
void insert(int *nums, int size, int num, int index) {
    // Сдвинуть индекс index и все последующие элементы на одну позицию назад
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // Присвоить num элементу по индексу index
    nums[index] = num;
}

/* Удалить элемент по индексу index */
// Обратите внимание: stdio.h уже использует ключевое слово remove
void removeItem(int *nums, int size, int index) {
    // Сдвинуть все элементы после индекса index на одну позицию вперед
    for (int i = index; i < size - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* Перебрать массив */
void traverse(int *nums, int size) {
    int count = 0;
    // Обходить массив по индексам
    for (int i = 0; i < size; i++) {
        count += nums[i];
    }
}

/* Найти заданный элемент в массиве */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* Driver Code */
int main() {
    /* Инициализировать массив */
    int size = 5;
    int arr[5];
    printf("Массив arr = ");
    printArray(arr, size);

    int nums[] = {1, 3, 2, 5, 4};
    printf("Массив nums = ");
    printArray(nums, size);

    /* Случайный доступ */
    int randomNum = randomAccess(nums, size);
    printf("Полученный случайный элемент из nums: %d", randomNum);

    /* Расширение длины */
    int enlarge = 3;
    int *res = extend(nums, size, enlarge);
    size += enlarge;
    printf("После расширения длины массива до 8 получаем nums = ");
    printArray(res, size);

    /* Вставить элемент */
    insert(res, size, 6, 3);
    printf("После вставки числа 6 в индекс 3 получаем nums = ");
    printArray(res, size);

    /* Удалить элемент */
    removeItem(res, size, 2);
    printf("После удаления элемента по индексу 2 получаем nums = ");
    printArray(res, size);

    /* Перебрать массив */
    traverse(res, size);

    /* Найти элемент */
    int index = find(res, size, 3);
    printf("Поиск элемента 3 в res дает индекс = %d\n", index);

    /* Освободить память */
    free(res);
    return 0;
}
