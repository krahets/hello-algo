/**
 * File: array_queue.c
 * Created Time: 2023-01-28
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Очередь на основе кольцевого массива */
typedef struct {
    int *nums;       // Массив для хранения элементов очереди
    int front;       // Указатель head, указывающий на первый элемент очереди
    int queSize;     // Указатель хвоста, указывающий на позицию после хвоста
    int queCapacity; // Вместимость очереди
} ArrayQueue;

/* Конструктор */
ArrayQueue *newArrayQueue(int capacity) {
    ArrayQueue *queue = (ArrayQueue *)malloc(sizeof(ArrayQueue));
    // Инициализация массива
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

/* Получить вместимость очереди */
int capacity(ArrayQueue *queue) {
    return queue->queCapacity;
}

/* Получение длины очереди */
int size(ArrayQueue *queue) {
    return queue->queSize;
}

/* Проверка, пуста ли очередь */
bool empty(ArrayQueue *queue) {
    return queue->queSize == 0;
}

/* Доступ к элементу в начале очереди */
int peek(ArrayQueue *queue) {
    assert(size(queue) != 0);
    return queue->nums[queue->front];
}

/* Поместить в очередь */
void push(ArrayQueue *queue, int num) {
    if (size(queue) == capacity(queue)) {
        printf("Очередь заполнена\r\n");
        return;
    }
    // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
    // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
    int rear = (queue->front + queue->queSize) % queue->queCapacity;
    // Добавить num в хвост очереди
    queue->nums[rear] = num;
    queue->queSize++;
}

/* Извлечь из очереди */
int pop(ArrayQueue *queue) {
    int num = peek(queue);
    // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
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

/* Driver Code */
int main() {
    /* Инициализация очереди */
    int capacity = 10;
    int queSize;
    ArrayQueue *queue = newArrayQueue(capacity);

    /* Добавление элемента в очередь */
    push(queue, 1);
    push(queue, 3);
    push(queue, 2);
    push(queue, 5);
    push(queue, 4);
    printf("Очередь queue = ");
    printArray(toArray(queue, &queSize), queSize);

    /* Доступ к элементу в начале очереди */
    int peekNum = peek(queue);
    printf("Элемент в голове peek = %d\r\n", peekNum);

    /* Извлечение элемента из очереди */
    peekNum = pop(queue);
    printf("Извлечен элемент из очереди pop = %d, очередь после извлечения = ", peekNum);
    printArray(toArray(queue, &queSize), queSize);

    /* Получение длины очереди */
    int queueSize = size(queue);
    printf("Длина очереди size = %d\r\n", queueSize);

    /* Проверка, пуста ли очередь */
    bool isEmpty = empty(queue);
    printf("Пуста ли очередь = %s\r\n", isEmpty ? "true" : "false");

    /* Проверка кольцевого массива */
    for (int i = 0; i < 10; i++) {
        push(queue, i);
        pop(queue);
        printf("После %d-го цикла enqueue + dequeue queue = ", i);
        printArray(toArray(queue, &queSize), queSize);
    }

    // Освободить память
    delArrayQueue(queue);

    return 0;
}