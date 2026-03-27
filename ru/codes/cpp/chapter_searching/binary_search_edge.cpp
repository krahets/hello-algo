/**
 * File: binary_search_edge.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Бинарный поиск точки вставки (с повторяющимися элементами) */
int binarySearchInsertion(const vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Вычислить индекс середины m
        if (nums[m] < target) {
            i = m + 1; // target находится в интервале [m+1, j]
        } else {
            j = m - 1; // Первый элемент меньше target находится в интервале [i, m-1]
        }
    }
    // Вернуть точку вставки i
    return i;
}

/* Бинарный поиск самого левого target */
int binarySearchLeftEdge(vector<int> &nums, int target) {
    // Эквивалентно поиску точки вставки target
    int i = binarySearchInsertion(nums, target);
    // target не найден, вернуть -1
    if (i == nums.size() || nums[i] != target) {
        return -1;
    }
    // Найти target и вернуть индекс i
    return i;
}

/* Бинарный поиск самого правого target */
int binarySearchRightEdge(vector<int> &nums, int target) {
    // Преобразовать задачу в поиск самого левого target + 1
    int i = binarySearchInsertion(nums, target + 1);
    // j указывает на самый правый target, а i — на первый элемент больше target
    int j = i - 1;
    // target не найден, вернуть -1
    if (j == -1 || nums[j] != target) {
        return -1;
    }
    // Найти target и вернуть индекс j
    return j;
}

/* Driver Code */
int main() {
    // Массив с повторяющимися элементами
    vector<int> nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\nМассив nums = ";
    printVector(nums);

    // Бинарный поиск левой и правой границы
    for (int target : {6, 7}) {
        int index = binarySearchLeftEdge(nums, target);
        cout << "Индекс самого левого элемента " << target << " равен " << index << endl;
        index = binarySearchRightEdge(nums, target);
        cout << "Индекс самого правого элемента " << target << " равен " << index << endl;
    }

    return 0;
}
