/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Инициализировать двустороннюю очередь */
    deque<int> deque;

    /* Поместить элемент в очередь */
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);
    deque.push_front(1);
    cout << "Двусторонняя очередь deque = ";
    printDeque(deque);

    /* Получить доступ к элементу */
    int front = deque.front();
    cout << "голова очередиэлемент front =" << front << endl;
    int back = deque.back();
    cout << "хвост очередиэлемент back =" << back << endl;

    /* Извлечь элемент из очереди */
    deque.pop_front();
    cout << "Элемент, извлеченный из головы очереди, popFront = " << front << ", deque после извлечения из головы = ";
    printDeque(deque);
    deque.pop_back();
    cout << "Элемент, извлеченный из хвоста очереди, popLast = " << back << ", deque после извлечения из хвоста = ";
    printDeque(deque);

    /* Получить длину двусторонней очереди */
    int size = deque.size();
    cout << "Длина двусторонней очереди size = " << size << endl;

    /* Проверить, пуста ли двусторонняя очередь */
    bool empty = deque.empty();
    cout << "Двусторонняя очередь пуста: " << empty << endl;

    return 0;
}
