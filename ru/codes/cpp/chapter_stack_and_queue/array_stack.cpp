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
    /* Получить размер стека */
    int size() {
        return stack.size();
    }

    /* Проверить, пуст ли стек */
    bool isEmpty() {
        return stack.size() == 0;
    }

    /* Поместить элемент в стек */
    void push(int num) {
        stack.push_back(num);
    }

    /* Снять элемент со стека */
    int pop() {
        int num = top();
        stack.pop_back();
        return num;
    }

    /* Посмотреть элемент на вершине стека */
    int top() {
        if (isEmpty())
            throw out_of_range("Стек пуст");
        return stack.back();
    }

    /* Вернуть вектор */
    vector<int> toVector() {
        return stack;
    }
};

/* Пример использования */
int main() {
    /* Инициализировать стек */
    ArrayStack *stack = new ArrayStack();

    /* Поместить элементы в стек */
    stack->push(1);
    stack->push(3);
    stack->push(2);
    stack->push(5);
    stack->push(4);
    cout << "Стек stack = ";
    printVector(stack->toVector());

    /* Посмотреть элемент на вершине стека */
    int top = stack->top();
    cout << "Элемент на вершине стека top = " << top << endl;

    /* Снять элемент со стека */
    top = stack->pop();
    cout << "Снятый элемент pop = " << top << ", после снятия stack = ";
    printVector(stack->toVector());

    /* Получить размер стека */
    int size = stack->size();
    cout << "Размер стека size = " << size << endl;

    /* Проверить, пуст ли стек */
    bool empty = stack->isEmpty();
    cout << "Стек пуст = " << empty << endl;

    // Освободить память
    delete stack;

    return 0;
}
