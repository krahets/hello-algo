/**
 * File: array_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Очередь на основе кольцевого массива */
class ArrayQueue {
  private:
    int *nums;       // Массив для хранения элементов очереди
    int front;       // Индекс первого элемента очереди
    int queSize;     // Длина очереди
    int queCapacity; // Ёмкость очереди

  public:
    ArrayQueue(int capacity) {
        // Инициализировать массив
        nums = new int[capacity];
        queCapacity = capacity;
        front = queSize = 0;
    }

    ~ArrayQueue() {
        delete[] nums;
    }

    /* Получить ёмкость очереди */
    int capacity() {
        return queCapacity;
    }

    /* Получить длину очереди */
    int size() {
        return queSize;
    }

    /* Проверить, пуста ли очередь */
    bool isEmpty() {
        return size() == 0;
    }

    /* Добавить элемент в очередь */
    void push(int num) {
        if (queSize == queCapacity) {
            cout << "Очередь заполнена" << endl;
            return;
        }
        // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        // При выходе за конец массива операция взятия остатка возвращает rear в начало
        int rear = (front + queSize) % queCapacity;
        // Добавить num в конец очереди
        nums[rear] = num;
        queSize++;
    }

    /* Извлечь элемент из очереди */
    int pop() {
        int num = peek();
        // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
        front = (front + 1) % queCapacity;
        queSize--;
        return num;
    }

    /* Посмотреть первый элемент очереди */
    int peek() {
        if (isEmpty())
            throw out_of_range("Очередь пуста");
        return nums[front];
    }

    /* Преобразовать массив в вектор и вернуть его */
    vector<int> toVector() {
        // Преобразовать только те элементы, которые сейчас находятся в очереди
        vector<int> arr(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            arr[i] = nums[j % queCapacity];
        }
        return arr;
    }
};

/* Пример использования */
int main() {
    /* Инициализировать очередь */
    int capacity = 10;
    ArrayQueue *queue = new ArrayQueue(capacity);

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

    /* Проверить работу кольцевого массива */
    for (int i = 0; i < 10; i++) {
        queue->push(i);
        queue->pop();
        cout << "В цикле " << i << " после добавления и извлечения элемента queue = ";
        printVector(queue->toVector());
    }

    // Освободить память
    delete queue;

    return 0;
}
