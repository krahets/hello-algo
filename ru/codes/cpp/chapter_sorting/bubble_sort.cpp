/**
 * File: bubble_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Пузырьковая сортировка */
void bubbleSort(vector<int> &nums) {
    // Внешний цикл: неотсортированный диапазон [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Поменять местами nums[j] и nums[j + 1]
                // Здесь используется функция std::swap()
                swap(nums[j], nums[j + 1]);
            }
        }
    }
}

/* Пузырьковая сортировка (оптимизация флагом) */
void bubbleSortWithFlag(vector<int> &nums) {
    // Внешний цикл: неотсортированный диапазон [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        bool flag = false; // Инициализировать флаг
        // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Поменять местами nums[j] и nums[j + 1]
                // Здесь используется функция std::swap()
                swap(nums[j], nums[j + 1]);
                flag = true; // Записать обмен элементов
            }
        }
        if (!flag)
            break; // На этой итерации «всплытия» не было ни одного обмена, сразу выйти
    }
}

/* Driver Code */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    bubbleSort(nums);
    cout << "После пузырьковой сортировки nums = ";
    printVector(nums);

    vector<int> nums1 = {4, 1, 3, 1, 5, 2};
    bubbleSortWithFlag(nums1);
    cout << "После пузырьковой сортировки nums1 = ";
    printVector(nums1);

    return 0;
}
