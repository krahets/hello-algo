/**
 * File: array_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Двусторонняя очередь (дек) на основе кольцевого массива */
typedef struct {
    int *nums;       // Массив для хранения элементов дека
    int front;       // Индекс первого элемента дека
    int queSize;     // Число элементов в деке
    int queCapacity; // Ёмкость дека
} ArrayDeque;

/* Конструктор */
ArrayDeque *newArrayDeque(int capacity) {
    ArrayDeque *deque = (ArrayDeque *)malloc(sizeof(ArrayDeque));
    // Инициализировать массив
    deque->queCapacity = capacity;
    deque->nums = (int *)malloc(sizeof(int) * deque->queCapacity);
    deque->front = deque->queSize = 0;
    return deque;
}

/* Деструктор */
void delArrayDeque(ArrayDeque *deque) {
    free(deque->nums);
    free(deque);
}

/* Получить ёмкость дека */
int capacity(ArrayDeque *deque) {
    return deque->queCapacity;
}

/* Получить длину дека */
int size(ArrayDeque *deque) {
    return deque->queSize;
}

/* Проверить, пуст ли дек */
bool empty(ArrayDeque *deque) {
    return deque->queSize == 0;
}

/* Вычислить индекс в кольцевом массиве */
int dequeIndex(ArrayDeque *deque, int i) {
    // Операция взятия остатка связывает конец массива с его началом
    // Если индекс i выходит за конец массива, отсчёт продолжается с начала
    // Если индекс i выходит за начало массива, отсчёт продолжается с конца
    return ((i + capacity(deque)) % capacity(deque));
}

/* Добавить элемент в начало дека */
void pushFirst(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("Дек заполнен\r\n");
        return;
    }
    // Сдвинуть индекс начала дека на одну позицию влево
    // При выходе за начало массива операция взятия остатка возвращает front в конец
    deque->front = dequeIndex(deque, deque->front - 1);
    // Добавить num в начало дека
    deque->nums[deque->front] = num;
    deque->queSize++;
}

/* Добавить элемент в конец дека */
void pushLast(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("Дек заполнен\r\n");
        return;
    }
    // Вычислить индекс вставки в конец дека: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
    int rear = dequeIndex(deque, deque->front + deque->queSize);
    // Добавить num в конец дека
    deque->nums[rear] = num;
    deque->queSize++;
}

/* Посмотреть первый элемент дека */
int peekFirst(ArrayDeque *deque) {
    // Ошибка доступа: дек пуст
    assert(empty(deque) == 0);
    return deque->nums[deque->front];
}

/* Посмотреть последний элемент дека */
int peekLast(ArrayDeque *deque) {
    // Ошибка доступа: дек пуст
    assert(empty(deque) == 0);
    int last = dequeIndex(deque, deque->front + deque->queSize - 1);
    return deque->nums[last];
}

/* Извлечь элемент из начала дека */
int popFirst(ArrayDeque *deque) {
    int num = peekFirst(deque);
    // Сдвинуть индекс начала дека на одну позицию вперёд
    deque->front = dequeIndex(deque, deque->front + 1);
    deque->queSize--;
    return num;
}

/* Извлечь элемент из конца дека */
int popLast(ArrayDeque *deque) {
    int num = peekLast(deque);
    deque->queSize--;
    return num;
}

/* Вернуть массив для вывода */
int *toArray(ArrayDeque *deque, int *queSize) {
    *queSize = deque->queSize;
    int *res = (int *)calloc(deque->queSize, sizeof(int));
    int j = deque->front;
    for (int i = 0; i < deque->queSize; i++) {
        res[i] = deque->nums[j % deque->queCapacity];
        j++;
    }
    return res;
}

/* Пример использования */
int main() {
    /* Инициализировать дек */
    int capacity = 10;
    int queSize;
    ArrayDeque *deque = newArrayDeque(capacity);
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("Дек deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* Посмотреть первый и последний элементы */
    int peekFirstNum = peekFirst(deque);
    printf("Первый элемент дека peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("Последний элемент дека peekLast = %d\r\n", peekLastNum);

    /* Добавить элементы в дек */
    pushLast(deque, 4);
    printf("После добавления 4 в конец дека deque = ");
    printArray(toArray(deque, &queSize), queSize);
    pushFirst(deque, 1);
    printf("После добавления 1 в начало дека deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* Извлечь элементы из дека */
    int popLastNum = popLast(deque);
    printf("Извлечённый последний элемент = %d, после извлечения deque= ", popLastNum);
    printArray(toArray(deque, &queSize), queSize);
    int popFirstNum = popFirst(deque);
    printf("Извлечённый первый элемент = %d, после извлечения deque= ", popFirstNum);
    printArray(toArray(deque, &queSize), queSize);

    /* Получить длину дека */
    int dequeSize = size(deque);
    printf("Длина дека size = %d\r\n", dequeSize);

    /* Проверить, пуст ли дек */
    bool isEmpty = empty(deque);
    printf("Дек пуст = %s\r\n", isEmpty ? "true" : "false");

    // Освободить память
    delArrayDeque(deque);

    return 0;
}