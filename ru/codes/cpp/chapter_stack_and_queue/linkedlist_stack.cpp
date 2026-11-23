/**
 * File: linkedlist_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Стек на основе связного списка */
class LinkedListStack {
  private:
    ListNode *stackTop; // Использовать головной узел как вершину стека
    int stkSize;        // Длина стека

  public:
    LinkedListStack() {
        stackTop = nullptr;
        stkSize = 0;
    }

    ~LinkedListStack() {
        // Обходить связный список, удалять узлы и освобождать память
        freeMemoryLinkedList(stackTop);
    }

    /* Получение длины стека */
    int size() {
        return stkSize;
    }

    /* Проверка, пуст ли стек */
    bool isEmpty() {
        return size() == 0;
    }

    /* Поместить в стек */
    void push(int num) {
        ListNode *node = new ListNode(num);
        node->next = stackTop;
        stackTop = node;
        stkSize++;
    }

    /* Извлечь из стека */
    int pop() {
        int num = top();
        ListNode *tmp = stackTop;
        stackTop = stackTop->next;
        // Освободить память
        delete tmp;
        stkSize--;
        return num;
    }

    /* Доступ к верхнему элементу стека */
    int top() {
        if (isEmpty())
            throw out_of_range("стек пуст");
        return stackTop->val;
    }

    /* Преобразовать List в Array и вернуть */
    vector<int> toVector() {
        ListNode *node = stackTop;
        vector<int> res(size());
        for (int i = res.size() - 1; i >= 0; i--) {
            res[i] = node->val;
            node = node->next;
        }
        return res;
    }
};

/* Driver Code */
int main() {
    /* Инициализация стека */
    LinkedListStack *stack = new LinkedListStack();

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
