/**
 * File: array.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

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
    int *res = new int[size + enlarge];
    // Скопировать все элементы исходного массива в новый массив
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // Освободить память
    delete[] nums;
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
void remove(int *nums, int size, int index) {
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
    int *arr = new int[size];
    cout << "Массив arr = ";
    printArray(arr, size);

    int *nums = new int[size]{1, 3, 2, 5, 4};
    cout << "Массив nums = ";
    printArray(nums, size);

    /* Случайный доступ */
    int randomNum = randomAccess(nums, size);
    cout << "Случайный элемент из nums = " << randomNum << endl;

    /* Расширение длины */
    int enlarge = 3;
    nums = extend(nums, size, enlarge);
    size += enlarge;
    cout << "После увеличения длины массива до 8 nums = ";
    printArray(nums, size);

    /* Вставка элемента */
    insert(nums, size, 6, 3);
    cout << "После вставки числа 6 по индексу 3 nums = ";
    printArray(nums, size);

    /* Удаление элемента */
    remove(nums, size, 2);
    cout << "После удаления элемента по индексу 2 nums = ";
    printArray(nums, size);

    /* Обход массива */
    traverse(nums, size);

    /* Поиск элемента */
    int index = find(nums, size, 3);
    cout << "Индекс элемента 3 в nums = " << index << endl;

    // Освободить память
    delete[] arr;
    delete[] nums;

    return 0;
}
