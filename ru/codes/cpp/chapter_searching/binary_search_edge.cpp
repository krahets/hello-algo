/**
 * File: binary_search_edge.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Двоичный поиск позиции вставки при наличии повторов */
int binarySearchInsertion(const vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // Задаём замкнутый интервал [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Вычисляем индекс середины m
        if (nums[m] < target) {
            i = m + 1; // Ищем target в интервале [m+1, j]
        } else {
            j = m - 1; // В интервале [i, m-1] ищем последний элемент, меньший target
        }
    }
    // Возвращаем позицию вставки i
    return i;
}

/* Двоичный поиск первого вхождения target */
int binarySearchLeftEdge(vector<int> &nums, int target) {
    // Задача равносильна поиску позиции вставки target
    int i = binarySearchInsertion(nums, target);
    // Значение target не найдено, возвращаем -1
    if (i == nums.size() || nums[i] != target) {
        return -1;
    }
    // Значение target найдено, возвращаем индекс i
    return i;
}

/* Двоичный поиск последнего вхождения target */
int binarySearchRightEdge(vector<int> &nums, int target) {
    // Сводим задачу к поиску первого вхождения target + 1
    int i = binarySearchInsertion(nums, target + 1);
    // j указывает на последнее вхождение target, а i — на первый элемент, больший target
    int j = i - 1;
    // Значение target не найдено, возвращаем -1
    if (j == -1 || nums[j] != target) {
        return -1;
    }
    // Значение target найдено, возвращаем индекс j
    return j;
}

/* Пример использования */
int main() {
    // Массив с повторяющимися элементами
    vector<int> nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\nМассив nums = ";
    printVector(nums);

    // Двоичный поиск левой и правой границ
    for (int target : {6, 7}) {
        int index = binarySearchLeftEdge(nums, target);
        cout << "Индекс первого вхождения " << target << " равен " << index << endl;
        index = binarySearchRightEdge(nums, target);
        cout << "Индекс последнего вхождения " << target << " равен " << index << endl;
    }

    return 0;
}
