/**
 * File: linkedlist_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Стек на основе связного списка */
class LinkedListStack {
  private:
    ListNode *stackTop; // Считать головной узел вершиной стека
    int stkSize;        // Длина стека

  public:
    LinkedListStack() {
        stackTop = nullptr;
        stkSize = 0;
    }

    ~LinkedListStack() {
        // Обойти связный списокУдалить узел, Освободить память
        freeMemoryLinkedList(stackTop);
    }

    /* Получить длину стека */
    int size() {
        return stkSize;
    }

    /* Проверить, пуст ли стек */
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

    /* Получить верхний элемент стека */
    int top() {
        if (isEmpty())
            throw out_of_range("Стек пуст");
        return stackTop->val;
    }

    /* Преобразовать List в Array и вернуть его */
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
    /* Инициализировать стек */
    LinkedListStack *stack = new LinkedListStack();

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
