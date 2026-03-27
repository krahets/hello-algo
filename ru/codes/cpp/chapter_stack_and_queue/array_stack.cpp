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
    /* Получить длину стека */
    int size() {
        return stack.size();
    }

    /* Проверить, пуст ли стек */
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

    /* Получить верхний элемент стека */
    int top() {
        if (isEmpty())
            throw out_of_range("Стек пуст");
        return stack.back();
    }

    /* Вернуть Vector */
    vector<int> toVector() {
        return stack;
    }
};

/* Driver Code */
int main() {
    /* Инициализировать стек */
    ArrayStack *stack = new ArrayStack();

    /* Поместить элемент в стек */
    stack->push(1);
    stack->push(3);
    stack->push(2);
    stack->push(5);
    stack->push(4);
    cout << "Стек stack = ";
    printVector(stack->toVector());

    /* Получить верхний элемент стека */
    int top = stack->top();
    cout << "Элемент на вершине стека top = " << top << endl;

    /* Извлечь элемент из стека */
    top = stack->pop();
    cout << "Элемент, извлеченный из стека, pop = " << top << ", stack после извлечения = ";
    printVector(stack->toVector());

    /* Получить длину стека */
    int size = stack->size();
    cout << "Длина стека size =" << size << endl;

    /* Проверить, пуста ли структура */
    bool empty = stack->isEmpty();
    cout << "стекпуст ли =" << empty << endl;

    // Освободить память
    delete stack;

    return 0;
}
