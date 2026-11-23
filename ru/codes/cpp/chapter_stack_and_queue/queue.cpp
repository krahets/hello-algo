/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Инициализация очереди */
    queue<int> queue;

    /* Добавление элемента в очередь */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    cout << "Очередь queue = ";
    printQueue(queue);

    /* Доступ к элементу в начале очереди */
    int front = queue.front();
    cout << "Первый элемент front = " << front << endl;

    /* Извлечение элемента из очереди */
    queue.pop();
    cout << "Извлеченный элемент front = " << front << ", queue после извлечения = ";
    printQueue(queue);

    /* Получение длины очереди */
    int size = queue.size();
    cout << "Длина очереди size = " << size << endl;

    /* Проверка, пуста ли очередь */
    bool empty = queue.empty();
    cout << "Пуста ли очередь = " << empty << endl;

    return 0;
}
