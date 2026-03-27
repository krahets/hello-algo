/**
 * File: linkedlist_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Узел двусвязного списка */
struct DoublyListNode {
    int val;              // Значение узла
    DoublyListNode *next; // Указатель следующего узла
    DoublyListNode *prev; // Указатель предыдущего узла
    DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
    }
};

/* Двусторонняя очередь на основе двусвязного списка */
class LinkedListDeque {
  private:
    DoublyListNode *front, *rear; // Головной узел front, хвостовой узел rear
    int queSize = 0;              // Длина двусторонней очереди

  public:
    /* Конструктор */
    LinkedListDeque() : front(nullptr), rear(nullptr) {
    }

    /* Деструктор */
    ~LinkedListDeque() {
        // Обойти связный списокУдалить узел, Освободить память
        DoublyListNode *pre, *cur = front;
        while (cur != nullptr) {
            pre = cur;
            cur = cur->next;
            delete pre;
        }
    }

    /* Получить длину двусторонней очереди */
    int size() {
        return queSize;
    }

    /* Проверить, пуста ли двусторонняя очередь */
    bool isEmpty() {
        return size() == 0;
    }

    /* Операция помещения в очередь */
    void push(int num, bool isFront) {
        DoublyListNode *node = new DoublyListNode(num);
        // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
        if (isEmpty())
            front = rear = node;
        // Операция помещения в голову очереди
        else if (isFront) {
            // Добавить node в голову связного списка
            front->prev = node;
            node->next = front;
            front = node; // Обновить головной узел
        // Операция помещения в хвост очереди
        } else {
            // Добавить node в хвост связного списка
            rear->next = node;
            node->prev = rear;
            rear = node; // Обновить хвостовой узел
        }
        queSize++; // ОбновитьДлина очереди
    }

    /* Поместить в голову очереди */
    void pushFirst(int num) {
        push(num, true);
    }

    /* Поместить в хвост очереди */
    void pushLast(int num) {
        push(num, false);
    }

    /* Операция извлечения из очереди */
    int pop(bool isFront) {
        if (isEmpty())
            throw out_of_range("Очередь пуста");
        int val;
        // Операция извлечения из головы очереди
        if (isFront) {
            val = front->val; // Временно сохранить значение головного узла
            // Удалить головной узел
            DoublyListNode *fNext = front->next;
            if (fNext != nullptr) {
                fNext->prev = nullptr;
                front->next = nullptr;
            }
            delete front;
            front = fNext; // Обновить головной узел
        // Операция извлечения из хвоста очереди
        } else {
            val = rear->val; // Временно сохранить значение хвостового узла
            // Удалить хвостовой узел
            DoublyListNode *rPrev = rear->prev;
            if (rPrev != nullptr) {
                rPrev->next = nullptr;
                rear->prev = nullptr;
            }
            delete rear;
            rear = rPrev; // Обновить хвостовой узел
        }
        queSize--; // ОбновитьДлина очереди
        return val;
    }

    /* Извлечь из головы очереди */
    int popFirst() {
        return pop(true);
    }

    /* Извлечь из хвоста очереди */
    int popLast() {
        return pop(false);
    }

    /* Получить элемент в начале очереди */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("Двусторонняя очередь пуста");
        return front->val;
    }

    /* Обратиться к элементу в хвосте очереди */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("Двусторонняя очередь пуста");
        return rear->val;
    }

    /* Вернуть массив для печати */
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

/* Driver Code */
int main() {
    /* Инициализировать двустороннюю очередь */
    LinkedListDeque *deque = new LinkedListDeque();
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "Двусторонняя очередь deque = ";
    printVector(deque->toVector());

    /* Получить доступ к элементу */
    int peekFirst = deque->peekFirst();
    cout << "голова очередиэлемент peekFirst =" << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "хвост очередиэлемент peekLast =" << peekLast << endl;

    /* Поместить элемент в очередь */
    deque->pushLast(4);
    cout << "После помещения элемента 4 в хвост очереди deque =";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "После помещения элемента 1 в голову очереди deque = ";
    printVector(deque->toVector());

    /* Извлечь элемент из очереди */
    int popLast = deque->popLast();
    cout << "Элемент, извлеченный из хвоста очереди = " << popLast << ", deque после извлечения из хвоста = ";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "Элемент, извлеченный из головы очереди = " << popFirst << ", deque после извлечения из головы = ";
    printVector(deque->toVector());

    /* Получить длину двусторонней очереди */
    int size = deque->size();
    cout << "Длина двусторонней очереди size = " << size << endl;

    /* Проверить, пуста ли двусторонняя очередь */
    bool isEmpty = deque->isEmpty();
    cout << "Двусторонняя очередь пуста: " << boolalpha << isEmpty << endl;

    // Освободить память
    delete deque;

    return 0;
}
