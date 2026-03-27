/**
 * File: array_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Двусторонняя очередь на основе кольцевого массива */
class ArrayDeque {
  private:
    vector<int> nums; // Массив для хранения элементов двусторонней очереди
    int front;        // Указатель head, указывающий на первый элемент очереди
    int queSize;      // Длина двусторонней очереди

  public:
    /* Конструктор */
    ArrayDeque(int capacity) {
        nums.resize(capacity);
        front = queSize = 0;
    }

    /* Получить вместимость двусторонней очереди */
    int capacity() {
        return nums.size();
    }

    /* Получение длины двусторонней очереди */
    int size() {
        return queSize;
    }

    /* Проверка, пуста ли двусторонняя очередь */
    bool isEmpty() {
        return queSize == 0;
    }

    /* Вычислить индекс в кольцевом массиве */
    int index(int i) {
        // С помощью операции взятия по модулю соединить начало и конец массива
        // Когда i выходит за конец массива, он возвращается в начало
        // Когда i выходит за начало массива, он возвращается в конец
        return (i + capacity()) % capacity();
    }

    /* Добавление в голову очереди */
    void pushFirst(int num) {
        if (queSize == capacity()) {
            cout << "Двусторонняя очередь заполнена" << endl;
            return;
        }
        // Указатель головы сдвигается на одну позицию влево
        // С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
        front = index(front - 1);
        // Добавить num в голову очереди
        nums[front] = num;
        queSize++;
    }

    /* Добавление в хвост очереди */
    void pushLast(int num) {
        if (queSize == capacity()) {
            cout << "Двусторонняя очередь заполнена" << endl;
            return;
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        int rear = index(front + queSize);
        // Добавить num в хвост очереди
        nums[rear] = num;
        queSize++;
    }

    /* Извлечение из головы очереди */
    int popFirst() {
        int num = peekFirst();
        // Указатель головы сдвигается на одну позицию назад
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* Извлечение из хвоста очереди */
    int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* Доступ к элементу в начале очереди */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("двусторонняя очередь пуста");
        return nums[front];
    }

    /* Доступ к элементу в конце очереди */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("двусторонняя очередь пуста");
        // Вычислить индекс хвостового элемента
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* Вернуть массив для вывода */
    vector<int> toVector() {
        // Преобразовывать только элементы списка в пределах фактической длины
        vector<int> res(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
};

/* Driver Code */
int main() {
    /* Инициализация двусторонней очереди */
    ArrayDeque *deque = new ArrayDeque(10);
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
    cout << "После добавления элемента 4 в хвост deque = ";
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
    return 0;
}
