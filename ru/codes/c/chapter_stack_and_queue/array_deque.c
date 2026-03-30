/**
 * File: array_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Двусторонняя очередь на основе кольцевого массива */
typedef struct {
    int *nums;       // Массив для хранения элементов очереди
    int front;       // Указатель head, указывающий на первый элемент очереди
    int queSize;     // Указатель хвоста, указывающий на позицию после хвоста
    int queCapacity; // Вместимость очереди
} ArrayDeque;

/* Конструктор */
ArrayDeque *newArrayDeque(int capacity) {
    ArrayDeque *deque = (ArrayDeque *)malloc(sizeof(ArrayDeque));
    // Инициализация массива
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

/* Получить вместимость двусторонней очереди */
int capacity(ArrayDeque *deque) {
    return deque->queCapacity;
}

/* Получение длины двусторонней очереди */
int size(ArrayDeque *deque) {
    return deque->queSize;
}

/* Проверка, пуста ли двусторонняя очередь */
bool empty(ArrayDeque *deque) {
    return deque->queSize == 0;
}

/* Вычислить индекс в кольцевом массиве */
int dequeIndex(ArrayDeque *deque, int i) {
    // С помощью операции взятия остатка соединить начало и конец массива
    // Когда i выходит за хвост массива, вернуться к началу
    // Когда i выходит за голову массива, вернуться к концу
    return ((i + capacity(deque)) % capacity(deque));
}

/* Добавление в голову очереди */
void pushFirst(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("Дек заполнен\r\n");
        return;
    }
    // Указатель головы сместить влево на одну позицию
    // С помощью операции взятия остатка реализовать возврат front к хвосту после выхода за начало массива
    deque->front = dequeIndex(deque, deque->front - 1);
    // Добавить num в голову очереди
    deque->nums[deque->front] = num;
    deque->queSize++;
}

/* Добавление в хвост очереди */
void pushLast(ArrayDeque *deque, int num) {
    if (deque->queSize == capacity(deque)) {
        printf("Дек заполнен\r\n");
        return;
    }
    // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
    int rear = dequeIndex(deque, deque->front + deque->queSize);
    // Добавить num в хвост очереди
    deque->nums[rear] = num;
    deque->queSize++;
}

/* Доступ к элементу в начале очереди */
int peekFirst(ArrayDeque *deque) {
    // Ошибка доступа: двусторонняя очередь пуста
    assert(empty(deque) == 0);
    return deque->nums[deque->front];
}

/* Доступ к элементу в конце очереди */
int peekLast(ArrayDeque *deque) {
    // Ошибка доступа: двусторонняя очередь пуста
    assert(empty(deque) == 0);
    int last = dequeIndex(deque, deque->front + deque->queSize - 1);
    return deque->nums[last];
}

/* Извлечение из головы очереди */
int popFirst(ArrayDeque *deque) {
    int num = peekFirst(deque);
    // Указатель головы сдвигается на одну позицию назад
    deque->front = dequeIndex(deque, deque->front + 1);
    deque->queSize--;
    return num;
}

/* Извлечение из хвоста очереди */
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

/* Driver Code */
int main() {
    /* Инициализация очереди */
    int capacity = 10;
    int queSize;
    ArrayDeque *deque = newArrayDeque(capacity);
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("Дек deque = ");
    printArray(toArray(deque, &queSize), queSize);

    /* Доступ к элементу */
    int peekFirstNum = peekFirst(deque);
    printf("Элемент в голове peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("Элемент в хвосте peekLast = %d\r\n", peekLastNum);

    /* Добавление элемента в очередь */
    pushLast(deque, 4);
    printf("После вставки элемента 4 в хвост дек = ");
    printArray(toArray(deque, &queSize), queSize);
    pushFirst(deque, 1);
    printf("После вставки элемента 1 в голову дек = ");
    printArray(toArray(deque, &queSize), queSize);

    /* Извлечение элемента из очереди */
    int popLastNum = popLast(deque);
    printf("Извлечен элемент из хвоста = %d, дек после извлечения из хвоста = ", popLastNum);
    printArray(toArray(deque, &queSize), queSize);
    int popFirstNum = popFirst(deque);
    printf("Извлечен элемент из головы = %d, дек после извлечения из головы = ", popFirstNum);
    printArray(toArray(deque, &queSize), queSize);

    /* Получение длины очереди */
    int dequeSize = size(deque);
    printf("Длина дека size = %d\r\n", dequeSize);

    /* Проверка, пуста ли очередь */
    bool isEmpty = empty(deque);
    printf("Пуста ли очередь = %s\r\n", isEmpty ? "true" : "false");

    // Освободить память
    delArrayDeque(deque);

    return 0;
}