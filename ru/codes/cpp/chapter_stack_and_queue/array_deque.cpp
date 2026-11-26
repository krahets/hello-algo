/**
 * File: array_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Двусторонняя очередь (дек) на основе кольцевого массива */
class ArrayDeque {
  private:
    vector<int> nums; // Массив для хранения элементов дека
    int front;        // Индекс первого элемента дека
    int queSize;      // Длина дека

  public:
    /* Конструктор */
    ArrayDeque(int capacity) {
        nums.resize(capacity);
        front = queSize = 0;
    }

    /* Получить ёмкость дека */
    int capacity() {
        return nums.size();
    }

    /* Получить длину дека */
    int size() {
        return queSize;
    }

    /* Проверить, пуст ли дек */
    bool isEmpty() {
        return queSize == 0;
    }

    /* Вычислить индекс в кольцевом массиве */
    int index(int i) {
        // Операция взятия остатка связывает конец массива с его началом
        // Если индекс i выходит за конец массива, отсчёт продолжается с начала
        // Если индекс i выходит за начало массива, отсчёт продолжается с конца
        return (i + capacity()) % capacity();
    }

    /* Добавить элемент в начало дека */
    void pushFirst(int num) {
        if (queSize == capacity()) {
            cout << "Дек заполнен" << endl;
            return;
        }
        // Сдвинуть индекс начала дека на одну позицию влево
        // При выходе за начало массива операция взятия остатка возвращает front в конец
        front = index(front - 1);
        // Добавить num в начало дека
        nums[front] = num;
        queSize++;
    }

    /* Добавить элемент в конец дека */
    void pushLast(int num) {
        if (queSize == capacity()) {
            cout << "Дек заполнен" << endl;
            return;
        }
        // Вычислить индекс вставки в конец дека: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        int rear = index(front + queSize);
        // Добавить num в конец дека
        nums[rear] = num;
        queSize++;
    }

    /* Извлечь элемент из начала дека */
    int popFirst() {
        int num = peekFirst();
        // Сдвинуть индекс начала дека на одну позицию вперёд
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* Извлечь элемент из конца дека */
    int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* Посмотреть первый элемент дека */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("Дек пуст");
        return nums[front];
    }

    /* Посмотреть последний элемент дека */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("Дек пуст");
        // Вычислить индекс последнего элемента
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* Вернуть динамический массив для вывода */
    vector<int> toVector() {
        // Преобразовать только те элементы, которые сейчас находятся в деке
        vector<int> res(queSize);
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
};

/* Пример использования */
int main() {
    /* Инициализировать дек */
    ArrayDeque *deque = new ArrayDeque(10);
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
    cout << "После добавления 4 в конец дека deque = ";
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
    return 0;
}
