/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Пример использования */
int main() {
    /* Инициализировать очередь */
    queue<int> queue;

    /* Добавить элементы в очередь */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    cout << "Очередь queue = ";
    printQueue(queue);

    /* Посмотреть первый элемент очереди */
    int front = queue.front();
    cout << "Первый элемент очереди front = " << front << endl;

    /* Извлечь элемент из очереди */
    queue.pop();
    cout << "Извлечённый элемент front = " << front << ", после извлечения queue = ";
    printQueue(queue);

    /* Получить длину очереди */
    int size = queue.size();
    cout << "Длина очереди size = " << size << endl;

    /* Проверить, пуста ли очередь */
    bool empty = queue.empty();
    cout << "Очередь пуста = " << empty << endl;

    return 0;
}
