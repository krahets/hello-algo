/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Инициализация стека */
    stack<int> stack;

    /* Помещение элемента в стек */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    cout << "Стек stack = ";
    printStack(stack);

    /* Доступ к верхнему элементу стека */
    int top = stack.top();
    cout << "Верхний элемент top = " << top << endl;

    /* Извлечение элемента из стека */
    stack.pop(); // Без возвращаемого значения
    cout << "Извлеченный элемент pop = " << top << ", stack после извлечения = ";
    printStack(stack);

    /* Получение длины стека */
    int size = stack.size();
    cout << "Длина стека size = " << size << endl;

    /* Проверка на пустоту */
    bool empty = stack.empty();
    cout << "Пуст ли стек = " << empty << endl;

    return 0;
}
