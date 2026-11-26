/**
 * File: linkedlist_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Стек на основе связного списка */
class LinkedListStack {
  private:
    ListNode *stackTop; // Первый узел списка служит вершиной стека
    int stkSize;        // Размер стека

  public:
    LinkedListStack() {
        stackTop = nullptr;
        stkSize = 0;
    }

    ~LinkedListStack() {
        // Пройти по связному списку и удалить узлы, освободив память
        freeMemoryLinkedList(stackTop);
    }

    /* Получить размер стека */
    int size() {
        return stkSize;
    }

    /* Проверить, пуст ли стек */
    bool isEmpty() {
        return size() == 0;
    }

    /* Поместить элемент в стек */
    void push(int num) {
        ListNode *node = new ListNode(num);
        node->next = stackTop;
        stackTop = node;
        stkSize++;
    }

    /* Снять элемент со стека */
    int pop() {
        int num = top();
        ListNode *tmp = stackTop;
        stackTop = stackTop->next;
        // Освободить память
        delete tmp;
        stkSize--;
        return num;
    }

    /* Посмотреть элемент на вершине стека */
    int top() {
        if (isEmpty())
            throw out_of_range("Стек пуст");
        return stackTop->val;
    }

    /* Преобразовать связный список в динамический массив и вернуть его */
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

/* Пример использования */
int main() {
    /* Инициализировать стек */
    LinkedListStack *stack = new LinkedListStack();

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
