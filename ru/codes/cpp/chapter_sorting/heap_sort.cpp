/**
 * File: heap_sort.cpp
 * Created Time: 2023-05-26
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Размер кучи равен n. Выполнить просеивание вниз от узла i */
void siftDown(vector<int> &nums, int n, int i) {
    while (true) {
        // Найти среди i, l, r узел с наибольшим значением и обозначить его ma
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma])
            ma = l;
        if (r < n && nums[r] > nums[ma])
            ma = r;
        // Если максимум уже в i или индексы l и r вне кучи, завершить просеивание
        if (ma == i) {
            break;
        }
        // Поменять два узла местами
        swap(nums[i], nums[ma]);
        // Продолжить просеивание вниз
        i = ma;
    }
}

/* Пирамидальная сортировка */
void heapSort(vector<int> &nums) {
    // Построить кучу: выполнить просеивание для всех узлов, кроме листьев
    for (int i = nums.size() / 2 - 1; i >= 0; --i) {
        siftDown(nums, nums.size(), i);
    }
    // Извлечь максимум из кучи n-1 раз
    for (int i = nums.size() - 1; i > 0; --i) {
        // Обменять корень с крайним правым листом (первый элемент с последним)
        swap(nums[0], nums[i]);
        // Выполнить просеивание вниз от корня
        siftDown(nums, i, 0);
    }
}

/* Тестовый пример */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    heapSort(nums);
    cout << "После пирамидальной сортировки nums = ";
    printVector(nums);

    return 0;
}
