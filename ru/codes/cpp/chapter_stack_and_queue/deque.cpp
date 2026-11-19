/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    // [region]{init_deque}
    /* Инициализация двусторонней очереди */
    deque<int> deque;
    // [endregion]{init_deque}

    // [region]{push}
    /* Добавление элемента в очередь */
    deque.push_back(2); // Добавить в хвост
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3); // Добавить в голову
    deque.push_front(1);
    // [endregion]{push}
    cout << "Двусторонняя очередь deque = ";
    printDeque(deque);

    // [region]{peek_first}
    /* Доступ к элементу */
    int front = deque.front(); // Элемент в голове
    // [endregion]{peek_first}
    cout << "Первый элемент front = " << front << endl;
    // [region]{peek_last}
    int back = deque.back(); // Элемент в хвосте
    // [endregion]{peek_last}
    cout << "Последний элемент back = " << back << endl;

    // [region]{pop_first}
    /* Извлечение элемента из очереди */
    deque.pop_front(); // Извлечь элемент из головы
    // [endregion]{pop_first}
    cout << "Извлеченный из головы элемент popFront = " << front << ", deque после извлечения из головы = ";
    printDeque(deque);
    // [region]{pop_last}
    deque.pop_back(); // Извлечь элемент из хвоста
    // [endregion]{pop_last}
    cout << "Извлеченный из хвоста элемент popLast = " << back << ", deque после извлечения из хвоста = ";
    printDeque(deque);

    // [region]{size}
    /* Получение длины двусторонней очереди */
    int size = deque.size();
    // [endregion]{size}
    cout << "Длина двусторонней очереди size = " << size << endl;

    // [region]{is_empty}
    /* Проверка, пуста ли двусторонняя очередь */
    bool empty = deque.empty();
    // [endregion]{is_empty}
    cout << "Пуста ли двусторонняя очередь = " << empty << endl;

    return 0;
}
