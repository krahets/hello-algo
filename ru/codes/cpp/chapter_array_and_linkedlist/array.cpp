/**
 * File: array.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

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
    int *res = new int[size + enlarge];
    // Скопировать все элементы исходного массива в новый массив
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // Освободить память
    delete[] nums;
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
void remove(int *nums, int size, int index) {
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
    int *arr = new int[size];
    cout << "Массив arr = ";
    printArray(arr, size);

    int *nums = new int[size]{1, 3, 2, 5, 4};
    cout << "Массив nums = ";
    printArray(nums, size);

    /* Случайный доступ */
    int randomNum = randomAccess(nums, size);
    cout << "Полученный случайный элемент из nums " << randomNum << endl;

    /* Расширение длины */
    int enlarge = 3;
    nums = extend(nums, size, enlarge);
    size += enlarge;
    cout << "После расширения длины массива до 8 получаем nums = ";
    printArray(nums, size);

    /* Вставить элемент */
    insert(nums, size, 6, 3);
    cout << "После вставки числа 6 по индексу 3 получаем nums = ";
    printArray(nums, size);

    /* Удалить элемент */
    remove(nums, size, 2);
    cout << "После удаления элемента по индексу 2 получаем nums = ";
    printArray(nums, size);

    /* Перебрать массив */
    traverse(nums, size);

    /* Найти элемент */
    int index = find(nums, size, 3);
    cout << "Поиск элемента 3 в nums дает индекс = " << index << endl;

    // Освободить память
    delete[] arr;
    delete[] nums;

    return 0;
}
