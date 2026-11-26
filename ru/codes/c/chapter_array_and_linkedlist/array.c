/**
 * File: array.c
 * Created Time: 2022-12-20
 * Author: MolDuM (moldum@163.com)
 */

#include "../utils/common.h"

/* Чтение случайного элемента */
int randomAccess(int *nums, int size) {
    // Выбрать случайное число из интервала [0, size)
    int randomIndex = rand() % size;
    // Получить и вернуть случайный элемент
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* Увеличение длины массива */
int *extend(int *nums, int size, int enlarge) {
    // Создать массив увеличенной длины
    int *res = (int *)malloc(sizeof(int) * (size + enlarge));
    // Скопировать все элементы исходного массива в новый
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // Инициализировать добавленные ячейки
    for (int i = size; i < size + enlarge; i++) {
        res[i] = 0;
    }
    // Вернуть новый массив увеличенной длины
    return res;
}

/* Вставить num в массив по индексу index */
void insert(int *nums, int size, int num, int index) {
    // Сдвинуть на одну позицию вправо все элементы начиная с index
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // Записать num по индексу index
    nums[index] = num;
}

/* Удалить элемент по индексу index */
// Имя remove уже используется в stdio.h
void removeItem(int *nums, int size, int index) {
    // Сдвинуть все элементы после index на одну позицию влево
    for (int i = index; i < size - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* Обход массива */
void traverse(int *nums, int size) {
    int count = 0;
    // Обойти массив по индексам
    for (int i = 0; i < size; i++) {
        count += nums[i];
    }
}

/* Поиск заданного элемента в массиве */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* Демонстрационный код */
int main() {
    /* Инициализировать генератор случайных чисел (один раз) */
    srand((unsigned)time(NULL));

    /* Инициализация массива */
    int size = 5;
    int arr[5] = {0};
    printf("Массив arr = ");
    printArray(arr, size);

    int nums[] = {1, 3, 2, 5, 4};
    printf("Массив nums = ");
    printArray(nums, size);

    /* Чтение случайного элемента */
    int randomNum = randomAccess(nums, size);
    printf("Случайный элемент nums: %d ", randomNum);

    /* Увеличение длины */
    int enlarge = 3;
    int *res = extend(nums, size, enlarge);
    size += enlarge;
    printf("После увеличения длины массива до 8 nums = ");
    printArray(res, size);

    /* Вставка элемента */
    insert(res, size, 6, 3);
    printf("После вставки числа 6 по индексу 3 nums = ");
    printArray(res, size);

    /* Удаление элемента */
    removeItem(res, size, 2);
    printf("После удаления элемента по индексу 2 nums = ");
    printArray(res, size);

    /* Обход массива */
    traverse(res, size);

    /* Поиск элемента */
    int index = find(res, size, 3);
    printf("Индекс элемента 3 в res = %d\n", index);

    /* Освободить память */
    free(res);
    return 0;
}
