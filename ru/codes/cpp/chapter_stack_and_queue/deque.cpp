/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Инициализация двусторонней очереди */
    deque<int> deque;

    /* Добавление элемента в очередь */
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);
    deque.push_front(1);
    cout << "Двусторонняя очередь deque = ";
    printDeque(deque);

    /* Доступ к элементу */
    int front = deque.front();
    cout << "Первый элемент front = " << front << endl;
    int back = deque.back();
    cout << "Последний элемент back = " << back << endl;

    /* Извлечение элемента из очереди */
    deque.pop_front();
    cout << "Извлеченный из головы элемент popFront = " << front << ", deque после извлечения из головы = ";
    printDeque(deque);
    deque.pop_back();
    cout << "Извлеченный из хвоста элемент popLast = " << back << ", deque после извлечения из хвоста = ";
    printDeque(deque);

    /* Получение длины двусторонней очереди */
    int size = deque.size();
    cout << "Длина двусторонней очереди size = " << size << endl;

    /* Проверка, пуста ли двусторонняя очередь */
    bool empty = deque.empty();
    cout << "Пуста ли двусторонняя очередь = " << empty << endl;

    return 0;
}
