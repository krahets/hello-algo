/**
 * File: array_queue.c
 * Created Time: 2023-01-28
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Очередь на основе кольцевого массива */
typedef struct {
    int *nums;       // Массив для хранения элементов очереди
    int front;       // Индекс первого элемента очереди
    int queSize;     // Текущее число элементов в очереди
    int queCapacity; // Ёмкость очереди
} ArrayQueue;

/* Конструктор */
ArrayQueue *newArrayQueue(int capacity) {
    ArrayQueue *queue = (ArrayQueue *)malloc(sizeof(ArrayQueue));
    // Инициализировать массив
    queue->queCapacity = capacity;
    queue->nums = (int *)malloc(sizeof(int) * queue->queCapacity);
    queue->front = queue->queSize = 0;
    return queue;
}

/* Деструктор */
void delArrayQueue(ArrayQueue *queue) {
    free(queue->nums);
    free(queue);
}

/* Получить ёмкость очереди */
int capacity(ArrayQueue *queue) {
    return queue->queCapacity;
}

/* Получить длину очереди */
int size(ArrayQueue *queue) {
    return queue->queSize;
}

/* Проверить, пуста ли очередь */
bool empty(ArrayQueue *queue) {
    return queue->queSize == 0;
}

/* Посмотреть первый элемент очереди */
int peek(ArrayQueue *queue) {
    assert(size(queue) != 0);
    return queue->nums[queue->front];
}

/* Добавить элемент в очередь */
void push(ArrayQueue *queue, int num) {
    if (size(queue) == capacity(queue)) {
        printf("Очередь заполнена\r\n");
        return;
    }
    // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
    // При выходе за конец массива операция взятия остатка возвращает rear в начало
    int rear = (queue->front + queue->queSize) % queue->queCapacity;
    // Добавить num в конец очереди
    queue->nums[rear] = num;
    queue->queSize++;
}

/* Извлечь элемент из очереди */
int pop(ArrayQueue *queue) {
    int num = peek(queue);
    // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
    queue->front = (queue->front + 1) % queue->queCapacity;
    queue->queSize--;
    return num;
}

/* Вернуть массив для вывода */
int *toArray(ArrayQueue *queue, int *queSize) {
    *queSize = queue->queSize;
    int *res = (int *)calloc(queue->queSize, sizeof(int));
    int j = queue->front;
    for (int i = 0; i < queue->queSize; i++) {
        res[i] = queue->nums[j % queue->queCapacity];
        j++;
    }
    return res;
}

/* Пример использования */
int main() {
    /* Инициализировать очередь */
    int capacity = 10;
    int queSize;
    ArrayQueue *queue = newArrayQueue(capacity);

    /* Добавить элементы в очередь */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("Очередь queue = ");
    printArray(toArray(queue, &queSize), queSize);

    /* Посмотреть первый элемент очереди */
    int peekNum = peek(queue);
    printf("Первый элемент очереди peek = %d\r\n", peekNum);

    /* Извлечь элемент из очереди */
    peekNum = pop(queue);
    printf("Извлечённый элемент pop = %d, после извлечения queue = ", peekNum);
    printArray(toArray(queue, &queSize), queSize);

    /* Получить длину очереди */
    int queueSize = size(queue);
    printf("Длина очереди size = %d\r\n", queueSize);

    /* Проверить, пуста ли очередь */
    bool isEmpty = empty(queue);
    printf("Очередь пуста = %s\r\n", isEmpty ? "true" : "false");

    /* Проверить работу кольцевого массива */
    for (int i = 0; i < 10; i++) {
        push(queue, i);
        pop(queue);
        printf("В цикле %d после добавления и извлечения элемента queue = ", i);
        printArray(toArray(queue, &queSize), queSize);
    }

    // Освободить память
    delArrayQueue(queue);

    return 0;
}