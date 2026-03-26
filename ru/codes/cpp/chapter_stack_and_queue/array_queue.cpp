/**
 * File: array_queue.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Очередь на основе циклического массива */
class ArrayQueue {
  private:
    int *nums;       // Массив для хранения элементов очереди
    int front;       // Указатель front, указывающий на первый элемент очереди
    int queSize;     // Длина очереди
    int queCapacity; // вместимость очереди

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

    /* Получить вместимость очереди */
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

    /* Поместить в очередь */
    void push(int num) {
        if (queSize == queCapacity) {
            cout << "очередьзаполнен" << endl;
            return;
        }
        // Вычислить указатель хвоста очереди, указывающий на индекс хвоста + 1
        // Операция взятия по модулю позволяет rear после выхода за конец массива вернуться к его началу
        int rear = (front + queSize) % queCapacity;
        // Добавить num в конец очереди
        nums[rear] = num;
        queSize++;
    }

    /* Извлечь из очереди */
    int pop() {
        int num = peek();
        // Указатель головы очереди сдвигается на одну позицию вперед; если он выходит за конец, то возвращается в начало массива
        front = (front + 1) % queCapacity;
        queSize--;
        return num;
    }

    /* Получить элемент в начале очереди */
    int peek() {
        if (isEmpty())
            throw out_of_range("очередьпуст");
        return nums[front];
    }

    /* Преобразовать массив в Vector и вернуть */
    vector<int> toVector() {
        // Преобразовать только элементы списка в пределах действительной длины
        vector<int> arr(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            arr[i] = nums[j % queCapacity];
        }
        return arr;
    }
};

/* Driver Code */
int main() {
    /* Инициализировать очередь */
    int capacity = 10;
    ArrayQueue *queue = new ArrayQueue(capacity);

    /* Поместить элемент в очередь */
    queue->push(1);
    queue->push(3);
    queue->push(2);
    queue->push(5);
    queue->push(4);
    cout << "очередь queue =";
    printVector(queue->toVector());

    /* Получить элемент в начале очереди */
    int peek = queue->peek();
    cout << "элемент в голове очереди peek =" << peek << endl;

    /* Извлечь элемент из очереди */
    peek = queue->pop();
    cout << "Элемент, извлеченный из очереди, pop =" << peek << ", queue после извлечения =";
    printVector(queue->toVector());

    /* Получить длину очереди */
    int size = queue->size();
    cout << "Длина очереди size =" << size << endl;

    /* Проверить, пуста ли очередь */
    bool empty = queue->isEmpty();
    cout << "Очередь пуста:" << empty << endl;

    /* Проверить кольцевой массив */
    for (int i = 0; i < 10; i++) {
        queue->push(i);
        queue->pop();
        cout << "Итерация" << i << ": после enqueue + dequeue queue =";
        printVector(queue->toVector());
    }

    // Освободить память
    delete queue;

    return 0;
}
