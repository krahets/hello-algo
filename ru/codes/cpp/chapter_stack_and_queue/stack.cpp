/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    // [region]{init_stack}
    /* Инициализация стека */
    stack<int> stack;
    // [endregion]{init_stack}

    // [region]{push}
    /* Помещение элемента в стек */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    // [endregion]{push}
    cout << "Стек stack = ";
    printStack(stack);

    // [region]{peek}
    /* Доступ к верхнему элементу стека */
    int top = stack.top();
    // [endregion]{peek}
    cout << "Верхний элемент top = " << top << endl;

    // [region]{pop}
    /* Извлечение элемента из стека */
    stack.pop(); // Без возвращаемого значения
    // [endregion]{pop}
    cout << "Извлеченный элемент pop = " << top << ", stack после извлечения = ";
    printStack(stack);

    // [region]{size}
    /* Получение длины стека */
    int size = stack.size();
    // [endregion]{size}
    cout << "Длина стека size = " << size << endl;

    // [region]{is_empty}
    /* Проверка на пустоту */
    bool empty = stack.empty();
    // [endregion]{is_empty}
    cout << "Пуст ли стек = " << empty << endl;

    return 0;
}
