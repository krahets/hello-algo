/**
 * File: array.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Случайный доступ к элементу */
int randomAccess(int *nums, int size) {
    // Случайный выбор числа из диапазона [0, size)
    int randomIndex = rand() % size;
    // Получить и вернуть случайный элемент
    int randomNum = nums[randomIndex];
    return randomNum;
}

/* Увеличение длины массива */
int *extend(int *nums, int size, int enlarge) {
    // Инициализировать массив увеличенной длины
    int *res = new int[size + enlarge]{};
    // Скопировать все элементы исходного массива в новый массив
    for (int i = 0; i < size; i++) {
        res[i] = nums[i];
    }
    // Освободить память
    delete[] nums;
    // Вернуть новый массив после расширения
    return res;
}

/* Вставка элемента num в массив по индексу index */
void insert(int *nums, int size, int num, int index) {
    // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию вправо
    for (int i = size - 1; i > index; i--) {
        nums[i] = nums[i - 1];
    }
    // Присвоить num элементу по индексу index
    nums[index] = num;
}

/* Удаление элемента по индексу index */
void remove(int *nums, int size, int index) {
    // Сдвинуть все элементы после индекса index на одну позицию влево
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

/* Поиск заданного элемента в массиве */
int find(int *nums, int size, int target) {
    for (int i = 0; i < size; i++) {
        if (nums[i] == target)
            return i;
    }
    return -1;
}

/* Driver Code */
int main() {
    // [region]{init_array}
    /* Инициализация массива */
    // Хранится в стеке
    int arr[5] = {};
    int nums[5] = {1, 3, 2, 5, 4};
    // Хранится в куче (требуется ручное освобождение памяти)
    int *arr1 = new int[5]{};
    int *nums1 = new int[5]{1, 3, 2, 5, 4};
    // [endregion]{init_array}
    int size = 5;
    cout << "Массив arr = ";
    printArray(arr, size);
    cout << "Массив nums = ";
    printArray(nums, size);
    cout << "Массив arr1 = ";
    printArray(arr1, size);
    cout << "Массив nums1 = ";
    printArray(nums1, size);

    /* Случайный доступ */
    int randomNum = randomAccess(nums, size);
    cout << "Случайный элемент из nums = " << randomNum << endl;

    /* Расширение длины */
    int enlarge = 3;
    nums1 = extend(nums1, size, enlarge);
    size += enlarge;
    cout << "После увеличения длины массива до 8 nums = ";
    printArray(nums1, size);

    /* Вставка элемента */
    insert(nums1, size, 6, 3);
    cout << "После вставки числа 6 по индексу 3 nums = ";
    printArray(nums1, size);

    /* Удаление элемента */
    remove(nums1, size, 2);
    cout << "После удаления элемента по индексу 2 nums = ";
    printArray(nums1, size);

    /* Обход массива */
    traverse(nums1, size);

    /* Поиск элемента */
    int index = find(nums1, size, 3);
    cout << "Индекс элемента 3 в nums = " << index << endl;

    // Освободить память
    delete[] arr1;
    delete[] nums1;

    return 0;
}
