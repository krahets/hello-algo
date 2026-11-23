/**
 * File: array_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Стек на основе массива */
class ArrayStack {
  private:
    vector<int> stack;

  public:
    /* Получение длины стека */
    int size() {
        return stack.size();
    }

    /* Проверка, пуст ли стек */
    bool isEmpty() {
        return stack.size() == 0;
    }

    /* Поместить в стек */
    void push(int num) {
        stack.push_back(num);
    }

    /* Извлечь из стека */
    int pop() {
        int num = top();
        stack.pop_back();
        return num;
    }

    /* Доступ к верхнему элементу стека */
    int top() {
        if (isEmpty())
            throw out_of_range("стек пуст");
        return stack.back();
    }

    /* Вернуть Vector */
    vector<int> toVector() {
        return stack;
    }
};

/* Driver Code */
int main() {
    /* Инициализация стека */
    ArrayStack *stack = new ArrayStack();

    /* Помещение элемента в стек */
    stack->push(1);
    stack->push(3);
    stack->push(2);
    stack->push(5);
    stack->push(4);
    cout << "Стек stack = ";
    printVector(stack->toVector());

    /* Доступ к верхнему элементу стека */
    int top = stack->top();
    cout << "Верхний элемент top = " << top << endl;

    /* Извлечение элемента из стека */
    top = stack->pop();
    cout << "Извлеченный элемент pop = " << top << ", stack после извлечения = ";
    printVector(stack->toVector());

    /* Получение длины стека */
    int size = stack->size();
    cout << "Длина стека size = " << size << endl;

    /* Проверка на пустоту */
    bool empty = stack->isEmpty();
    cout << "Пуст ли стек = " << empty << endl;

    // Освободить память
    delete stack;

    return 0;
}
