/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    // [region]{init_queue}
    /* Инициализация очереди */
    queue<int> queue;
    // [endregion]{init_queue}

    // [region]{push}
    /* Добавление элемента в очередь */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    // [endregion]{push}
    cout << "Очередь queue = ";
    printQueue(queue);

    // [region]{peek}
    /* Доступ к элементу в начале очереди */
    int front = queue.front();
    // [endregion]{peek}
    cout << "Первый элемент front = " << front << endl;

    // [region]{pop}
    /* Извлечение элемента из очереди */
    queue.pop();
    // [endregion]{pop}
    cout << "Извлеченный элемент front = " << front << ", queue после извлечения = ";
    printQueue(queue);

    // [region]{size}
    /* Получение длины очереди */
    int size = queue.size();
    // [endregion]{size}
    cout << "Длина очереди size = " << size << endl;

    // [region]{is_empty}
    /* Проверка, пуста ли очередь */
    bool empty = queue.empty();
    // [endregion]{is_empty}
    cout << "Пуста ли очередь = " << empty << endl;

    return 0;
}
