/**
 * File: heap.cpp
 * Created Time: 2023-01-19
 * Author: LoneRanger(836253168@qq.com)
 */

#include "../utils/common.hpp"

void testPush(priority_queue<int> &heap, int val) {
    heap.push(val); // Добавить элемент в кучу
    cout << "\nПосле добавления элемента " << val << " в кучу" << endl;
    printHeap(heap);
}

void testPop(priority_queue<int> &heap) {
    int val = heap.top();
    heap.pop();
    cout << "\nПосле извлечения верхнего элемента " << val << " из кучи" << endl;
    printHeap(heap);
}

/* Driver Code */
int main() {
    /* Инициализировать кучу */
    // Инициализировать min-кучу
    // priority_queue<int, vector<int>, greater<int>> minHeap;
    // Инициализировать max-кучу
    priority_queue<int, vector<int>, less<int>> maxHeap;

    cout << "\nНиже приведены тестовые примеры max-кучи" << endl;

    /* Добавить элемент в кучу */
    testPush(maxHeap, 1);
    testPush(maxHeap, 3);
    testPush(maxHeap, 2);
    testPush(maxHeap, 5);
    testPush(maxHeap, 4);

    /* Получить верхний элемент кучи */
    int peek = maxHeap.top();
    cout << "\nЭлемент на вершине кучи равен " << peek << endl;

    /* Извлечь верхний элемент из кучи */
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);

    /* Получить размер кучи */
    int size = maxHeap.size();
    cout << "\nКоличество элементов в куче равно " << size << endl;

    /* Проверить, пуста ли куча */
    bool isEmpty = maxHeap.empty();
    cout << "\nКуча пуста:" << isEmpty << endl;

    /* Входной список и построение кучи */
    // Временная сложность равна O(n), а не O(nlogn)
    vector<int> input{1, 3, 2, 5, 4};
    priority_queue<int, vector<int>, greater<int>> minHeap(input.begin(), input.end());
    cout << "После построения min-кучи из входного списка" << endl;
    printHeap(minHeap);

    return 0;
}
