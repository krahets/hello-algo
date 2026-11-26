/**
 * File: heap.cpp
 * Created Time: 2023-01-19
 * Author: LoneRanger(836253168@qq.com)
 */

#include "../utils/common.hpp"

void testPush(priority_queue<int> &heap, int val) {
    heap.push(val); // Вставить элемент в кучу
    cout << "\nЭлемент " << val << " добавлен в кучу:" << endl;
    printHeap(heap);
}

void testPop(priority_queue<int> &heap) {
    int val = heap.top();
    heap.pop();
    cout << "\nЭлемент " << val << " извлечён из корня:" << endl;
    printHeap(heap);
}

/* Пример использования */
int main() {
    /* Инициализировать кучу */
    // Инициализировать мин-кучу
    // priority_queue<int, vector<int>, greater<int>> minHeap;
    // Инициализировать макс-кучу
    priority_queue<int, vector<int>, less<int>> maxHeap;

    cout << "\nВ этом примере используется макс-куча" << endl;

    /* Вставить элемент в кучу */
    testPush(maxHeap, 1);
    testPush(maxHeap, 3);
    testPush(maxHeap, 2);
    testPush(maxHeap, 5);
    testPush(maxHeap, 4);

    /* Получить элемент в корне */
    int peek = maxHeap.top();
    cout << "\nЭлемент в корне: " << peek << endl;

    /* Извлечь элемент из корня */
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);

    /* Размер кучи */
    int size = maxHeap.size();
    cout << "\nЧисло элементов в куче: " << size << endl;

    /* Проверить, пуста ли куча */
    bool isEmpty = maxHeap.empty();
    cout << "\nПуста ли куча: " << isEmpty << endl;

    /* Построить кучу по входному списку */
    // Временная сложность — O(n), а не O(nlogn)
    vector<int> input{1, 3, 2, 5, 4};
    priority_queue<int, vector<int>, greater<int>> minHeap(input.begin(), input.end());
    cout << "Мин-куча, построенная по входному списку:" << endl;
    printHeap(minHeap);

    return 0;
}
