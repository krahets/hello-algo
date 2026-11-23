/**
 * File: top_k.cpp
 * Created Time: 2023-06-12
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Найти k наибольших элементов массива с помощью кучи */
priority_queue<int, vector<int>, greater<int>> topKHeap(vector<int> &nums, int k) {
    // Инициализация минимальной кучи
    priority_queue<int, vector<int>, greater<int>> heap;
    // Поместить первые k элементов массива в кучу
    for (int i = 0; i < k; i++) {
        heap.push(nums[i]);
    }
    // Начиная с элемента k+1, поддерживать длину кучи равной k
    for (int i = k; i < nums.size(); i++) {
        // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
        if (nums[i] > heap.top()) {
            heap.pop();
            heap.push(nums[i]);
        }
    }
    return heap;
}

// Driver Code
int main() {
    vector<int> nums = {1, 7, 6, 3, 2};
    int k = 3;

    priority_queue<int, vector<int>, greater<int>> res = topKHeap(nums, k);
    cout << "Наибольшие " << k << " элементов: ";
    printHeap(res);

    return 0;
}
