/**
 * File: linkedlist_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Узел двусвязного списка */
struct DoublyListNode {
    int val;              // Значение узла
    DoublyListNode *next; // Указатель на следующий узел
    DoublyListNode *prev; // Указатель на предыдущий узел
    DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
    }
};

/* Двусторонняя очередь (дек) на основе двусвязного списка */
class LinkedListDeque {
  private:
    DoublyListNode *front, *rear; // front — первый узел, rear — последний
    int queSize = 0;              // Длина дека

  public:
    /* Конструктор */
    LinkedListDeque() : front(nullptr), rear(nullptr) {
    }

    /* Деструктор */
    ~LinkedListDeque() {
        // Пройти по связному списку и удалить узлы, освободив память
        DoublyListNode *pre, *cur = front;
        while (cur != nullptr) {
            pre = cur;
            cur = cur->next;
            delete pre;
        }
    }

    /* Получить длину дека */
    int size() {
        return queSize;
    }

    /* Проверить, пуст ли дек */
    bool isEmpty() {
        return size() == 0;
    }

    /* Добавить элемент в дек */
    void push(int num, bool isFront) {
        DoublyListNode *node = new DoublyListNode(num);
        // Если связный список пуст, присвоить обоим указателям, front и rear, значение node
        if (isEmpty())
            front = rear = node;
        // Добавить элемент в начало дека
        else if (isFront) {
            // Добавить node в начало связного списка
            front->prev = node;
            node->next = front;
            front = node; // Обновить ссылку на первый узел
        // Добавить элемент в конец дека
        } else {
            // Добавить node в конец связного списка
            rear->next = node;
            node->prev = rear;
            rear = node; // Обновить ссылку на последний узел
        }
        queSize++; // Обновить длину дека
    }

    /* Добавить элемент в начало дека */
    void pushFirst(int num) {
        push(num, true);
    }

    /* Добавить элемент в конец дека */
    void pushLast(int num) {
        push(num, false);
    }

    /* Извлечь элемент из дека */
    int pop(bool isFront) {
        if (isEmpty())
            throw out_of_range("Дек пуст");
        int val;
        // Если длина дека равна 1, ссылки на первый и последний узлы указывают на один и тот же узел
        if (queSize == 1) {
            val = front->val;
            delete front; // Оба указателя ссылаются на один узел, поэтому достаточно освободить его один раз
            front = nullptr;
            rear = nullptr;
        }
        // Извлечь элемент из начала дека
        else if (isFront) {
            val = front->val; // Временно сохранить значение первого узла
            // Удалить первый узел
            DoublyListNode *fNext = front->next;
            fNext->prev = nullptr;
            front->next = nullptr;
            delete front;
            front = fNext; // Обновить ссылку на первый узел
        // Извлечь элемент из конца дека
        } else {
            val = rear->val; // Временно сохранить значение последнего узла
            // Удалить последний узел
            DoublyListNode *rPrev = rear->prev;
            rPrev->next = nullptr;
            rear->prev = nullptr;
            delete rear;
            rear = rPrev; // Обновить ссылку на последний узел
        }
        queSize--; // Обновить длину дека
        return val;
    }

    /* Извлечь элемент из начала дека */
    int popFirst() {
        return pop(true);
    }

    /* Извлечь элемент из конца дека */
    int popLast() {
        return pop(false);
    }

    /* Посмотреть первый элемент дека */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("Дек пуст");
        return front->val;
    }

    /* Посмотреть последний элемент дека */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("Дек пуст");
        return rear->val;
    }

    /* Вернуть динамический массив для вывода */
    vector<int> toVector() {
        DoublyListNode *node = front;
        vector<int> res(size());
        for (int i = 0; i < res.size(); i++) {
            res[i] = node->val;
            node = node->next;
        }
        return res;
    }
};

/* Пример использования */
int main() {
    /* Инициализировать дек */
    LinkedListDeque *deque = new LinkedListDeque();
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "Дек deque = ";
    printVector(deque->toVector());

    /* Посмотреть первый и последний элементы */
    int peekFirst = deque->peekFirst();
    cout << "Первый элемент дека peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "Последний элемент дека peekLast = " << peekLast << endl;

    /* Добавить элементы в дек */
    deque->pushLast(4);
    cout << "После добавления 4 в конец дека deque =";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "После добавления 1 в начало дека deque = ";
    printVector(deque->toVector());

    /* Извлечь элементы из дека */
    int popLast = deque->popLast();
    cout << "Извлечённый последний элемент = " << popLast << ", после извлечения из конца deque = ";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "Извлечённый первый элемент = " << popFirst << ", после извлечения из начала deque = ";
    printVector(deque->toVector());

    /* Получить длину дека */
    int size = deque->size();
    cout << "Длина дека size = " << size << endl;

    /* Проверить, пуст ли дек */
    bool isEmpty = deque->isEmpty();
    cout << "Дек пуст = " << boolalpha << isEmpty << endl;

    // Освободить память
    delete deque;

    return 0;
}
