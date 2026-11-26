/**
 * File: binary_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Двоичный поиск на замкнутом интервале */
int binarySearch(vector<int> &nums, int target) {
    // Задаём замкнутый интервал [0, n-1]: i указывает на первый элемент, j — на последний
    int i = 0, j = nums.size() - 1;
    // Повторяем, пока интервал поиска не опустеет (i > j)
    while (i <= j) {
        int m = i + (j - i) / 2; // Вычисляем индекс середины m
        if (nums[m] < target)    // Искать target следует в интервале [m+1, j]
            i = m + 1;
        else if (nums[m] > target) // Искать target следует в интервале [i, m-1]
            j = m - 1;
        else // Элемент найден, возвращаем его индекс
            return m;
    }
    // Элемент не найден, возвращаем -1
    return -1;
}

/* Двоичный поиск на полуинтервале с открытой правой границей */
int binarySearchLCRO(vector<int> &nums, int target) {
    // Задаём полуинтервал [0, n): i указывает на первый элемент, j — на позицию за последним
    int i = 0, j = nums.size();
    // Повторяем, пока интервал поиска не опустеет (i = j)
    while (i < j) {
        int m = i + (j - i) / 2; // Вычисляем индекс середины m
        if (nums[m] < target)    // Искать target следует в интервале [m+1, j)
            i = m + 1;
        else if (nums[m] > target) // Искать target следует в интервале [i, m)
            j = m;
        else // Элемент найден, возвращаем его индекс
            return m;
    }
    // Элемент не найден, возвращаем -1
    return -1;
}

/* Пример использования */
int main() {
    int target = 6;
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};

    /* Двоичный поиск на замкнутом интервале */
    int index = binarySearch(nums, target);
    cout << "Индекс элемента 6 = " << index << endl;

    /* Двоичный поиск на полуинтервале с открытой правой границей */
    index = binarySearchLCRO(nums, target);
    cout << "Индекс элемента 6 = " << index << endl;

    return 0;
}
