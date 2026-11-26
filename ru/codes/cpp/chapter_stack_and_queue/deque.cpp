/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Пример использования */
int main() {
    /* Инициализировать дек */
    deque<int> deque;

    /* Добавить элементы в дек */
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);
    deque.push_front(1);
    cout << "Дек deque = ";
    printDeque(deque);

    /* Посмотреть первый и последний элементы */
    int front = deque.front();
    cout << "Первый элемент дека front = " << front << endl;
    int back = deque.back();
    cout << "Последний элемент дека back = " << back << endl;

    /* Извлечь элементы из дека */
    deque.pop_front();
    cout << "Извлечённый первый элемент popFront = " << front << ", после извлечения из начала deque = ";
    printDeque(deque);
    deque.pop_back();
    cout << "Извлечённый последний элемент popLast = " << back << ", после извлечения из конца deque = ";
    printDeque(deque);

    /* Получить длину дека */
    int size = deque.size();
    cout << "Длина дека size = " << size << endl;

    /* Проверить, пуст ли дек */
    bool empty = deque.empty();
    cout << "Дек пуст = " << empty << endl;

    return 0;
}
