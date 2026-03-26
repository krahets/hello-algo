/**
 * File: array_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Двусторонняя очередь на основе циклического массива */
class ArrayDeque {
  private:
    vector<int> nums; // Массив для хранения элементов двусторонней очереди
    int front;        // Указатель front, указывающий на первый элемент очереди
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

    /* Получить длину двусторонней очереди */
    int size() {
        return queSize;
    }

    /* Проверить, пуста ли двусторонняя очередь */
    bool isEmpty() {
        return queSize == 0;
    }

    /* Вычислить индекс циклического массива */
    int index(int i) {
        // Сделать начало и конец массива циклически связанными с помощью операции взятия по модулю
        // Когда i выходит за конец массива, он возвращается к началу
        // Когда i выходит за начало массива, он возвращается к концу
        return (i + capacity()) % capacity();
    }

    /* Поместить в голову очереди */
    void pushFirst(int num) {
        if (queSize == capacity()) {
            cout << "двусторонняя очередьзаполнен" << endl;
            return;
        }
        // Указатель головы очереди сдвигается на одну позицию влево
        // Операция взятия по модулю позволяет front после выхода за начало массива вернуться к его концу
        front = index(front - 1);
        // Добавить num в голову очереди
        nums[front] = num;
        queSize++;
    }

    /* Поместить в хвост очереди */
    void pushLast(int num) {
        if (queSize == capacity()) {
            cout << "двусторонняя очередьзаполнен" << endl;
            return;
        }
        // Вычислить указатель хвоста, указывающий на индекс за последним элементом
        int rear = index(front + queSize);
        // Добавить num в конец очереди
        nums[rear] = num;
        queSize++;
    }

    /* Извлечь из головы очереди */
    int popFirst() {
        int num = peekFirst();
        // Указатель головы очереди сдвигается на одну позицию вперед
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* Извлечь из хвоста очереди */
    int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* Получить элемент в начале очереди */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("двусторонняя очередьпуст");
        return nums[front];
    }

    /* Обратиться к элементу в хвосте очереди */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("двусторонняя очередьпуст");
        // Вычислить индекс хвостового элемента
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* Вернуть массив для печати */
    vector<int> toVector() {
        // Преобразовать только элементы списка в пределах действительной длины
        vector<int> res(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
};

/* Driver Code */
int main() {
    /* Инициализировать двустороннюю очередь */
    ArrayDeque *deque = new ArrayDeque(10);
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "двусторонняя очередь deque =";
    printVector(deque->toVector());

    /* Получить доступ к элементу */
    int peekFirst = deque->peekFirst();
    cout << "элемент в голове очереди peekFirst =" << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "элемент в хвосте очереди peekLast =" << peekLast << endl;

    /* Поместить элемент в очередь */
    deque->pushLast(4);
    cout << "После помещения элемента 4 в хвост очереди deque =";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "После помещения элемента 1 в голову очереди deque =";
    printVector(deque->toVector());

    /* Извлечь элемент из очереди */
    int popLast = deque->popLast();
    cout << "Элемент, извлеченный из хвоста очереди, =" << popLast << ", deque после извлечения из хвоста =";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "Элемент, извлеченный из головы очереди, =" << popFirst << ", deque после извлечения из головы =";
    printVector(deque->toVector());

    /* Получить длину двусторонней очереди */
    int size = deque->size();
    cout << "Длина двусторонней очереди size = " << size << endl;

    /* Проверить, пуста ли двусторонняя очередь */
    bool isEmpty = deque->isEmpty();
    cout << "двусторонняя Очередь пуста:" << boolalpha << isEmpty << endl;
    return 0;
}
