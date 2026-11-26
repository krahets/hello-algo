/**
 * File: binary_search_insertion.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Двоичный поиск позиции вставки без повторов */
int binarySearchInsertionSimple(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // Задаём замкнутый интервал [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Вычисляем индекс середины m
        if (nums[m] < target) {
            i = m + 1; // Ищем target в интервале [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // Ищем target в интервале [i, m-1]
        } else {
            return m; // Значение target найдено, возвращаем позицию вставки m
        }
    }
    // Значение target не найдено, возвращаем позицию вставки i
    return i;
}

/* Двоичный поиск позиции вставки при наличии повторов */
int binarySearchInsertion(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // Задаём замкнутый интервал [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Вычисляем индекс середины m
        if (nums[m] < target) {
            i = m + 1; // Ищем target в интервале [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // Ищем target в интервале [i, m-1]
        } else {
            j = m - 1; // В интервале [i, m-1] ищем последний элемент, меньший target
        }
    }
    // Возвращаем позицию вставки i
    return i;
}

/* Пример использования */
int main() {
    // Массив без повторяющихся элементов
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    cout << "\nМассив nums = ";
    printVector(nums);
    // Двоичный поиск позиции вставки
    for (int target : {6, 9}) {
        int index = binarySearchInsertionSimple(nums, target);
        cout << "Позиция вставки элемента " << target << " равна " << index << endl;
    }

    // Массив с повторяющимися элементами
    nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\nМассив nums = ";
    printVector(nums);
    // Двоичный поиск позиции вставки
    for (int target : {2, 6, 20}) {
        int index = binarySearchInsertion(nums, target);
        cout << "Позиция вставки элемента " << target << " равна " << index << endl;
    }

    return 0;
}
