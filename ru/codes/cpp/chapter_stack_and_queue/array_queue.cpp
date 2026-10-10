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
    int front;       // Указатель head, указывающий на первый элемент очереди
    int queSize;     // Длина очереди
    int queCapacity; // Вместимость очереди

  public:
    ArrayQueue(int capacity) {
        // Инициализация массива
        nums = new int[capacity];
        queCapacity = capacity;
        front = queSize = 0;
    }

    ~ArrayQueue() {
        delete[] nums;
    }

    /* Получить вместимость очереди */
    int capacity() {
        return queCapacity;
    }

    /* Получение длины очереди */
    int size() {
        return queSize;
    }

    /* Проверка, пуста ли очередь */
    bool isEmpty() {
        return size() == 0;
    }

    /* Поместить в очередь */
    void push(int num) {
        if (queSize == queCapacity) {
            cout << "Очередь заполнена" << endl;
            return;
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
        int rear = (front + queSize) % queCapacity;
        // Добавить num в хвост очереди
        nums[rear] = num;
        queSize++;
    }

    /* Извлечь из очереди */
    int pop() {
        int num = peek();
        // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
        front = (front + 1) % queCapacity;
        queSize--;
        return num;
    }

    /* Доступ к элементу в начале очереди */
    int peek() {
        if (isEmpty())
            throw out_of_range("очередь пуста");
        return nums[front];
    }

    /* Преобразовать массив в Vector и вернуть */
    vector<int> toVector() {
        // Преобразовывать только элементы списка в пределах фактической длины
        vector<int> arr(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            arr[i] = nums[j % queCapacity];
        }
        return arr;
    }
};

/* Driver Code */
int main() {
    /* Инициализация очереди */
    int capacity = 10;
    ArrayQueue *queue = new ArrayQueue(capacity);

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

    /* Проверка кольцевого массива */
    for (int i = 0; i < 10; i++) {
        queue->push(i);
        queue->pop();
        cout << "После " << i << "-го раунда операций enqueue и dequeue queue = ";
        printVector(queue->toVector());
    }

    // Освободить память
    delete queue;

    return 0;
}
