/**
 * File: linkedlist_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Очередь на основе связного списка */
class LinkedListQueue {
  private:
    ListNode *front, *rear; // front — первый узел, rear — последний
    int queSize;

  public:
    LinkedListQueue() {
        front = nullptr;
        rear = nullptr;
        queSize = 0;
    }

    ~LinkedListQueue() {
        // Пройти по связному списку и удалить узлы, освободив память
        freeMemoryLinkedList(front);
    }

    /* Получить длину очереди */
    int size() {
        return queSize;
    }

    /* Проверить, пуста ли очередь */
    bool isEmpty() {
        return queSize == 0;
    }

    /* Добавить элемент в очередь */
    void push(int num) {
        // Добавить узел со значением num после последнего узла
        ListNode *node = new ListNode(num);
        // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
        if (front == nullptr) {
            front = node;
            rear = node;
        }
        // Если очередь непуста, добавить новый узел после последнего
        else {
            rear->next = node;
            rear = node;
        }
        queSize++;
    }

    /* Извлечь элемент из очереди */
    int pop() {
        int num = peek();
        // Удалить первый узел
        ListNode *tmp = front;
        front = front->next;
        // Освободить память
        delete tmp;
        queSize--;
        return num;
    }

    /* Посмотреть первый элемент очереди */
    int peek() {
        if (size() == 0)
            throw out_of_range("Очередь пуста");
        return front->val;
    }

    /* Преобразовать связный список в вектор и вернуть его */
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

/* Пример использования */
int main() {
    /* Инициализировать очередь */
    LinkedListQueue *queue = new LinkedListQueue();

    /* Добавить элементы в очередь */
    queue->push(1);
    queue->push(3);
    queue->push(2);
    queue->push(5);
    queue->push(4);
    cout << "Очередь queue = ";
    printVector(queue->toVector());

    /* Посмотреть первый элемент очереди */
    int peek = queue->peek();
    cout << "Первый элемент очереди peek = " << peek << endl;

    /* Извлечь элемент из очереди */
    peek = queue->pop();
    cout << "Извлечённый элемент pop = " << peek << ", после извлечения queue = ";
    printVector(queue->toVector());

    /* Получить длину очереди */
    int size = queue->size();
    cout << "Длина очереди size = " << size << endl;

    /* Проверить, пуста ли очередь */
    bool empty = queue->isEmpty();
    cout << "Очередь пуста = " << empty << endl;

    // Освободить память
    delete queue;

    return 0;
}
