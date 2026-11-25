/**
 * File: top_k.cpp
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Найти k наибольших элементов массива с помощью кучи */
priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
    // Инициализировать мин-кучу
    priority_queue<int, vector<int>, greater<int>> heap;
    // Добавить в кучу первые k элементов массива
    for (int i = 0; i < k; i++) {
        heap.push(nums[i]);
    }
    // Начиная с (k+1)-го элемента, поддерживать размер кучи равным k
    for (int i = k; i < nums.size(); i++) {
        // Если текущий элемент больше корня, извлечь корень и вставить текущий элемент
        if (nums[i] > heap.top()) {
            heap.pop();
            heap.push(nums[i]);
        }
    }
    return heap;
}

// Пример использования
int main() {
    vector<int> nums = {1, 7, 6, 3, 2};
    int k = 3;

    priority_queue<int, vector<int>, greater<int>> res = topKHeap(nums, k);
    cout << "При k = " << k << " наибольшие элементы: ";
    printHeap(res);

    return 0;
}
