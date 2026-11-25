/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Пример использования */
int main() {
    /* Инициализировать стек */
    stack<int> stack;

    /* Поместить элементы в стек */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    cout << "Стек stack = ";
    printStack(stack);

    /* Посмотреть элемент на вершине стека */
    int top = stack.top();
    cout << "Элемент на вершине стека top = " << top << endl;

    /* Снять элемент со стека */
    stack.pop(); // Метод не возвращает значения
    cout << "Снятый элемент pop = " << top << ", после снятия stack = ";
    printStack(stack);

    /* Получить размер стека */
    int size = stack.size();
    cout << "Размер стека size = " << size << endl;

    /* Проверить, пуст ли стек */
    bool empty = stack.empty();
    cout << "Стек пуст = " << empty << endl;

    return 0;
}
