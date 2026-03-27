/**
 * File: linkedlist_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Узел двусвязного списка */
struct DoublyListNode {
    int val;              // Значение узла
    DoublyListNode *next; // Указатель на узел-преемник
    DoublyListNode *prev; // Указатель на узел-предшественник
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

    /* Метод-деструктор */
    ~LinkedListDeque() {
        // Обходить связный список, удалять узлы и освобождать память
        DoublyListNode *pre, *cur = front;
        while (cur != nullptr) {
            pre = cur;
            cur = cur->next;
            delete pre;
        }
    }

    /* Получение длины двусторонней очереди */
    int size() {
        return queSize;
    }

    /* Проверка, пуста ли двусторонняя очередь */
    bool isEmpty() {
        return size() == 0;
    }

    /* Операция добавления в очередь */
    void push(int num, bool isFront) {
        DoublyListNode *node = new DoublyListNode(num);
        // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
        if (isEmpty())
            front = rear = node;
        // Операция добавления в голову очереди
        else if (isFront) {
            // Добавить node в голову списка
            front->prev = node;
            node->next = front;
            front = node; // Обновить головной узел
        // Операция добавления в хвост очереди
        } else {
            // Добавить node в хвост списка
            rear->next = node;
            node->prev = rear;
            rear = node; // Обновить хвостовой узел
        }
        queSize++; // Обновить длину очереди
    }

    /* Добавление в голову очереди */
    void pushFirst(int num) {
        push(num, true);
    }

    /* Добавление в хвост очереди */
    void pushLast(int num) {
        push(num, false);
    }

    /* Операция извлечения из очереди */
    int pop(bool isFront) {
        if (isEmpty())
            throw out_of_range("очередь пуста");
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
        queSize--; // Обновить длину очереди
        return val;
    }

    /* Извлечение из головы очереди */
    int popFirst() {
        return pop(true);
    }

    /* Извлечение из хвоста очереди */
    int popLast() {
        return pop(false);
    }

    /* Доступ к элементу в начале очереди */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("двусторонняя очередь пуста");
        return front->val;
    }

    /* Доступ к элементу в конце очереди */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("двусторонняя очередь пуста");
        return rear->val;
    }

    /* Вернуть массив для вывода */
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
    /* Инициализация двусторонней очереди */
    LinkedListDeque *deque = new LinkedListDeque();
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "Двусторонняя очередь deque = ";
    printVector(deque->toVector());

    /* Доступ к элементу */
    int peekFirst = deque->peekFirst();
    cout << "Первый элемент peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "Последний элемент peekLast = " << peekLast << endl;

    /* Добавление элемента в очередь */
    deque->pushLast(4);
    cout << "После добавления элемента 4 в хвост deque =";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "После добавления элемента 1 в голову deque = ";
    printVector(deque->toVector());

    /* Извлечение элемента из очереди */
    int popLast = deque->popLast();
    cout << "Извлеченный из хвоста элемент = " << popLast << ", deque после извлечения из хвоста = ";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "Извлеченный из головы элемент = " << popFirst << ", deque после извлечения из головы = ";
    printVector(deque->toVector());

    /* Получение длины двусторонней очереди */
    int size = deque->size();
    cout << "Длина двусторонней очереди size = " << size << endl;

    /* Проверка, пуста ли двусторонняя очередь */
    bool isEmpty = deque->isEmpty();
    cout << "Пуста ли двусторонняя очередь = " << boolalpha << isEmpty << endl;

    // Освободить память
    delete deque;

    return 0;
}
