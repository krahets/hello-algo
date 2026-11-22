/**
 * File: heap.cpp
 * Created Time: 2023-01-19
 * Author: LoneRanger(836253168@qq.com)
 */

#include "../utils/common.hpp"

void testPush(priority_queue<int> &heap, int val) {
    heap.push(val); // Добавление элемента в кучу
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
    /* Инициализация кучи */
    // Инициализировать минимальную кучу
    // priority_queue<int, vector<int>, greater<int>> minHeap;
    // Инициализировать максимальную кучу
    priority_queue<int, vector<int>, less<int>> maxHeap;

    cout << "\nНиже приведены тестовые примеры для max-heap" << endl;

    /* Добавление элемента в кучу */
    testPush(maxHeap, 1);
    testPush(maxHeap, 3);
    testPush(maxHeap, 2);
    testPush(maxHeap, 5);
    testPush(maxHeap, 4);

    /* Получение элемента с вершины кучи */
    int peek = maxHeap.top();
    cout << "\nВерхний элемент кучи = " << peek << endl;

    /* Извлечение элемента с вершины кучи */
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);

    /* Получение размера кучи */
    int size = maxHeap.size();
    cout << "\nКоличество элементов в куче = " << size << endl;

    /* Проверка, пуста ли куча */
    bool isEmpty = maxHeap.empty();
    cout << "\nПуста ли куча: " << isEmpty << endl;

    /* Построить кучу по входному списку */
    // Временная сложность равна O(n), а не O(nlogn)
    vector<int> input{1, 3, 2, 5, 4};
    priority_queue<int, vector<int>, greater<int>> minHeap(input.begin(), input.end());
    cout << "После построения min-heap из входного списка" << endl;
    printHeap(minHeap);

    return 0;
}
