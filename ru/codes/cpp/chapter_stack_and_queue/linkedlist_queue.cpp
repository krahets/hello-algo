/**
 * File: linkedlist_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Очередь на основе связного списка */
class LinkedListQueue {
  private:
    ListNode *front, *rear; // Головной узел front, хвостовой узел rear
    int queSize;

  public:
    LinkedListQueue() {
        front = nullptr;
        rear = nullptr;
        queSize = 0;
    }

    ~LinkedListQueue() {
        // Обходить связный список, удалять узлы и освобождать память
        freeMemoryLinkedList(front);
    }

    /* Получение длины очереди */
    int size() {
        return queSize;
    }

    /* Проверка, пуста ли очередь */
    bool isEmpty() {
        return queSize == 0;
    }

    /* Поместить в очередь */
    void push(int num) {
        // Добавить num после хвостового узла
        ListNode *node = new ListNode(num);
        // Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
        if (front == nullptr) {
            front = node;
            rear = node;
        }
        // Если очередь не пуста, добавить этот узел после хвостового узла
        else {
            rear->next = node;
            rear = node;
        }
        queSize++;
    }

    /* Извлечь из очереди */
    int pop() {
        int num = peek();
        // Удалить головной узел
        ListNode *tmp = front;
        front = front->next;
        // Освободить память
        delete tmp;
        queSize--;
        return num;
    }

    /* Доступ к элементу в начале очереди */
    int peek() {
        if (size() == 0)
            throw out_of_range("очередь пуста");
        return front->val;
    }

    /* Преобразовать связный список в Vector и вернуть */
    vector<int> toVector() {
        ListNode *node = front;
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
    /* Инициализация очереди */
    LinkedListQueue *queue = new LinkedListQueue();

    /* Добавление элемента в очередь */
    queue->push(1);
    queue->push(3);
    queue->push(2);
    queue->push(5);
    queue->push(4);
    cout << "Очередь queue = ";
    printVector(queue->toVector());

    /* Доступ к элементу в начале очереди */
    int peek = queue->peek();
    cout << "Первый элемент peek = " << peek << endl;

    /* Извлечение элемента из очереди */
    peek = queue->pop();
    cout << "Извлеченный элемент pop = " << peek << ", queue после извлечения = ";
    printVector(queue->toVector());

    /* Получение длины очереди */
    int size = queue->size();
    cout << "Длина очереди size = " << size << endl;

    /* Проверка, пуста ли очередь */
    bool empty = queue->isEmpty();
    cout << "Пуста ли очередь = " << empty << endl;

    // Освободить память
    delete queue;

    return 0;
}
