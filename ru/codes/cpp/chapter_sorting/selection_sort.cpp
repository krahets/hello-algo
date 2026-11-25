/**
 * File: selection_sort.cpp
 * Created Time: 2023-05-23
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Сортировка выбором */
void selectionSort(vector<int> &nums) {
    int n = nums.size();
    // Внешний цикл: неотсортированный участок [i, n-1]
    for (int i = 0; i < n - 1; i++) {
        // Внутренний цикл: найти минимум неотсортированного участка
        int k = i;
        for (int j = i + 1; j < n; j++) {
            if (nums[j] < nums[k])
                k = j; // Запомнить индекс минимума
        }
        // Поменять минимум местами с первым элементом неотсортированного участка
        swap(nums[i], nums[k]);
    }
}

/* Тестовый пример */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    selectionSort(nums);

    cout << "После сортировки выбором nums = ";
    printVector(nums);

    return 0;
}
