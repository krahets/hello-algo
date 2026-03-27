/**
 * File: array.c
 * Created Time: 2022-12-20
 * Author: MolDuM (moldum@163.com)
 */

#include "../utils/common.h"

/* Случайный доступ к элементу */
int randomAccess(int *nums, int size) {
    // Случайным образом выбрать число из интервала [0, size)
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
    // Вернуть новый массив после расширения
    return res;
}

/* Вставить элемент num по индексу index в массив */
void insert(int *nums, int size, int num, int index) {
    // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // Присвоить num элементу по индексу index
    nums[index] = num;
}

/* Удалить элемент по индексу index */
// Внимание: stdio.h уже использует ключевое слово remove
void removeItem(int *nums, int size, int index) {
    // Сдвинуть все элементы после индекса index на одну позицию вперед
    for (int i = index; i < size - 1; i++) {
        nums[i] = nums[i + 1];
    }
}

/* Обход массива */
void traverse(int *nums, int size) {
    int count = 0;
    // Обход массива по индексам
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
    /* Инициализация массива */
    int size = 5;
    int arr[5];
    printf("Массив arr = ");
    printArray(arr, size);

    int nums[] = {1, 3, 2, 5, 4};
    printf("Массив nums = ");
    printArray(nums, size);

    /* Случайный доступ */
    int randomNum = randomAccess(nums, size);
    printf("Случайный элемент из nums = %d", randomNum);

    /* Расширение длины */
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
