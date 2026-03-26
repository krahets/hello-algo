/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Инициализировать стек */
    stack<int> stack;

    /* Поместить элемент в стек */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    cout << "стек stack =";
    printStack(stack);

    /* Получить верхний элемент стека */
    int top = stack.top();
    cout << "Элемент на вершине стека top = " << top << endl;

    /* Извлечь элемент из стека */
    stack.pop(); // Без возвращаемого значения
    cout << "извлечение из стекаэлемент pop =" << top << ", извлечение из стекапосле stack =";
    printStack(stack);

    /* Получить длину стека */
    int size = stack.size();
    cout << "Длина стека size =" << size << endl;

    /* Проверить, пуста ли структура */
    bool empty = stack.empty();
    cout << "Стек пуст:" << empty << endl;

    return 0;
}
