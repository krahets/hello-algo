/**
 * File: heap_sort.cpp
 * Created Time: 2023-05-26
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Если длина кучи равна n, начиная с узла i выполнить просеивание сверху вниз */
void siftDown(vector<int> &nums, int n, int i) {
    while (true) {
        // Определить узел с максимальным значением среди i, l и r и обозначить его как ma
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma])
            ma = l;
        if (r < n && nums[r] > nums[ma])
            ma = r;
        // Если узел i уже максимален или индексы l и r выходят за границы, дальнейшая heapify не требуется
        if (ma == i) {
            break;
        }
        // Поменять местами два узла
        swap(nums[i], nums[ma]);
        // Циклически выполнять просеивание вниз
        i = ma;
    }
}

/* Сортировка кучей */
void heapSort(vector<int> &nums) {
    // Построение кучи: выполнить просеивание для всех узлов, кроме листьев
    for (int i = nums.size() / 2 - 1; i >= 0; --i) {
        siftDown(nums, nums.size(), i);
    }
    // Извлекать максимальный элемент из кучи в течение n-1 итераций
    for (int i = nums.size() - 1; i > 0; --i) {
        // Поменять местами корневой узел и крайний правый лист (первый и последний элементы)
        swap(nums[0], nums[i]);
        // Начиная с корневого узла, выполнить просеивание сверху вниз
        siftDown(nums, i, 0);
    }
}

/* Driver Code */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    heapSort(nums);
    cout << "После завершения сортировки кучей nums = ";
    printVector(nums);

    return 0;
}
