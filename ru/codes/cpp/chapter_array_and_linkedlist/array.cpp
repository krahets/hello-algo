/**
 * File: array.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

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
    int *res = new int[size + enlarge]{};
    // Скопировать все элементы исходного массива в новый
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // Освободить память
    delete[] nums;
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
void remove(int *nums, int size, int index) {
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
    /* Инициализация массива */
    int size = 5;
    int *arr = new int[size]{};
    cout << "Массив arr = ";
    printArray(arr, size);

    int *nums = new int[size]{1, 3, 2, 5, 4};
    cout << "Массив nums = ";
    printArray(nums, size);

    /* Чтение случайного элемента */
    int randomNum = randomAccess(nums, size);
    cout << "Случайный элемент nums: " << randomNum << endl;

    /* Увеличение длины */
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
