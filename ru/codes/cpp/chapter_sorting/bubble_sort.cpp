/**
 * File: bubble_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Сортировка пузырьком */
void bubbleSort(vector<int> &nums) {
    // Внешний цикл: неотсортированный участок [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        // Внутренний цикл: обменами переместить максимум участка [0, i] на его правый конец
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Поменять местами nums[j] и nums[j + 1]
                // Здесь используется функция std::swap()
                swap(nums[j], nums[j + 1]);
            }
        }
    }
}

/* Сортировка пузырьком с флагом обмена*/
void bubbleSortWithFlag(vector<int> &nums) {
    // Внешний цикл: неотсортированный участок [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        bool flag = false; // Инициализировать флаг
        // Внутренний цикл: обменами переместить максимум участка [0, i] на его правый конец
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Поменять местами nums[j] и nums[j + 1]
                // Здесь используется функция std::swap()
                swap(nums[j], nums[j + 1]);
                flag = true; // Отметить, что произошёл обмен
            }
        }
        if (!flag)
            break; // За этот проход обменов не было. Выйти из цикла
    }
}

/* Тестовый пример */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    bubbleSort(nums);
    cout << "После сортировки пузырьком nums = ";
    printVector(nums);

    vector<int> nums1 = {4, 1, 3, 1, 5, 2};
    bubbleSortWithFlag(nums1);
    cout << "После сортировки пузырьком nums1 = ";
    printVector(nums1);

    return 0;
}
