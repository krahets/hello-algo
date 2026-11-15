/**
 * File: heap.cpp
 * Created Time: 2023-01-19
 * Author: LoneRanger(836253168@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    // [region]{init}
    /* Инициализация кучи */
    // Инициализировать минимальную кучу
    priority_queue<int, vector<int>, greater<int>> minHeap;
    // Инициализировать максимальную кучу
    priority_queue<int, vector<int>, less<int>> maxHeap;
    // [endregion]{init}

    cout << "\nНиже приведены тестовые примеры для max-heap" << endl;

    // [region]{push}
    /* Добавление элемента в кучу */
    maxHeap.push(1);
    maxHeap.push(3);
    maxHeap.push(2);
    maxHeap.push(5);
    maxHeap.push(4);
    // [endregion]{push}
    printHeap(maxHeap);

    // [region]{peek}
    /* Получение элемента с вершины кучи */
    int peek = maxHeap.top(); // 5
    // [endregion]{peek}
    cout << "\nВерхний элемент кучи = " << peek << endl;

    // [region]{pop_1}
    /* Извлечение элемента с вершины кучи */
    // Извлеченные элементы образуют последовательность по убыванию
    maxHeap.pop(); // 5
    // [endregion]{pop_1}
    printHeap(maxHeap);
    // [region]{pop_2}
    maxHeap.pop(); // 4
    // [endregion]{pop_2}
    printHeap(maxHeap);
    // [region]{pop_3}
    maxHeap.pop(); // 3
    // [endregion]{pop_3}
    printHeap(maxHeap);
    // [region]{pop_4}
    maxHeap.pop(); // 2
    // [endregion]{pop_4}
    printHeap(maxHeap);
    // [region]{pop_5}
    maxHeap.pop(); // 1
    // [endregion]{pop_5}
    printHeap(maxHeap);

    // [region]{size}
    /* Получение размера кучи */
    int size = maxHeap.size();
    // [endregion]{size}
    cout << "\nКоличество элементов в куче = " << size << endl;

    // [region]{is_empty}
    /* Проверка, пуста ли куча */
    bool isEmpty = maxHeap.empty();
    // [endregion]{is_empty}
    cout << "\nПуста ли куча: " << isEmpty << endl;

    // [region]{heapify}
    /* Построить кучу по входному списку */
    // Временная сложность равна O(n), а не O(nlogn)
    vector<int> input{1, 3, 2, 5, 4};
    minHeap = priority_queue<int, vector<int>, greater<int>>(input.begin(), input.end());
    // [endregion]{heapify}
    cout << "После построения min-heap из входного списка" << endl;
    printHeap(minHeap);

    return 0;
}
